//
//  GameScene.swift
//  A1
//
//  Created by 胡杨林 on 2017/6/23.
//  Copyright © 2017年 胡杨林. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var node:SKSpriteNode? = nil
    //SKCropNode不渲染maskNode的content，也不渲染maskNode没有遮盖的地方，crop只渲染maskNode的边框外形，然后maskNode的content会渲染出crop的childrens，按maskNode的边框切割出来的形状渲染，当maskNode移动时，childrens的其他部分也可以被渲染出来，可以这样理解，crop的child是不可见的，而maskNode是可以让child可见的裁剪区域
    override func didMove(to view: SKView) {
        
        self.backgroundColor = SKColor.purple
        let back = SKSpriteNode.init(color: SKColor.clear, size: CGSize(width: 1200, height: 400))
        back.anchorPoint = CGPoint.zero
        back.position = CGPoint(x: -200, y: 0)
        
        let node = SKSpriteNode.init(color: SKColor.blue, size: CGSize(width: 400, height: 400))
        node.anchorPoint = CGPoint.zero
        node.position = CGPoint(x: 0, y: 0)
        back.addChild(node)
        let node3 = SKSpriteNode.init(color: SKColor.green, size: CGSize(width: 400, height: 400))
        node3.anchorPoint = CGPoint.zero
        node3.position = CGPoint(x: 400, y: 0)
        back.addChild(node3)
        let node4 = SKSpriteNode.init(color: SKColor.yellow, size: CGSize(width: 400, height: 400))
        node4.anchorPoint = CGPoint.zero
        node4.position = CGPoint(x: 800, y: 0)
        back.addChild(node4)
        
        self.node = back
        
        let node2 = SKCropNode.init()
        node2.position = CGPoint(x: 0, y: 0)
        let mask = SKSpriteNode.init(color: SKColor.white, size: CGSize(width: 100, height: 400))
        mask.anchorPoint = CGPoint.zero
        mask.position = CGPoint(x: 200, y: 0)
        node2.maskNode = mask
        addChild(node2)
        node2.addChild(back)
        back.position = CGPoint(x: -200, y: 200)
        
        //警告，mask节点如果为透明色会导致全屏无渲染
        /*
         在初始化以及直接设定坐标的过程中，即使用node.position = CGPoint(x: 0, y: 0)的方式来操作节点位置的时候，其相对坐标为self.scene
         但是在使用           let move = SKAction.move(to: CGPoint(x: 0, y: 0), duration: 1.0) self.node?.run(move)
         这样的movetoAction的方法中，point点设定是相对于maskNode而言，即原点CGPoint(x: 0, y: 0)不是屏幕的左下角，而是maskNode即遮罩窗口的左下角，务必注意这一点
         */
        
        let t = SKSpriteNode.init(color: SKColor.red, size: CGSize(width: 100, height: 100))
        t.position = CGPoint(x: 150, y: 550)
        addChild(t)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let point = self.node?.position
        if point!.x <= CGFloat(-800) {
//            let move = SKAction.move(to: CGPoint(x: 0, y: 0), duration: 1.0)
//            self.node?.run(move)
            self.node?.position = CGPoint(x: -200, y: 200)
        }else{
            let move = SKAction.move(by: CGVector(dx: -400, dy: 0), duration: 1.0)
            self.node?.run(move)
        }
    }
    
    
}
