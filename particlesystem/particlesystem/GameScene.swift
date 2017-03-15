//
//  GameScene.swift
//  particleSystem
//
//  Created by 胡杨林 on 17/3/15.
//  Copyright © 2017年 胡杨林. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    override func didMove(to view: SKView) {
//        let snow = SKEmitterNode(fileNamed: "MyParticle.sks")
//        snow?.position = CGPoint(x: 400, y: 600)
//        addChild(snow!)
        let background:SKSpriteNode = SKSpriteNode(imageNamed: "1.png")
        background.position = CGPoint(x: 500, y: 380)
        addChild(background)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let rainTexture = SKTexture(imageNamed: "snow.png")
        let emitterNode = SKEmitterNode()
        emitterNode.particleTexture = rainTexture
        emitterNode.particleBirthRate = 80.0 //设置每秒创建的粒子数
        emitterNode.particleColor = SKColor.white  //粒子的颜色
        emitterNode.particleSpeed = -450  //粒子的平均初始速度
        emitterNode.particleSpeedRange = 150 //粒子的初始速度，这个值是一个允许的值域范围内的随机值
        emitterNode.particleLifetime = 2.0 //生命周期
        emitterNode.particleScale = 0.2  //缩放因子
        emitterNode.particleAlpha = 0.75  //平均初始透明度
        emitterNode.particleAlphaRange = 0.5
        emitterNode.particleColorBlendFactor = 1  //颜色混合因子
        
        emitterNode.particleScaleRange = 0.5
        emitterNode.position = CGPoint(x: (self.view?.frame.midX)!, y: (self.view?.frame.midY)!)
        emitterNode.particlePositionRange = CGVector(dx: (self.view?.frame.maxX)!, dy: 0)
        addChild(emitterNode)
        
    }
}
