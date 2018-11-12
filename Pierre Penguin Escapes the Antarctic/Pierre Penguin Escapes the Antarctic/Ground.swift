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
    }
    
    func onTap() {
        
    }
}
