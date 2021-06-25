//
//  ViewController.swift
//  RPS-June
//
//  Created by Matthew Hanlon on 24/06/2021.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var signLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI(state: .start)
        
    }
    
    func play(userSign: Sign) {
        
        let cpuSign = randomSign()
        
        let newState = userSign.gameState(against: cpuSign)
        
        updateUI(state: newState)
        
        signLabel.text = cpuSign.emoji

        rockButton.isHidden = true
        paperButton.isHidden = true
        scissorsButton.isHidden = true
        
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false
        
        switch userSign {
            case .rock:
                rockButton.isHidden = false
            case .paper:
                paperButton.isHidden = false
            case .scissors:
                scissorsButton.isHidden = false
        }
        
        playAgainButton.isEnabled = true
        playAgainButton.isHidden = false
    }
    
    
    private func updateUI(state: GameState) {
        
        statusLabel.text = state.status
        
        
        switch state {
            case .start:
                signLabel.text = "👾"
                playAgainButton.isHidden = true
                playAgainButton.isEnabled = false
                view.backgroundColor = .white
                
                rockButton.isHidden = false
                paperButton.isHidden = false
                scissorsButton.isHidden = false
                
                rockButton.isEnabled = true
                paperButton.isEnabled = true
                scissorsButton.isEnabled = true
                
            case .win:
                view.backgroundColor = UIColor(red: 0.651, green: 0.792, blue: 0.651, alpha: 1)
            case .lose:
                view.backgroundColor = UIColor(red: 0.851, green: 0.424, blue: 0.412, alpha: 1)

            case .draw:
                view.backgroundColor = UIColor(red: 0.663, green: 0.663, blue: 0.663, alpha: 1)

        }
        
    }
    
    
    
    @IBAction func playAgain(_ sender: UIButton) {
        updateUI(state: .start)
    }
    
    @IBAction func rockChosen(_ sender: UIButton) {
        play(userSign: .rock)
    }
    
    @IBAction func paperChosen(_ sender: UIButton) {
        play(userSign: .paper)
    }
    
    @IBAction func scissorsChosen(_ sender: UIButton) {
        play(userSign: .scissors)
    }
    
}

