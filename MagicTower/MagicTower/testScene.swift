//
//  testScene.swift
//  MagicTower
//
//  Created by 胡杨林 on 2017/5/8.
//  Copyright © 2017年 胡杨林. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import GameplayKit


class Player: SKSpriteNode {
    static var player:Player? = nil
//    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
//        super.init(texture: texture, color: color, size: size)
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
}


class testScene: SKScene {
    
    var player:SKSpriteNode? = nil
    
    override func didMove(to view: SKView) {
        self.buildtestScene()
    }
    
    func buildtestScene(){
        
        //建立地图第0层   除这一层外其他层地图无波动效果不需要这么麻烦
        //这里的地图指的是所有可交互物品全部被清空的地图，包括但不限于 怪物 门 钥匙 道具（血瓶，宝石，剑盾）
        //这些可互动的道具后期作为单独节点进行添加，方便进行移除
        let map = SKSpriteNode(color: SKColor.purple, size: CGSize(width: 352, height: 352))
        map.anchorPoint = CGPoint.zero
        map.position = CGPoint(x: (414 - 352) / 2, y: ((self.view?.frame.size.height)! - 352 - 20))
        let F0A:SKTexture = SKTexture(imageNamed: "Floor0_A")
        let F0B:SKTexture = SKTexture(imageNamed: "Floor0_B")
        let t1 = SKAction.setTexture(F0A)
        let t2 = SKAction.setTexture(F0B)
        let t3 = SKAction.wait(forDuration: 0.8)
        let flash = SKAction.sequence([t1, t3, t2, t3])
        let loop = SKAction.repeatForever(flash)
        map.run(loop)
        addChild(map)
        
    }

    
}
