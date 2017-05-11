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
    static var player = Player.init()
    let upA = SKTexture(imageNamed: "f-864.jpg")
    let upB = SKTexture(imageNamed: "f-894.jpg")
    let leftA = SKTexture(imageNamed: "f-862.jpg")
    let leftB = SKTexture(imageNamed: "f-892.jpg")
    let rightA = SKTexture(imageNamed: "f-863.jpg")
    let rightB = SKTexture(imageNamed: "f-893.jpg")
    let downA = SKTexture(imageNamed: "f-865.jpg")
    let downB = SKTexture(imageNamed: "f-895.jpg")
    
    init() {
        super.init(texture: upA, color: SKColor.clear, size: CGSize(width: 32, height: 32))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class func shareInstance()-> Player{
        return self.player
    }
    
    func moveAction(WithDirection:String) {
        let P = Player.shareInstance()
        switch WithDirection {
        case "上":
            print("向上走一步")
            if P.texture == upA {
                let Action = SKAction.setTexture(upB)
                P.run(Action)
            }else{
                let Action = SKAction.setTexture(upA)
                P.run(Action)
            }
            let move = SKAction.move(by: CGVector(dx: 0, dy: 32), duration: 0.0)
            P.run(move)
            break
        case "下":
            print("向下走一步")
            if P.texture == downA {
                let Action = SKAction.setTexture(downB)
                P.run(Action)
            }else{
                let Action = SKAction.setTexture(downA)
                P.run(Action)
            }
            let move = SKAction.move(by: CGVector(dx: 0, dy: -32), duration: 0.0)
            P.run(move)
            break
        case "左":
            print("向左走一步")
            if P.texture == leftA {
                let Action = SKAction.setTexture(leftB)
                P.run(Action)
            }else{
                let Action = SKAction.setTexture(leftA)
                P.run(Action)
            }
            let move = SKAction.move(by: CGVector(dx: -32, dy: 0), duration: 0.0)
            P.run(move)
            break
        case "右":
            print("向右走一步")
            if P.texture == rightA {
                let Action = SKAction.setTexture(rightB)
                P.run(Action)
            }else{
                let Action = SKAction.setTexture(rightA)
                P.run(Action)
            }
            let move = SKAction.move(by: CGVector(dx: 32, dy: 0), duration: 0.0)
            P.run(move)
            break
            
        default:
            break
        }
    }
    
    
    

}


class testScene: SKScene {
    
    var player:Player? = nil
    var map :SKSpriteNode? = nil
    override func didMove(to view: SKView) {
        self.buildtestScene()
    }
    
    func buildtestScene(){
        
        //建立地图第0层   除这一层外其他层地图无波动效果不需要这么麻烦
        //这里的地图指的是所有可交互物品全部被清空的地图，包括但不限于 怪物 门 钥匙 道具（血瓶，宝石，剑盾）
        //这些可互动的道具后期作为单独节点进行添加，方便进行移除
        //如果墙壁和道路使用背景图来进行描绘的话，如何进行墙壁的检测？是否加入逻辑地图用来记录地图信息？
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
        let mapcover = SKSpriteNode(color: SKColor.clear, size: map.size)
        //仅地图第0层需要用到地图覆盖层，因为背景的纹理置换会导致后添加的子节点被遮盖，其他地图无替换动作不需要这一步
        mapcover.anchorPoint = CGPoint.zero
        mapcover.position = map.position
        mapcover.zPosition = 1.0
        addChild(mapcover)
        
        let a1 = Player.shareInstance()
        a1.position = CGPoint(x: 160, y: 0)
        a1.anchorPoint = CGPoint.zero
        mapcover.addChild(a1)
        self.map = mapcover
        a1.moveAction(WithDirection: "上")
        self.player = a1
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let a2 = touches.count
            print("触摸总数为\(a2)次")
            let location = touch.location(in: self.map!)
            //获取点击位置
            print("点击位置为x = \(location.x), y = \(location.y)")
            if location.x < 0 || location.x > 352 || location.y < 0 || location.y > 352 {
                print("触摸点不在区域内")
            }else{
                if location.x <= location.y {
                    if location.x + location.y >= 352.0 {  //四分上区域
                        self.player?.moveAction(WithDirection: "上")
                    }else{  //四分区域左侧
                        self.player?.moveAction(WithDirection: "左")
                    }
                }else{
                    if location.x + location.y >= 352.0 { //四分区域右侧
                        self.player?.moveAction(WithDirection: "右")
                    }else{ //四分区域下侧
                        self.player?.moveAction(WithDirection: "下")
                    }
                }
            }
        }
    }
    
}
