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
    let bee = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        // Make the scene position from its lower left
        // corner, regardless of any other settings:
        self.anchorPoint = .zero
        
        // set the scene's background to a nice sky blue
        // Note: UIColor uses a scale from 0 to 1 for its colors
        self.backgroundColor = UIColor(red: 0.4, green: 0.6, blue: 0.95, alpha: 1.0)
        
        // Assign the camera to the scene.
        self.camera = cam
        
        // Call the new bee function
        self.addTheFlyingBee()
    }
    
    override func didSimulatePhysics() {
        // Keep the camera centered on the bee
        // Note the ! operate after camera. SKScene's camera
        // is an optional, but we know it is there since we assigned
        // it above in the didMove function. We can tell
        // Swift that we know it can unwrap this value by using
        // the ! operator after the property name.
        self.camera!.position = bee.position
    }
    
    func addTheFlyingBee() {
        // create our bee sprite
        // Note: Remove all prior arguments from this line:
        bee.position = CGPoint(x: 250, y: 250)
        bee.size = CGSize(width: 28, height: 24)
        self.addChild(bee)
        
        // Find our new bee texture atlas
        let beeAtlas = SKTextureAtlas(named: "Enemies")
        
        // Grab the two bee frame from the texture atlas in an array
        // Note: Check out the syntax explicitly declaring beeFrames
        // as an array of SKTextures. This is not strictly necessary,
        // but it makes the intent of the code more readable, so I
        // chose to include the explicit type declaration here:
        let beeFrames: [SKTexture] = [beeAtlas.textureNamed("bee"), beeAtlas.textureNamed("bee-fly")]
        
        // Create a new SKAction to animate between the frames once.
        let flyAction = SKAction.animate(with: beeFrames, timePerFrame: 0.14)
        
        // Create an SKActino to run the flyAction repeatedly
        let beeAction = SKAction.repeatForever(flyAction)
        
        // Instruct our bee to run the final repeat action:
        bee.run(beeAction)
        
        // Set up new actions to move our bee back and forth:
        let pathLeft = SKAction.moveBy(x: -200, y: -10, duration: 2)
        let pathRight = SKAction.moveBy(x: 200, y: 10, duration: 2)
        
        // These two scaleX actions flip the texture back and forth
        // We will use these to turn the bee to face left and right
        let flipTextureNegative = SKAction.scaleX(to: -1, duration: 0)
        let flipTexturePositive = SKAction.scaleX(to: 1, duration: 0)
        
        // Combine actions into a cohesive flight sequence for our bee
        let flightOfBee = SKAction.sequence([pathLeft, flipTextureNegative, pathRight, flipTexturePositive])
        
        // Create a looping action that will repeat forever
        let neverEndingFlight = SKAction.repeatForever(flightOfBee)
        bee.run(neverEndingFlight)
    }
}
