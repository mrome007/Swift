//
//  ViewController.swift
//  Roshambo
//
//  Created by Michael Romero on 7/29/18.
//  Copyright © 2018 Michael Romero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func code(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "RoshamboResultsViewController") as! RoshamboResultViewController
        
        controller.player1 = .paper
        controller.player2 = randomRoshambo()
        
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func codeAndSegue(_ sender: Any) {
        performSegue(withIdentifier: "go", sender: sender)
    }
    
    func randomRoshambo() -> Roshambo {
        let randomValue = arc4random() % 3
        return Roshambo(rawValue: Int(randomValue))!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "go" {
            let controller = segue.destination as! RoshamboResultViewController
            
            controller.player1 = Roshambo(rawValue: (sender as! UIButton).tag)
            controller.player2 = randomRoshambo()
        }
    }
}

