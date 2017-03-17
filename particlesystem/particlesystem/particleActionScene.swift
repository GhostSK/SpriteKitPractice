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
    
    override func didMove(to view: SKView) {
        //设置并添加粒子发射器对象
        self.spark1.position = CGPoint(x: 900, y: 400)
        addChild(spark1)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let leftMove = SKAction.move(to: CGPoint(x:100, y:400), duration: 3)
        let rightMove = SKAction.move(to: CGPoint(x:900, y:400), duration: 3)
        let sequence = SKAction.sequence([leftMove, rightMove])
        let runForever = SKAction.repeatForever(sequence)
        spark1.run(runForever)
        
        //使用particleAction属性添加动作
        
        
    }
    
}
