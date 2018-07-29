//
//  RoshamboResultViewController.swift
//  Roshambo
//
//  Created by Michael Romero on 7/29/18.
//  Copyright © 2018 Michael Romero. All rights reserved.
//

import UIKit

class RoshamboResultViewController: UIViewController {

    var player1: Roshambo?
    var player2: Roshambo?
    
    @IBOutlet weak var resultView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if player1 == player2 {
            resultLabel.text = "It's a tie!"
        }
        else {
            if(player1 == .paper && player2 == .rock) {
                resultLabel.text = "Paper covers Rock. You Win!"
                resultView.image = UIImage(named: "PaperCoversRock")
            }
            else if player1 == .rock && player2 == .scissors {
                resultLabel.text = "Rock crushes Scissors. You Win!"
                resultView.image = UIImage(named: "RockCrushesScissors")
            }
            else if player1 == .scissors && player2 == .paper {
                resultLabel.text = "Scissors cut Paper. You Win!"
                resultView.image = UIImage(named: "ScissorsCutPaper")
            }
            else if(player2 == .paper && player1 == .rock) {
                resultLabel.text = "Paper covers Rock. You Lose!"
                resultView.image = UIImage(named: "PaperCoversRock")
            }
            else if player2 == .rock && player1 == .scissors {
                resultLabel.text = "Rock crushes Scissors. You Lose!"
                resultView.image = UIImage(named: "RockCrushesScissors")
            }
            else if player2 == .scissors && player1 == .paper {
                resultLabel.text = "Scissors cut Paper. You Lose!"
                resultView.image = UIImage(named: "ScissorsCutPaper")
            }
        }
        
        resultLabel.alpha = 0
        resultView.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.1) {
            self.resultLabel.alpha = 1
            self.resultView.alpha = 1
        }
    }

    @IBAction func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }
}
