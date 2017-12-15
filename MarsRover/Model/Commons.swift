//
//  Commons.swift
//  MarsRover
//
//  Created by Prieto Gonzalo, Jesus on 14/12/17.
//  Copyright © 2017 Prieto Gonzalo, Jesus. All rights reserved.
//

import Foundation

protocol Orientationable {

    func turnRight() -> Orientation
    func turnLeft() -> Orientation
    func getCurrentOrientation() -> Orientation
}

enum Orientation: Orientationable {
    case north, east, south, west

    func turnRight() -> Orientation {

        switch self {

        case .west:
            return .north

        case .south:
            return .west

        case .east:
            return .south

        case .north:
            return .east
        }
    }

    func turnLeft() -> Orientation {

        switch self {

        case .east:
            return .north

        case .south:
            return .east

        case .west:
            return .south

        case .north:
            return .west
        }
    }

    func getCurrentOrientation() -> Orientation {
        return self
    }
}
