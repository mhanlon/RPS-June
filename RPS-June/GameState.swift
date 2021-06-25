//
//  GameState.swift
//  RPS-June
//
//  Created by Matthew Hanlon on 25/06/2021.
//

import Foundation

enum GameState {
    case start
    case win
    case lose
    case draw

    var status: String {
        switch self {
            case .start:
                return "Rock, Paper, Scissors?"
            case .win:
                return "You Won!"
            case .lose:
                return "You Lost!"
            case .draw:
                return "It's a Draw!"
        }
    }
}
