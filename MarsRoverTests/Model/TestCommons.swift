//
//  TestCommons.swift
//  MarsRoverTests
//
//  Created by Prieto Gonzalo, Jesus on 14/12/17.
//  Copyright © 2017 Prieto Gonzalo, Jesus. All rights reserved.
//

import XCTest
@testable import MarsRover

class TestCommons: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testOrientationTurnRightFromNorthIsEast() {

        //Arrange
        var sut = Orientation.north

        //Act
        sut = sut.turnRight()

        //Assert
        XCTAssertEqual(.east, sut)
    }

    func testOrientationTurnRightFromEastIsSouth() {

        //Arrange
        var sut = Orientation.east

        //Act
        sut = sut.turnRight()

        //Assert
        XCTAssertEqual(.south, sut)
    }

    func testOrientationTurnRightFromSouthIsWest() {

        //Arrange
        var sut = Orientation.south

        //Act
        sut = sut.turnRight()

        //Assert
        XCTAssertEqual(.west, sut)
    }

    func testOrientationTurnRightFromWestIsNorth() {

        //Arrange
        var sut = Orientation.west

        //Act
        sut = sut.turnRight()

        //Assert
        XCTAssertEqual(.north, sut)
    }

    func testOrientationTurnLeftFromNorthIsWest() {

        //Arrange
        var sut = Orientation.north

        //Act
        sut = sut.turnLeft()

        //Assert
        XCTAssertEqual(.west, sut)
    }

    func testOrientationTurnLeftFromWestIsSouth() {

        //Arrange
        var sut = Orientation.west

        //Act
        sut = sut.turnLeft()

        //Assert
        XCTAssertEqual(.south, sut)
    }

    func testOrientationTurnLeftFromSouthIsEast() {

        //Arrange
        var sut = Orientation.south

        //Act
        sut = sut.turnLeft()

        //Assert
        XCTAssertEqual(.east, sut)
    }

    func testOrientationTurnLeftFromEastIsNorth() {

        //Arrange
        var sut = Orientation.east

        //Act
        sut = sut.turnLeft()

        //Assert
        XCTAssertEqual(.north, sut)
    }
}
