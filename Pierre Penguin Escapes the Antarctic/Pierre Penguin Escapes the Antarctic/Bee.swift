//
//  Bee.swift
//  Pierre Penguin Escapes the Antarctic
//
//  Created by Michael Romero on 11/11/18.
//  Copyright © 2018 Michael Romero. All rights reserved.
//

import SpriteKit

class Bee: SKSpriteNode, GameSprite {
    
    // We will store our size, texture atlas, and animations
    // as class wide properties.
    var initialSize: CGSize = CGSize(width: 28, height: 24)
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "Enemies")
    var flyAnimation = SKAction()
    
    init() {
        // Call the init funciton on the base class (SKSpriteNode)
        // We pass nil fo rthe texture since we will animate the
        // texture ourselves.
        super.init(texture: nil, color: .clear, size: initialSize)
        
        // Create and run the flying animation:
        createAnimations()
        self.run(flyAnimation)
        
        // Attach a physics body, shaped like a circle
        // and sized roughly to our bee.
        self.physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2)
        self.physicsBody?.affectedByGravity = false
    }
    
    func createAnimations() {
        // Grab the two bee frame from the texture atlas in an array
        // Note: Check out the syntax explicitly declaring beeFrames
        // as an array of SKTextures. This is not strictly necessary,
        // but it makes the intent of the code more readable, so I
        // chose to include the explicit type declaration here:
        let flyFrames: [SKTexture] = [textureAtlas.textureNamed("bee"), textureAtlas.textureNamed("bee-fly")]
        
        // Create a new SKAction to animate between the frames once.
        let flyAction = SKAction.animate(with: flyFrames, timePerFrame: 0.14)
        
        // Create an SKActino to run the flyAction repeatedly
        flyAnimation = SKAction.repeatForever(flyAction)
    }
    
    func onTap() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
