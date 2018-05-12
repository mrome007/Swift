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
    override func didMove(to view: SKView)
    {
        //Like Vector3.zero in unity. Make the scene positoin from its lower left
        //corner, regardless of any other settings:
        self.anchorPoint = .zero
        
        //Instantiate a constant(let), mySprite, instance of SKSpriteNode
        //The SKSpriteNode constructor can set color and size
        //Note: UIColor is a UIKit class with bilt in color presets
        //Note: CGSize is a type we use to set node sizes.
        let mySprite = SKSpriteNode(color: .blue, size: CGSize(width: 50, height: 50))
        
        //Assign our sprite a position in points, relative to its
        //parent node
        mySprite.position = CGPoint(x: 150, y: 150)
        
        //Finally, we need to add our sprite node into the node tree.
        //Call the SKScene's addChild function to add the node
        //Note: In Swift, 'self' is an automatic property
        //on any type instance, exactly equal to the instance itself
        //So in this case, it refers to the GameScene instance.
        //similar to "this" in C# or C++???
        self.addChild(mySprite)
        
        //SpriteKit will tween to the new position over the couse of the duration,
        //in this case 3 seconds.
        let demoActionMove = SKAction.move(to: CGPoint(x: 300, y: 150), duration: 3)
        //scales the sprite to 4 units in 5 seconds.
        let demoActionScale = SKAction.scale(to: 4, duration: 5)
        
        //Tells our square node to execute its move action.
        mySprite.run(demoActionMove)
        //Tells our square node to execute its scale action.
        mySprite.run(demoActionScale)
    }
}
