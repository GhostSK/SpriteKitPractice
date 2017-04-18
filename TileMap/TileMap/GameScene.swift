//
//  GameScene.swift
//  TileMap
//
//  Created by 胡杨林 on 17/3/20.
//  Copyright © 2017年 胡杨林. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var size11:CGSize? = nil
    var worldNode:SKNode!
    var backgroundLayer:TileMapLayer!
    
    override func didMove(to view: SKView) {
        self.scaleMode = .resizeFill
        anchorPoint = CGPoint(x: 0, y: 0)
        addChild(self.createScenery())
        self.size = self.size11!   //在这里约束size无效，你需要在VC中在scene创建的时候就计算一下size的大小然后resizeFill才能生效
        self.backgroundColor = SKColor.white
    }
    func createWorld() {
        backgroundLayer = createScenery()
        worldNode = SKNode()
        worldNode.addChild(backgroundLayer)
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        worldNode.position = CGPoint(x: 0.5 , y: 0.5)
    //需要修改为中心店
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        var mytouches = touches as NSSet
        let touch = mytouches.anyObject() as! UITouch
        
    }
    func centerViewOn(centerOn:CGPoint) {
        let x = centerOn.x.
    }
    
    
    func createScenery() -> TileMapLayer {
        let a = TileMapLayer(atlasName: "scenery", tileSize: CGSize(width: 32, height: 32) , tileCodes:
            ["xxxxxxxxxxxxxxxxxxxxxx",
             "xoooooooooooooooooooox",
             "xoooooooooooooooooooox",
             "xooooxooooooooxxxoooox",
             "xooooxooooooooxoxoooox",
             "xooooxxxxxxxxxxoooooox",
             "xxxxxxxxxxxxxxxxxxxxxx"])
        self.size11 = a.frame.size
//        return a
        return tileMapLayerFromFileNamed(fileName: "background.txt")!
    }
    
}
