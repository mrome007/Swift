//
//  GameScene.swift
//  Pierre Penguin Escapes the Antarctic
//
//  Created by Michael Romero on 11/8/18.
//  Copyright © 2018 Michael Romero. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    // Create a constant camera as a SKCameraNode:
    let cam = SKCameraNode()
    
    // Create out bee node as a property of GameScene so we can
    // access it throughout the class.
    // (Make sure to remove the old bee declaration below)
    let player = Player()
    let ground = Ground()
    
    override func didMove(to view: SKView) {
        // Make the scene position from its lower left
        // corner, regardless of any other settings:
        self.anchorPoint = .zero
        
        // set the scene's background to a nice sky blue
        // Note: UIColor uses a scale from 0 to 1 for its colors
        self.backgroundColor = UIColor(red: 0.4, green: 0.6, blue: 0.95, alpha: 1.0)
        
        // Assign the camera to the scene.
        self.camera = cam
        
        // Position the player:
        player.position = CGPoint(x: 150, y: 250)
        self.addChild(player)
        
        let bee2 = Bee()
        bee2.position = CGPoint(x: 325, y: 325)
        
        let bee3 = Bee()
        bee3.position = CGPoint(x: 200, y: 325)
        
        self.addChild(bee2)
        self.addChild(bee3)
        
        // Position the ground based on the screen size.
        // Position X: Negative on screen width
        // Positoin Y: 150 above the bottom (remember the top left
        // anchor point).
        ground.position = CGPoint(x: -self.size.width * 2, y: 150)
        
        // Set the ground width to 3x the width of the screen
        // The height can be 0, our child nodes will create the height
        ground.size = CGSize(width: self.size.width * 6, height: 0)
        
        // Run the ground's createChildren function to build
        // the child texture tiles:
        ground.createChildren()
        
        // Add the ground node to the scene:
        self.addChild(ground)
    }
    
    override func didSimulatePhysics() {
        // Keep the camera centered on the bee
        // Note the ! operate after camera. SKScene's camera
        // is an optional, but we know it is there since we assigned
        // it above in the didMove function. We can tell
        // Swift that we know it can unwrap this value by using
        // the ! operator after the property name.
        self.camera!.position = player.position
    }
}
