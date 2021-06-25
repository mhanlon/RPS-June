//
//  Sign.swift
//  RPS-June
//
//  Created by Matthew Hanlon on 25/06/2021.
//

import Foundation

enum Sign {
    case rock
    case paper
    case scissors
    
    var emoji: String {
        switch self {
        case .rock:
            return "👊"
        case .paper:
            return "✋"
        case .scissors:
            return "✌️"
        }
    }
    
    func gameState(against opponentSign: Sign) -> GameState {
        if self == opponentSign {
            return .draw
        }
        switch self {
        case .rock:
            if opponentSign == .paper {
                return .lose
            } else {
                return .win
            }
        case .paper:
            if opponentSign == .scissors {
                return .lose
            } else {
                return .win
            }
        case .scissors:
            if opponentSign == .rock {
                return .lose
            } else {
                return .win
            }
        }
    }
}


func randomSign() -> Sign {
    let randomNumber = Int.random(in: 0...2)
    if randomNumber == 0 {
        return .rock
    } else if randomNumber == 1 {
        return .paper
    } else {
        return .scissors
    }
}
