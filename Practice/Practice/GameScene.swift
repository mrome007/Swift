//
//  GameScene.swift
//  Practice
//
//  Created by Michael Romero on 4/10/18.
//  Copyright © 2018 Michael Romero. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene
{
    //Create a constant cam as a SKCameraNode:
    let cam = SKCameraNode()
    
    //Create our bee node as a property of GameScene so we can
    //access it throughout the class
    //(Make sure to remove the old bee declaration below)
    let bee = SKSpriteNode()
    
    override func didMove(to view: SKView)
    {
        //Position from the lower left corner
        self.anchorPoint = .zero
        
        //set the scene's background to a nice sky blue.
        //Note: UIColor uses a scale from 0 to 1 for its colors
        self.backgroundColor = UIColor(red: 0.4, green: 0.6, blue: 0.95, alpha: 1.0)
        
        //Assign the camera to the scene.
        self.camera = cam
        
        self.flyBee()
    }
    
    override func didSimulatePhysics()
    {
        //Keep the camera centered on the bee
        //Notice the ! operator after the camera. SKScene's camera
        //is an optional, but we know it is there since we
        //assigned it above in the didMove function. We can tell Swift
        //that we know it can unwrap this value by using the
        //! operator after the property name.
        
        self.camera?.position = bee.position
    }
    
    func flyBee()
    {
        //size our bee node.
        bee.size = CGSize(width: 28, height: 24)
        //position our bee node.
        bee.position = CGPoint(x: 250, y: 250)
        //attach bee to the scene node's tree.
        self.addChild(bee)
        
        //Find our new bee texture atlas
        let beeAtlas = SKTextureAtlas(named: "Enemies")
        
        //Grab the two bee frames from the texture atlas in an array.
        //Note: Check out the syntax explicitly declaring beeFrames
        //as an array of SKTextures. This is not strictly necessary,
        //but it makes the intent of the code more readable, so I
        //chose to include the explicit type declaration here:
        let beeFrames:[SKTexture] = [
            beeAtlas.textureNamed("bee"),
            beeAtlas.textureNamed("bee-fly")]
        
        //Create a new SKAction to animate between the frames once.
        let flyAction = SKAction.animate(with: beeFrames, timePerFrame: 0.14)
        
        //Create an SKAction to run the flyAction repeatedly
        let beeAction = SKAction.repeatForever(flyAction)
        
        bee.run(beeAction)
        
        //Move to the left
        let beeMoveLeft = SKAction.moveBy(x: -200, y: -10, duration: 2)
        //Move to the right
        let beeMoveRight = SKAction.moveBy(x: 200, y: 10, duration: 2)
        
        //turns to the right
        let beeFlipNegative = SKAction.scaleX(to: -1, duration: 0)
        
        //turns to the left.
        let beeFlipPositive = SKAction.scale(to: 1, duration: 0)
        
        let beeFlightActions = SKAction.sequence([beeMoveLeft, beeFlipNegative, beeMoveRight, beeFlipPositive])
        let beeFlightRepeated = SKAction.repeatForever(beeFlightActions)
        
        bee.run(beeFlightRepeated)
    }
}
