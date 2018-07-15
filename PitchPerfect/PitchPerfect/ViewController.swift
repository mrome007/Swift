//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Michael Romero on 7/12/18.
//  Copyright © 2018 Michael Romero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordingButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopRecordingButton.isEnabled = false;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("View Will Appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    @IBAction func recordAudio(_ sender: Any) {
        recordingLabel.text = "Recording in Progress..."
        stopRecordingButton.isEnabled = true
        recordingButton.isEnabled    = false
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        stopRecordingButton.isEnabled = false
        recordingButton.isEnabled = true
        recordingLabel.text = "Tap to Record"
    }
}

