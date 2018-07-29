//
//  ViewController.swift
//  ColorMaker
//
//  Created by Michael Romero on 7/29/18.
//  Copyright © 2018 Michael Romero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let r = CGFloat(self.redSlider.value)
        let g = CGFloat(self.greenSlider.value)
        let b = CGFloat(self.blueSlider.value)
        
        colorView.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
    }
    
}

