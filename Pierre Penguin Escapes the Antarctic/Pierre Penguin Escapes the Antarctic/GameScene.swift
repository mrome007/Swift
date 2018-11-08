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
    
    override func didMove(to view: SKView) {
        // Make the scene position from its lower left
        // corner, regardless of any other settings:
        self.anchorPoint = .zero
        
        // Instantiate a constant, mySprite, instance of SKSpriteNode
        // The SKSpriteNode constructor can set color and size
        // Note: UIColor is a UIKit class with built-in color presets
        // Note: CGSize is a type we use to set node sizes
        let mySprite = SKSpriteNode(color: .blue, size: CGSize(width: 50, height: 50))
        
        // Assign our sprite a position in points, relative to its
        // parent node (in this case, the scene)
        mySprite.position = CGPoint(x: 150, y: 150)
        
        // Finally, we need to add our sprite node into the node tree.
        // Call the SKScene's addChild function to add the node
        // Note: In Swift, 'self' is an automatic property
        // on any type instance, exactly equal to the instance itself
        // so in this case, it referes to the GameScene instance
        self.addChild(mySprite)
        
        // Create a new constant for our action instance
        // Use the move action to provide a goal position for a node
        // SpriteKit will tween to the new position over the course of the duration, in this case 5 seconds
        let demoAction = SKAction.move(to: CGPoint(x: 300, y: 150), duration: 3)
        let scaleAction = SKAction.scale(to: 4, duration: 3)
        let rotateAction = SKAction.rotate(byAngle: 5, duration: 3)
        let actionGroup = SKAction.group([demoAction, scaleAction, rotateAction])
        let actionSequence = SKAction.sequence([demoAction, scaleAction, rotateAction])
        mySprite.run(actionSequence)
    }
}
