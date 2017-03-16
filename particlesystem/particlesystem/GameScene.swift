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
    var emitterNode = SKEmitterNode()
    override func didMove(to view: SKView) {
//        let snow = SKEmitterNode(fileNamed: "MyParticle.sks")
//        snow?.position = CGPoint(x: 400, y: 600)
//        addChild(snow!)
        let background:SKSpriteNode = SKSpriteNode(imageNamed: "1.png")
        background.position = CGPoint(x: 500, y: 380)
        addChild(background)
        
        //使用关键帧序列配置粒子属性
        let rainTexture = SKTexture(imageNamed: "rainDrop.png")
        emitterNode.particleTexture = rainTexture
        emitterNode.particleBirthRate = 80.0
        emitterNode.particleColor = SKColor.white
        emitterNode.particleSpeed = -450
        emitterNode.particleSpeedRange = 150
        emitterNode.particleLifetime = 2
        emitterNode.particleScale = 0.2
        emitterNode.particleAlpha = 0.75
        emitterNode.particleAlphaRange = 0.5
        emitterNode.particleColorBlendFactor = 1
        emitterNode.particleScale = 0.2
        emitterNode.particleScaleRange = 0.5
        emitterNode.particleScaleSpeed = -0.1
        //设置发射器位置
        emitterNode.position = CGPoint(x: (self.view?.frame.midX)!, y: (self.view?.frame.height)! + 10)
        emitterNode.particlePositionRange = CGVector(dx: 736, dy: 0)
        addChild(emitterNode)
        
        let btn = UIButton(frame: CGRect(x: 20, y: 30, width: 160, height: 30))
        btn.setTitle("关键帧控制", for: .normal)
        btn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        self.view?.addSubview(btn)
        
    }
    
    func btnAction() {
        let scaleSequence:SKKeyframeSequence = SKKeyframeSequence(keyframeValues: [0.2,0.7,0.1], times: [0.0,0.250,0.750]) //每个粒子会执行 时间0-scale0.2  时间0.250-scale0.7   时间0.750-scale0.1的顺序变化
        emitterNode.particleScaleSequence = scaleSequence
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
