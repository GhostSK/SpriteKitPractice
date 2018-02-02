//
//  GameScene.swift
//  shenjingmao
//
//  Created by 胡杨林 on 2018/1/22.
//  Copyright © 2018年 胡杨林. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var NodesArr:Array = [CircleNode]()
    var BackgroundNode:SKSpriteNode?
    var isMapChanged = false
    var cat = CrazyCat.BuildCrazyCat()
    override func didMove(to view: SKView) {
        super.didMove(to: view)
//        print("scene顺利提交")
        self.BackgroundNode = SKSpriteNode.init(color: SKColor.white, size: self.view!.frame.size)
        self.BackgroundNode?.anchorPoint = CGPoint(x: 0, y: 0)
        self.BackgroundNode?.position = CGPoint(x: 0, y: 0)
        addChild(self.BackgroundNode!)
        let nodewidth = (self.scene?.view?.frame.width)! / 11
        for i in 6...15 {
            for j in 1...10{
                var x:CGFloat = 0.0
                if i % 2 == 0{
                    x = CGFloat(j) * nodewidth - nodewidth / 4
                }else{
                    x = CGFloat(j) * nodewidth + nodewidth / 4
                }
                self.setMapNode(position: CGPoint(x:x, y: CGFloat(i - 1) * nodewidth * (sqrt(3) / 2.0) + nodewidth))
            }
        }
        for node in self.NodesArr {
            node.around = getsurroundNodes(Position: node.position)
        }//初始化地图
        let a = arc4random()%13+8
        print("a =",a)
        for _ in 0...a {
            let b = Int(arc4random()%UInt32(self.NodesArr.count))
            let node = self.NodesArr[b]
            node.NodedidSelected()
        }
        let catnode = self.NodesArr[55]
        self.refreshMapStatus()
        self.cat.NowPositionNode = catnode
        self.cat.position = catnode.position
        self.cat.superView = self.view
        addChild(self.cat)
        
    }
    func setMapNode(position:CGPoint){
        let node = CircleNode.buildMapNode(Width: (self.scene?.view?.frame.width)! / 11)
        node.position = position
        addChild(node)
        self.NodesArr.append(node)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch?.location(in: self.BackgroundNode!)
        print("location =",location!)
        let arr = nodes(at: (touch?.location(in: self.BackgroundNode!))!)
        for node in arr {
            if node.isKind(of: CircleNode.self){
                if node == self.cat.NowPositionNode {
                    return
                }
                let node2 = node as! CircleNode
                if node2.isSelected == false {
                    node2.NodedidSelected()
                    node2.distance = 999
                    refreshMapStatus()
                    self.cat.catmove()
                    break
                }
            }
        }
        
    }
    
    func getsurroundNodes(Position:CGPoint) -> [CircleNode] {
        var arr = [CircleNode]()
        let nodewidth = (self.scene?.view?.frame.width)! / 11
        let p1 = CGPoint(x: Position.x - nodewidth, y: Position.y)
        let p2 = CGPoint(x: Position.x + nodewidth, y: Position.y)
        let p3 = CGPoint(x: Position.x - nodewidth / 2, y: Position.y + nodewidth * (sqrt(3) / 2.0))
        let p4 = CGPoint(x: Position.x + nodewidth / 2, y: Position.y + nodewidth * (sqrt(3) / 2.0))
        let p5 = CGPoint(x: Position.x - nodewidth / 2, y: Position.y - nodewidth * (sqrt(3) / 2.0))
        let p6 = CGPoint(x: Position.x + nodewidth / 2, y: Position.y - nodewidth * (sqrt(3) / 2.0))
        let PositionArr = [p1,p2,p3,p4,p5,p6]
        for p in PositionArr {
            let node2 = nodes(at: p)
            for q in node2 {
                if q.isKind(of: CircleNode.self) {
                    arr.append(q as! CircleNode)
                }
            }
        }
        return arr
    }
    
    func refreshMapStatus(){

        for node in self.NodesArr {
            if node.around.count < 6 && node.isSelected == false { //边缘节点
                node.distance = 0
            }else{
                node.distance = 999
            }
        }
        self.isMapChanged = true
        while self.isMapChanged == true {
            
            self.isMapChanged = false
            for node in self.NodesArr {
                if node.isSelected == false {
                    for aroundNode in node.around {
                        if aroundNode.distance + 1 < node.distance {
                            node.distance = aroundNode.distance + 1
                            self.isMapChanged = true
                        }
                    }
                }
            }
        }
        for node in self.NodesArr {
            node.label?.text = "\(node.distance)"
        }
    }

}

class CircleNode: SKShapeNode {
    var isSelected:Bool = false
    var distance:NSInteger = 999
    var label:SKLabelNode? = nil
    var around:[CircleNode] = []
    class func buildMapNode(Width:CGFloat)->CircleNode{
        let texture = SKTexture.init(image: UIImage.init(named: "UnselectedNode")!)
        let node:CircleNode = CircleNode.init(circleOfRadius: Width / 2)
        node.fillColor = SKColor.white
        node.fillTexture = texture
//        node.label = SKLabelNode.init()
//        node.label!.text = "999"
//        node.label!.fontSize = 18
//        node.label!.fontColor = SKColor.black
//        node.addChild(node.label!)
        return node
    }
    
    func NodedidSelected(){
        if self.isSelected {
            return
        }else{
            self.isSelected = true
            self.fillTexture = SKTexture(image: UIImage.init(named: "SelectedNode")!)
        }
        let location = self.position
//        print("x =",location.x,"y =",location.y)
    }
}
class CrazyCat:SKSpriteNode {
    var NowPositionNode:CircleNode = CircleNode.init()
    var superView:SKView? = nil
    class func BuildCrazyCat()->CrazyCat{
        let Cat1texture1 = SKTexture.init(image: UIImage.init(named: "CrazyCat1")!)
        let Cat1texture2 = SKTexture.init(image: UIImage.init(named: "CrazyCat2")!)
        let actionWait = SKAction.wait(forDuration: 0.5)
        let action1 = SKAction.setTexture(Cat1texture2)
        let action2 = SKAction.setTexture(Cat1texture1)
        let action0 = SKAction.sequence([action1,actionWait,action2,actionWait])
        let action = SKAction.repeatForever(action0)
        let cat = CrazyCat.init(texture: Cat1texture1, color: SKColor.clear, size: CGSize(width: 414.0 / 11, height: 414.0 / 11 * 1.3))
        cat.anchorPoint = CGPoint(x: 0.5, y: 0.1)
        cat.run(action)
        return cat
    }
    
    func catmove(){
        var distance = 999
        var nextnode:CircleNode? = nil
        if self.NowPositionNode.distance == 0{
            print("you lose!!!!!")
            let label = UILabel.init(frame: CGRect(x: 20, y: 150, width: 280, height: 40))
            label.text = "YOU LOSE"
            self.superView?.addSubview(label)
            return
        }
        
        for node in self.NowPositionNode.around {
            if node.distance < distance && node.isSelected == false {
                nextnode = node
                distance = node.distance
            }
        }
        if distance == 999 { //猫已被封闭
            for node in self.NowPositionNode.around {
                if node.isSelected == false{
                    nextnode = node  //随机走一步
                    break
                }
            }
        }
        if nextnode == nil {
            print("you win!!!!!")
            let label = UILabel.init(frame: CGRect(x: 20, y: 150, width: 280, height: 40))
            label.text = "YOU WIN"
            self.superView?.addSubview(label)
        }else{
            self.position = nextnode!.position
            self.NowPositionNode = nextnode!
        }
        
    }
    
}

