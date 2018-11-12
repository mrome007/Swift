//
//  Player.swift
//  Pierre Penguin Escapes the Antarctic
//
//  Created by Michael Romero on 11/12/18.
//  Copyright © 2018 Michael Romero. All rights reserved.
//

import SpriteKit

class Player : SKSpriteNode, GameSprite {
    
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "Pierre")
    var initialSize: CGSize = CGSize(width: 64, height: 64)
    
    var flyAnimation = SKAction()
    var soarAnimation = SKAction()
    
    init() {
        // Call the init function on the
        // base class (SKSpriteNode)
        super.init(texture: nil, color: .clear, size: initialSize)
        
        createAnimations()
        
        // If we run an action with a key, "flapAnimation"
        // we can later reference that
        //key to remove the action.
        self.run(flyAnimation, withKey: "flapAnimation")
    }
    
    func createAnimations() {
        let rotateUpAction = SKAction.rotate(toAngle: 0, duration: 0.475)
        rotateUpAction.timingMode = .easeInEaseOut
        let rotateDownAction = SKAction.rotate(toAngle: -1, duration: 0.8)
        rotateDownAction.timingMode = .easeIn
        
        // Create the flying animation:
        let flyFrames: [SKTexture] = [textureAtlas.textureNamed("pierre-flying-1"),
                                      textureAtlas.textureNamed("pierre-flying-2"),
                                      textureAtlas.textureNamed("pierre-flying-3"),
                                      textureAtlas.textureNamed("pierre-flying-4"),
                                      textureAtlas.textureNamed("pierre-flying-3"),
                                      textureAtlas.textureNamed("pierre-flying-2")]
        let flyAction = SKAction.animate(with: flyFrames, timePerFrame: 0.03)
        flyAnimation = SKAction.group([SKAction.repeatForever(flyAction), rotateUpAction])
        
        let soarFrames: [SKTexture] = [textureAtlas.textureNamed("pierre-flying-1")]
        let soarAction = SKAction.animate(with: soarFrames, timePerFrame: 1)
        soarAnimation = SKAction.group([SKAction.repeatForever(soarAction), rotateDownAction])
    }
    
    func onTap() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
