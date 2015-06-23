//
//  Player.swift
//  SwiftGoal
//
//  Created by Martin Richter on 02/06/15.
//  Copyright (c) 2015 Martin Richter. All rights reserved.
//

import Foundation
import Argo
import Runes

struct Player {
    let identifier: String
    let name: String
}

// MARK: Equatable

func ==(lhs: Player, rhs: Player) -> Bool {
    return lhs.identifier == rhs.identifier
}

// MARK: Decodable

extension Player: Decodable {
    static func create(identifier: String)(name: String) -> Player {
        return Player(identifier: identifier, name: name)
    }

    static func decode(json: JSON) -> Decoded<Player> {
        return Player.create
            <^> json <| "id"
            <*> json <| "name"
    }
}