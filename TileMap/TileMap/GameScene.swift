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
    override func didMove(to view: SKView) {
        addChild(self.createScenery())
    }
    
    func createScenery() -> TileMapLayer {
        return TileMapLayer(atlasName: "scenery", tileSize: CGSize(width: 32, height: 32) , tileCodes:
        ["xxxxxxxxxxxxxxxxxxxxxx",
         "xoooooooooooooooooooox",
         "xoooooooooooooooooooox",
         "xooooxooooooooxxxoooox",
         "xooooxooooooooxoxoooox",
         "xooooxxxxxxxxxxoooooox",
         "xxxxxxxxxxxxxxxxxxxxxx"])
    }
    
}
