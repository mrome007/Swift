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
    
    // Store whether we are flapping our wings or in free-fall:
    var flapping = false
    
    // Set a maximum upward force.
    // 57,000 feels good to me, adjust to taste:
    let maxFlappingForce: CGFloat = 57000
    
    // Pierre should slow down when he flies too high:
    let maxHeight: CGFloat = 1000
    
    init() {
        // Call the init function on the
        // base class (SKSpriteNode)
        super.init(texture: nil, color: .clear, size: initialSize)
        
        createAnimations()
        
        // If we run an action with a key, "flapAnimation"
        // we can later reference that
        //key to remove the action.
        self.run(soarAnimation, withKey: "soarAnimation")
        
        // Create a physics body based on one frame of Pierre's animation.
        // We will use the third frame, when his wings are tucked in
        let bodyTexture = textureAtlas.textureNamed("pierre-flying-3")
        self.physicsBody = SKPhysicsBody(texture: bodyTexture, size: self.size)
        
        // Pierre will lose momentum quickly with a high linear damping:
        self.physicsBody?.linearDamping = 0.9
        
        // Adult penguins weight around 30 kg:
        self.physicsBody?.mass = 30
        
        // Prevent Pierre from rotating:
        self.physicsBody?.allowsRotation = false
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
    
    func update() {
        // if flapping, apply a new force to push Pierre higher.
        if self.flapping {
            var forceToApply = maxFlappingForce
            
            // Apply less force if Pierre is above position 600
            if position.y > 600 {
                // The higher Pierre goes, the more force we
                // remove. These next three lines determine the
                // force to subtract:
                let percentageOfMaxHeight = position.y / maxHeight
                let flappingForceSubraction = percentageOfMaxHeight * maxFlappingForce
                forceToApply -= flappingForceSubraction
            }
            
            self.physicsBody?.applyForce(CGVector(dx: 0, dy: forceToApply))
        }
        
        // Limit Pierre's top speed as he climbs the y-axis.
        // This prevents him from gaining enough momentum to shoot
        // over our max height. We bend the physics for gameplay:
        if self.physicsBody!.velocity.dy > 300 {
            self.physicsBody!.velocity.dy = 30
        }
    }
    
    func startFlapping() {
        self.removeAction(forKey: "soarAnimation")
        self.run(flyAnimation, withKey: "flapAnimation")
        self.flapping = true
    }
    
    func stopFlapping() {
        self.removeAction(forKey: "flapAnimation")
        self.run(soarAnimation, withKey: "soarAnimation")
        self.flapping = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
