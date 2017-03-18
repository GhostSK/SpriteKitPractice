//
//  particleActionScene.swift
//  particleSystem
//
//  Created by 胡杨林 on 17/3/16.
//  Copyright © 2017年 胡杨林. All rights reserved.
//

import Foundation
import SpriteKit

class particleActionScene: SKScene {
    
    let spark1:SKEmitterNode = SKEmitterNode(fileNamed: "MyParticle2.sks")!
    var emit2:SKEmitterNode? = nil
    var touchCount:Int = 0
    override func didMove(to view: SKView) {
        //设置并添加粒子发射器对象

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.touchCount += 1
        if self.touchCount == 1 {
//            self.removeAllChildren()
            self.spark1.position = CGPoint(x: 900, y: 400)
            addChild(spark1)
            let leftMove = SKAction.move(to: CGPoint(x:100, y:400), duration: 3)
            let rightMove = SKAction.move(to: CGPoint(x:900, y:400), duration: 3)
            let sequence = SKAction.sequence([leftMove, rightMove])
            let runForever = SKAction.repeatForever(sequence)
            spark1.run(runForever)
        }
        //使用particleAction属性添加动作
        if self.touchCount == 2 || self.touchCount == 3 {
            let emitterNode = SKEmitterNode()
            backgroundColor = SKColor.white
            let rainTexture = SKTexture(imageNamed: "1.png")
            emitterNode.particleTexture = rainTexture
            emitterNode.particleBirthRate = 6
            emitterNode.particleColor = SKColor.white
            emitterNode.particleLifetime = 5.0
            emitterNode.particleScale = 0.2
            emitterNode.particleAlpha = 0.75
            emitterNode.particleAlphaRange = 0.5
            emitterNode.particleColorBlendFactor = 1
            emitterNode.particleScale = 0.8
            emitterNode.particleScaleRange = 0.5
            emitterNode.particleScaleSpeed = -0.1
            emitterNode.position = CGPoint(x: (self.view?.frame.midX)!, y: 400 )
            self.emit2 = emitterNode
            //粒子的初始位置  这个值是一个允许的值域范围内的随机值
            emitterNode.particlePositionRange = CGVector(dx: (self.view?.frame.maxX)!, dy: 0)
            addChild(emitterNode)
            if self.touchCount == 3 {
                let color = SKAction.colorize(with: SKColor.red, colorBlendFactor: 0.7, duration: 2)
                emitterNode.run(color)
            }
            
        }
        if self.touchCount == 4 {
            //重置粒子系统
            self.emit2?.resetSimulation()
            self.spark1.resetSimulation()
            
        }
        
    }
    
}
