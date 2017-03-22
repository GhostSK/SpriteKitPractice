//
//  TileMapLayer.swift
//  TileMap
//
//  Created by 胡杨林 on 17/3/20.
//  Copyright © 2017年 胡杨林. All rights reserved.
//

import Foundation
import SpriteKit

class TileMapLayer : SKNode {
    var tileSize: CGSize = CGSize()   //用来保存瓦片的大小
    var atlas: SKTextureAtlas? = nil  //用来保存纹理集合
    
    init(tilesize: CGSize) {
        super.init()
        self.tileSize = tilesize
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(atlasName: String, tileSize: CGSize, tileCodes: [String]) {
        self.init(tilesize: tileSize)
        self.position = CGPoint(x: 0, y: 0)
        atlas = SKTextureAtlas(named: atlasName)
        //遍历
        for row in 0..<tileCodes.count {
            var line = tileCodes[row] as String
            var i = 0
            for char in line.characters{
//                print("\(i) --- \(char)")
                let tile = nodeForCode(tileCode: char)
                tile?.position = self.position(ForRow: row, col: i)
                if tile != nil {
                    addChild(tile!)
                }
                i += 1
                
            }
        }
    }
    
    //获取对应的瓦片
    func nodeForCode(tileCode:Character) -> SKNode? {
        //判断atlas是否为空
        if atlas == nil{
            return nil
        }
        var tile: SKNode?
        //判断tileCode
        switch tileCode {
            
        case "x":
            tile = SKSpriteNode(texture: atlas!.textureNamed("wall"))
            break
        case "o":
            tile = SKSpriteNode(texture: atlas!.textureNamed("grass"))
            break
        case "w":
            tile = SKSpriteNode(texture: atlas!.textureNamed("water"))
            break
        case "=":
            tile = SKSpriteNode(texture: atlas!.textureNamed("stone"))
            break
        default:
            print("未知图片")
            break
        }
        if let sprite = tile as? SKSpriteNode {
            sprite.blendMode = .replace
            sprite.texture?.filteringMode = .nearest
        }
        return tile
    }
    
    func position(ForRow:Int, col: Int) ->CGPoint {
        let x = CGFloat(col) * tileSize.width + tileSize.width / 2
        let y = 300 - CGFloat(ForRow) * tileSize.height + tileSize.height / 2
        return CGPoint(x: x, y: y)
    }
    
    
    
}
