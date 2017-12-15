//
//  TestRover.swift
//  MarsRoverTests
//
//  Created by Prieto Gonzalo, Jesus on 14/12/17.
//  Copyright © 2017 Prieto Gonzalo, Jesus. All rights reserved.
//

import XCTest
@testable import MarsRover

class TestRover: XCTestCase {

    var sut: Rover!

    override func setUp() {
        super.setUp()

        sut = Rover()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInitialXPositionIs0() {

        //Assert
        XCTAssertEqual(0, Rover.DEFAULT_X)
    }

    func testInitialYPositionIs0() {

        //Assert
        XCTAssertEqual(0, Rover.DEFAULT_Y)
    }

    func testRoverInitialXIsDefaultX() {

        //Assert
        XCTAssertEqual(Rover.DEFAULT_X, sut.x)
    }

    func testRoverInitialYIsDefaultY() {

        //Assert
        XCTAssertEqual(Rover.DEFAULT_Y, sut.y)
    }

    func testRoverInitialXPersist() {

        //Arrange
        sut = Rover(x: 5)

        //Assert
        XCTAssertEqual(5, sut.x)
    }

    func testRoverInitialYPersist() {

        //Arrange
        sut = Rover(y: 4)

        //Assert
        XCTAssertEqual(4, sut.y)
    }

    func testInitialDirectionIsNorth() {

        //Assert
        XCTAssertEqual(Orientation.north, Rover.DEFAULT_DIRECTION)
    }

    func testRoverInitialDirectionIsDefaultDirection() {

        //Assert
        XCTAssertEqual(Rover.DEFAULT_DIRECTION, sut.direction.getCurrentOrientation())
    }

    func testRoverInitialDirectionPersist() {

        //Arrange
        sut = Rover(direction: .south)

        //Assert
        XCTAssertEqual(.south, sut.direction.getCurrentOrientation())
    }

    func testRoverTurnRightCallOrientationTurnRight() {

        //Arrange
        let mock = OrientationMock()

        //Act
        sut.direction = mock
        sut.move(commands: "R")

        //Assert
        XCTAssertTrue(mock.turnRightOk)
    }

    func testRoverTurnLeftCallOrientationTurnLeft() {

        //Arrange
        let mock = OrientationMock()

        //Act
        sut.direction = mock
        sut.move(commands: "L")

        //Assert
        XCTAssertTrue(mock.turnLeftOk)
    }

    func testRoverTurnRightStoreRightOrientation() {

        //Arrange
        let mock = OrientationMock(expectedOrientation: .south)

        //Act
        sut.direction = mock
        sut.move(commands: "R")

        //Assert
        XCTAssertEqual(.south, sut.direction.getCurrentOrientation())
    }

    func testRoverTurnRightStoreRightOrientationDuply() {

        //Arrange
        let mock = OrientationMock(expectedOrientation: .east)

        //Act
        sut.move(commands: "R")

        //Assert
        sut.direction = mock
        XCTAssertEqual(.east, sut.direction.getCurrentOrientation())
    }

    func testRoverTurnLeftStoreRightOrientation() {

        //Arrange
        let mock = OrientationMock(expectedOrientation: .west)

        //Act
        sut.direction = mock
        sut.move(commands: "L")

        //Assert
        XCTAssertEqual(.west, sut.direction.getCurrentOrientation())
    }

    func testRoverTurnLeftStoreRightOrientationDuply() {

        //Arrange
        let mock = OrientationMock(expectedOrientation: .north)

        //Act
        sut.direction = mock
        sut.move(commands: "L")

        //Assert
        XCTAssertEqual(.north, sut.direction.getCurrentOrientation())
    }

    func testRoverForwardToNorthIncrementYAndNotX() {

        moveForward(originX: 6, originY: 4, direction: .north, expectedX: 6, expectedY: 5)
    }

    func testRoverForwardToEastIncrementXAndNotY() {

        moveForward(originX: 6, originY: 4, direction: .east, expectedX: 7, expectedY: 4)
    }

    func testRoverForwardToSouthDecrementYAndNotX() {

        moveForward(originX: 6, originY: 4, direction: .south, expectedX: 6, expectedY: 3)
    }

    func testRoverForwardToWestDecrementXAndNotY() {

        moveForward(originX: 6, originY: 4, direction: .west, expectedX: 5, expectedY: 4)
    }

    // swiftlint:disable:next line_length
    func moveForward(originX: Int, originY: Int, direction: Orientation, expectedX: Int, expectedY: Int, file: StaticString = #file, line: UInt = #line) {

        //Act
        sut = Rover(x: originX, y: originY, direction: direction)
        sut.move(commands: "F")

        //Assert
        XCTAssertEqual(expectedX, sut.x, "x", file: file, line: line)
        XCTAssertEqual(expectedY, sut.y, "y", file: file, line: line)
    }

    // MARK: - Mocks

    class OrientationMock: Orientationable {

        var turnLeftOk = false
        var turnRightOk = false
        let expectedOrientation: Orientation

        init(expectedOrientation: Orientation = .north) {
            self.expectedOrientation = expectedOrientation
        }

        func turnLeft() -> Orientation {
            turnLeftOk = true
            return expectedOrientation
        }

        func turnRight() -> Orientation {
            turnRightOk = true
            return expectedOrientation
        }

        func getCurrentOrientation() -> Orientation {
            return expectedOrientation
        }
    }
}
