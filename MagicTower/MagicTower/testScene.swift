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

class logicMap: NSObject {
    override init() {
        super.init()
        //试试从txt文件来载入逻辑地图
        //直接手写数组未免太烦人
        let LogicMap0Str = "00000100000\n00000100000\n00000100000\n00000100000\n00000100000\n00000100000\n00000100000\n00001110000\n00000100000\n00000100000\n00000100000"
        let LogicMaptemp = LogicMap0Str.components(separatedBy: "\n")
        print("\(LogicMaptemp)")
        let LogicMap:NSMutableArray = NSMutableArray.init()
        for line in LogicMaptemp {
            let temp:NSMutableArray = NSMutableArray.init()
            for ch in line.characters {
                let s:String = "\(ch)"
                temp.add(s)
            }
            LogicMap.add(temp)
            print("本行分割结果为\(temp)")
        }
        print("最终结果为\n\(LogicMap)")
        //到这里LogicMap中存在一个正确的二维数组，可用
        //该方法可正确切割汉语字符串为单字
    }
}

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
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
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
            P.run(move, completion: { 
                let p2 = P.position
                print("现在位置坐标为x = \(p2.x) y = \(p2.y)")
            })
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
            P.run(move, completion: {
                let p2 = P.position
                print("现在位置坐标为x = \(p2.x) y = \(p2.y)")
            })
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
            P.run(move, completion: {
                let p2 = P.position
                print("现在位置坐标为x = \(p2.x) y = \(p2.y)")
            })
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
            P.run(move, completion: {
                let p2 = P.position
                print("现在位置坐标为x = \(p2.x) y = \(p2.y)")
            })
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
        self.buildBtn()
//        let d = logicMap.init()

    }
    
    func buildBtn() {
        //试试画一个扇形的view来制作自定义按钮
        let view = UIView.init(frame: CGRect(x: 20, y: 500, width: 200, height: 200))
        view.backgroundColor = SKColor.white
        self.view?.addSubview(view)
//        let size =  view.frame.size
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 40))
        path.addLine(to: CGPoint(x: 0, y: 80))
        path.addLine(to: CGPoint(x: 200, y: 80))
        path.addLine(to: CGPoint(x: 200, y: 40))  //右上的点
        path.addQuadCurve(to: CGPoint(x: 0, y: 40), controlPoint: CGPoint(x: 100, y: 0))  //回到左上的点，带上中上的控制点
        let layer = CAShapeLayer.init()
        layer.strokeColor = SKColor.purple.cgColor
        layer.fillColor = SKColor.black.cgColor
        layer.path = path.cgPath
        view.layer.addSublayer(layer)
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapAction))
        let view2 = UIView.init(frame: view.frame)
        view2.backgroundColor = SKColor.red
        //蒙版
        let maskLayer = CAShapeLayer.init()
        maskLayer.fillColor = UIColor.red.cgColor
        maskLayer.frame = view2.frame
        view2.layer.mask = maskLayer
        
        //边框蒙版
        let borderLayer = CAShapeLayer.init()
        //    maskBorderLayer.path = [bezierPath CGPath];
        borderLayer.path = path.cgPath
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.strokeColor = UIColor.blue.cgColor //边框颜色
        borderLayer.lineWidth = 2  //边框宽度
        view2.layer.addSublayer(borderLayer)  
        view.addSubview(view2)
        view2.addGestureRecognizer(tap)
        
    }
    func tapAction(){
        print("view2被点击了")
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
        a1.position = CGPoint(x: 176, y: 16)
//        a1.anchorPoint = CGPoint.zero
        mapcover.addChild(a1)
        self.map = mapcover
        a1.moveAction(WithDirection: "上")
        self.player = a1
        let luggage = SKSpriteNode(color: SKColor.red, size: CGSize(width: 32, height: 32))
        luggage.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        luggage.position = CGPoint(x: 176, y: 176)
        mapcover.addChild(luggage)
        mapcover.name = "mapcover"
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let p2 = self.player!.position
            print("移动前位置坐标为x = \(p2.x) y = \(p2.y)")
            let location = touch.location(in: self.map!)
            //获取点击位置
//            print("点击位置为x = \(location.x), y = \(location.y)")
            if location.x < 0 || location.x > 352 || location.y < 0 || location.y > 352 {
                print("触摸点不在区域内")
            }else{
                if location.x <= location.y {
                    if location.x + location.y >= 352.0 {  //四分上区域
                        //这里可以顺利检测到player的父节点上的其他子节点并触发事件，且节点hidden后不会继续触发，重置游戏后遍历所有子节点更改为ishidden = false 即可
                        let a = CGPoint(x: p2.x, y: p2.y + 32)
                        let cover = self.childNode(withName: "mapcover") as! SKSpriteNode
                        let t = cover.nodes(at: a)
                        if t.count > 0 {
                            print("检测到事件触发点")
                            for w in t {
                                let w2 = w as! SKSpriteNode
                                w2.isHidden = true
                            }
                        }
                        
                        
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
