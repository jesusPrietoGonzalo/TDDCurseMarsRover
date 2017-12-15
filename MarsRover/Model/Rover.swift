//
//  Rover.swift
//  MarsRover
//
//  Created by Prieto Gonzalo, Jesus on 14/12/17.
//  Copyright © 2017 Prieto Gonzalo, Jesus. All rights reserved.
//

import Foundation

class Rover {

    // swiftlint:disable identifier_name
    static let DEFAULT_X = 0
    static let DEFAULT_Y = 0
    static let DEFAULT_DIRECTION = Orientation.north

    var x: Int
    var y: Int
    var direction: Orientationable

    init(x: Int = Rover.DEFAULT_X, y: Int = Rover.DEFAULT_Y, direction: Orientation = Rover.DEFAULT_DIRECTION) {
        self.x = x
        self.y = y
        self.direction = direction
    }
    // swiftlint:enable identifier_name

    func move(commands: String) {

        for com in commands {

            if com == "L" {
                direction = direction.turnLeft()

            } else if com == "R" {
                direction = direction.turnRight()

            } else if com == "F" {

                switch direction.getCurrentOrientation() {

                case .west:
                    x -= 1

                case .south:
                    y -= 1

                case .east:
                    x += 1

                case .north:
                    y += 1
                }
            }
        }
    }
}
