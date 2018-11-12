//
//  GameSprite.swift
//  Pierre Penguin Escapes the Antarctic
//
//  Created by Michael Romero on 11/11/18.
//  Copyright © 2018 Michael Romero. All rights reserved.
//

import SpriteKit

protocol GameSprite {
    var textureAtlas: SKTextureAtlas { get set }
    var initialSize: CGSize { get set }
    func onTap()
}
