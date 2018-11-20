//
//  Ground.swift
//  Pierre Penguin Escapes the Antarctic
//
//  Created by Michael Romero on 11/11/18.
//  Copyright © 2018 Michael Romero. All rights reserved.
//

import SpriteKit

class Ground: SKSpriteNode, GameSprite {
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "Environment")
    var initialSize: CGSize = CGSize.zero
    
    var jumpWidth = CGFloat()
    // Note the instantiation value of 1 here:
    var jumpCount = CGFloat(1)
    
    // This function tiles the ground texture across the width
    // of the Ground node. We will call it from our GameScene.
    func createChildren() {
        // This is one of those unique situations where we use a
        // non-default anchor point. By positioning the ground by
        // its top left corner, we can place it just slightly
        // above the bottom of the screen, on any of screen size.
        self.anchorPoint = CGPoint(x: 0, y: 1)
        
        // First, load the ground texture from the Atlas:
        let texture = textureAtlas.textureNamed("ground")
        
        var tileCount: CGFloat = 0
        
        // We will size the tiles in their point size
        // they are 35 points wide and 300 points tall
        let tileSize = CGSize(width: 35, height: 300)
        
        // Build nodes until we cover the entire Ground width
        while tileCount * tileSize.width < self.size.width {
            let tileNode = SKSpriteNode(texture: texture)
            tileNode.size = tileSize
            tileNode.position.x = tileCount * tileSize.width
            tileNode.anchorPoint = CGPoint(x: 0, y: 1)
            self.addChild(tileNode)
            tileCount += 1
        }
        
        // Draw an edge physics body along the top of the ground node.
        // Note: physics body positions are relative to their nodes.
        // The top left of the node is X: 0, Y: 0, given our anchor point.
        // the top right of the node is X: size.width, Y: 0
        let pointTopLeft = CGPoint(x: 0, y: 0)
        let pointTopRight = CGPoint(x: size.width, y: 0)
        self.physicsBody = SKPhysicsBody(edgeFrom: pointTopLeft, to: pointTopRight)
        
        // Save the width of one-third of the children nodes
        jumpWidth = tileSize.width * floor(tileCount / 3)
    }
    
    func checkForReposition(playerProgress: CGFloat) {
        // The ground needs to jump forward
        // every time the player has moved this distance:
        let groundJumpPosition = jumpWidth * jumpCount
        
        if playerProgress >= groundJumpPosition {
            // The player has moved past the jump position!
            // Move the ground forward:
            self.position.x += jumpWidth
            // Add one to the jump count:
            jumpCount += 1
        }
    }
    func onTap() {
        
    }
}
