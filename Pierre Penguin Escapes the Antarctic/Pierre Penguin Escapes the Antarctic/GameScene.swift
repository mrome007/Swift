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
    var screenCenterY = CGFloat()
    
    let initialPlayerPosition = CGPoint(x: 150, y: 250)
    var playerProgress = CGFloat()
    
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
        player.position = initialPlayerPosition
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
        ground.position = CGPoint(x: -self.size.width * 2, y: 30)
        
        // Set the ground width to 3x the width of the screen
        // The height can be 0, our child nodes will create the height
        ground.size = CGSize(width: self.size.width * 6, height: 0)
        
        // Run the ground's createChildren function to build
        // the child texture tiles:
        ground.createChildren()
        
        // Add the ground node to the scene:
        self.addChild(ground)
        
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -5)
        screenCenterY = self.size.height / 2
    }
    
    override func update(_ currentTime: TimeInterval) {
        player.update()
    }
    
    override func didSimulatePhysics() {
        // Keep the camera locked at mid screen by default:
        var cameraYPos = screenCenterY
        cam.yScale = 1
        cam.xScale = 1
        
        if player.position.y > screenCenterY {
            cameraYPos = player.position.y
            
            // Scale out the camera as they go higher:
            let percentOfMaxHeight = (player.position.y - screenCenterY) / (player.maxHeight - screenCenterY)
            let newScale = 1 + percentOfMaxHeight
            cam.yScale = newScale
            cam.xScale = newScale
        }
        
        // Move the camera for our adjustment:
        self.camera!.position = CGPoint(x: player.position.x, y: cameraYPos)
        
        playerProgress = player.position.x - initialPlayerPosition.x
        // check to see if the ground should jump forward:
        ground.checkForReposition(playerProgress: playerProgress)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            // Find the location of the touch:
            let location = touch.location(in: self)
            
            // Locate the node at this location:
            let nodeTouched = atPoint(location)
            
            // Attempt to downcast the node to the GameSprite protocol
            if let gameSprite = nodeTouched as? GameSprite {
                // If this node adhere to GameSprite, call onTap:
                gameSprite.onTap()
            }
        }
        
        player.startFlapping()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        player.stopFlapping()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        player.stopFlapping()
    }
}
