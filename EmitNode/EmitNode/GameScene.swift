//
//  GameScene.swift
//  EmitNode
//
//  Created by 胡杨林 on 2017/7/7.
//  Copyright © 2017年 胡杨林. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor.white
        
//        let crop = SKCropNode.init()
//        addChild(crop)
//        let window = SKSpriteNode.init(color: SKColor.blue, size: CGSize(width: 200, height: 200))
//        crop.maskNode = window
//        window.anchorPoint = CGPoint(x: 0.5, y: 0.5)
//        window.position = CGPoint(x: 100, y: 100)

        let emit = SKEmitterNode.init()  //初始化
        emit.particleTexture = SKTexture(imageNamed: "rainDrop.png")  //设置纹理
        
        
        
    }
    
    
    
}
