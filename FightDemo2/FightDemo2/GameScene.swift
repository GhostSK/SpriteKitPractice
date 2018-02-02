//
//  GameScene.swift
//  FightDemo2
//
//  Created by 胡杨林 on 2017/12/27.
//  Copyright © 2017年 胡杨林. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor.white
        let node = SKSpriteNode.init()
        node.position = CGPoint(x: 20, y: 20)
        node.size = CGSize(width: 100, height: 100)
        node.color = SKColor.red
        node.anchorPoint = CGPoint(x: 0, y: 0)
        addChild(node)
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
