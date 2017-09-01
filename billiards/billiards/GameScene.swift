//
//  GameScene.swift
//  billiards
//
//  Created by 胡杨林 on 2017/8/2.
//  Copyright © 2017年 胡杨林. All rights reserved.
//

import SpriteKit
import GameplayKit


class BallInfo: NSObject {
    var Position: CGPoint = CGPoint.zero
    var Name: String = ""
    class func setBallInfo(Position:CGPoint, Name:String) -> BallInfo {
        let info = BallInfo.init()
        info.Position = Position
        info.Name = Name
        return info
    }
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    let kwidth = UIScreen.main.bounds.size.width
    let kheight = UIScreen.main.bounds.size.height
    var ball:SKSpriteNode? = nil //白球
    var cue:SKSpriteNode? = nil  //球杆节点，无物理实体仅执行动画
    var GameState:Int = 0  //0:选择角度 1：选择力度 2：等待球停止
    var AnglePoint:CGPoint = CGPoint.zero  //角度选择位置，相对于白球,同时也是击球动画结束位置
    var BallsArr:NSMutableArray = NSMutableArray.init()
    var LastPositionArr:NSMutableArray = NSMutableArray.init()
    var HitPower:CGFloat = 0.0
    override func didMove(to view: SKView) {
        //建立物理世界
        self.backgroundColor = SKColor.white
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: CGRect(x: 15, y: 15, width: self.view!.frame.size.width - 30, height: self.view!.frame.size.height - 30))
        let backnode = SKSpriteNode.init(color: SKColor.init(colorLiteralRed: 153.0/255.0, green: 204.0/255.0, blue: 51.0/255.0, alpha: 1.0), size: CGSize(width: self.view!.frame.size.width - 30, height: self.view!.frame.size.height - 30))
        backnode.anchorPoint = CGPoint.zero
        backnode.position = CGPoint(x: 15, y: 15)
        addChild(backnode)
        self.physicsWorld.gravity = CGVector(dx: 0.0, dy: 0.0)
        self.physicsWorld.contactDelegate = self
        
        self.buildBalls()
        self.buildPocket()
        self.setcue()
        
        
        
 
    }
    
    func buildBalls(){
        self.buildBall(textureName: "球球 (0).png", position: CGPoint(x: kwidth / 2, y: 100))
        self.buildBall(textureName: "球球 (1).png", position: CGPoint(x: kwidth / 2, y: kheight - 200))
        self.buildBall(textureName: "球球 (2).png", position: CGPoint(x: kwidth / 2 + 15, y: kheight - 200 + 26))
        self.buildBall(textureName: "球球 (3).png", position: CGPoint(x: kwidth / 2 - 15, y: kheight - 200 + 26))
        self.buildBall(textureName: "球球 (4).png", position: CGPoint(x: kwidth / 2, y: kheight - 200 + 52))
        self.buildBall(textureName: "球球 (5).png", position: CGPoint(x: kwidth / 2 - 30, y: kheight - 200 + 52))
        self.buildBall(textureName: "球球 (6).png", position: CGPoint(x: kwidth / 2 + 30, y: kheight - 200 + 52))
        self.buildBall(textureName: "球球 (7).png", position: CGPoint(x: kwidth / 2 + 15, y: kheight - 200 + 78))
        self.buildBall(textureName: "球球 (8).png", position: CGPoint(x: kwidth / 2 - 15, y: kheight - 200 + 78))
        self.buildBall(textureName: "球球 (9).png", position: CGPoint(x: kwidth / 2, y: kheight - 200 + 104))
    }
    
    func buildBall(textureName:String, position:CGPoint){
        let ball1 = SKSpriteNode(texture: SKTexture(imageNamed: textureName))
        ball1.position = position
        ball1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        ball1.physicsBody = SKPhysicsBody(circleOfRadius: 16, center: CGPoint(x: 0.5, y: 0.5))
        ball1.physicsBody?.isDynamic = true
        ball1.physicsBody?.restitution = 0.85
        ball1.physicsBody?.linearDamping = 0.90
        ball1.physicsBody?.friction = 0.20
        ball1.physicsBody?.angularDamping = 0.15
        ball1.physicsBody?.mass = 7.5
        ball1.physicsBody?.contactTestBitMask = 3
        ball1.physicsBody?.categoryBitMask = 1
        ball1.name = textureName
        self.BallsArr.add(ball1)
        let info = BallInfo.setBallInfo(Position: ball1.position, Name: textureName)
        self.LastPositionArr.add(info)
        if textureName == "球球 (0).png" {
            self.ball = ball1  //白球
        }
        addChild(ball1)
    }
    
    func setcue(){
        let cue = SKSpriteNode(color: SKColor.brown, size: CGSize(width: 10, height: 200))
        cue.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        cue.position = CGPoint(x: 0, y: 0)
        cue.zRotation = 3.141592654
        self.cue = cue
    }

    func buildPocket(){  //球袋
        let path1 = UIBezierPath.init()
        path1.move(to: CGPoint(x: 15, y: 15))
        path1.addLine(to: CGPoint(x: 35, y: 15))
        path1.addQuadCurve(to: CGPoint(x: 15, y: 35), controlPoint: CGPoint(x: 35, y: 35))
        path1.addLine(to: CGPoint(x: 15, y: 15))
        
        
        let pocket1 = SKShapeNode(path: path1.cgPath)
        pocket1.physicsBody = SKPhysicsBody(polygonFrom: path1.cgPath)
        pocket1.fillColor = SKColor.black
        pocket1.strokeColor = SKColor.black
        pocket1.physicsBody?.isDynamic = false
        pocket1.physicsBody?.categoryBitMask = 3
        pocket1.physicsBody?.contactTestBitMask = 1
        addChild(pocket1)
        
        let path2 = UIBezierPath.init()
        path2.move(to: CGPoint(x: self.view!.frame.size.width - 15, y: 15))
        path2.addLine(to: CGPoint(x: self.view!.frame.size.width - 35, y: 15))
        path2.addQuadCurve(to: CGPoint(x: self.view!.frame.size.width - 15, y: 35), controlPoint: CGPoint(x: self.view!.frame.size.width - 35, y: 35))
        path2.addLine(to: CGPoint(x: self.view!.frame.size.width - 15, y: 15))
        
        
        let pocket2 = SKShapeNode(path: path2.cgPath)
        pocket2.physicsBody = SKPhysicsBody(polygonFrom: path2.cgPath)
        pocket2.fillColor = SKColor.black
        pocket2.strokeColor = SKColor.black
        pocket2.physicsBody?.isDynamic = false
        pocket2.physicsBody?.categoryBitMask = 3
        pocket2.physicsBody?.contactTestBitMask = 1
        addChild(pocket2)
        
        let path3 = UIBezierPath.init()
        path3.move(to: CGPoint(x: self.view!.frame.size.width - 15, y: self.view!.frame.size.height - 15))
        path3.addLine(to: CGPoint(x: self.view!.frame.size.width - 35, y: self.view!.frame.size.height - 15))
        path3.addQuadCurve(to: CGPoint(x: self.view!.frame.size.width - 15, y: self.view!.frame.size.height - 35), controlPoint: CGPoint(x: self.view!.frame.size.width - 35, y: self.view!.frame.size.height - 35))
        path3.addLine(to: CGPoint(x: self.view!.frame.size.width - 15, y: self.view!.frame.size.height - 15))
        
        
        let pocket3 = SKShapeNode(path: path3.cgPath)
        pocket3.physicsBody = SKPhysicsBody(polygonFrom: path3.cgPath)
        pocket3.fillColor = SKColor.black
        pocket3.strokeColor = SKColor.black
        pocket3.physicsBody?.isDynamic = false
        pocket3.physicsBody?.categoryBitMask = 3
        pocket3.physicsBody?.contactTestBitMask = 1
        addChild(pocket3)
        
        let path4 = UIBezierPath.init()
        path4.move(to: CGPoint(x:15, y: self.view!.frame.size.height - 15))
        path4.addLine(to: CGPoint(x: 35, y: self.view!.frame.size.height - 15))
        path4.addQuadCurve(to: CGPoint(x: 15, y: self.view!.frame.size.height - 35), controlPoint: CGPoint(x: 35, y: self.view!.frame.size.height - 35))
        path4.addLine(to: CGPoint(x: 15, y: self.view!.frame.size.height - 15))
        
        
        let pocket4 = SKShapeNode(path: path4.cgPath)
        pocket4.physicsBody = SKPhysicsBody(polygonFrom: path4.cgPath)
        pocket4.fillColor = SKColor.black
        pocket4.strokeColor = SKColor.black
        pocket4.physicsBody?.isDynamic = false
        pocket4.physicsBody?.categoryBitMask = 3
        pocket4.physicsBody?.contactTestBitMask = 1
        addChild(pocket4)
        
        let path5 = UIBezierPath.init()
        path5.move(to: CGPoint(x: 15, y: self.view!.frame.size.height / 2 - 15))
        path5.addLine(to: CGPoint(x: 15, y: self.view!.frame.size.height / 2 + 15))
        path5.addArc(withCenter: CGPoint(x: 15, y: self.view!.frame.size.height / 2), radius: 15, startAngle:1.5, endAngle: -1.5, clockwise: false)
        
        
        let pocket5 = SKShapeNode(path: path5.cgPath)
        pocket5.physicsBody = SKPhysicsBody(polygonFrom: path5.cgPath)
        pocket5.fillColor = SKColor.black
        pocket5.strokeColor = SKColor.black
        pocket5.physicsBody?.isDynamic = false
        pocket5.physicsBody?.categoryBitMask = 3
        pocket5.physicsBody?.contactTestBitMask = 1
        addChild(pocket5)
        
        let path6 = UIBezierPath.init()
        path6.move(to: CGPoint(x: self.view!.frame.size.width - 15, y: self.view!.frame.size.height / 2 - 15))
        path6.addLine(to: CGPoint(x: self.view!.frame.size.width - 15, y: self.view!.frame.size.height / 2 + 15))
        path6.addArc(withCenter: CGPoint(x: self.view!.frame.size.width - 15, y: self.view!.frame.size.height / 2), radius: 15, startAngle:1.5, endAngle: -1.5, clockwise: true)
        
        
        let pocket6 = SKShapeNode(path: path6.cgPath)
        pocket6.physicsBody = SKPhysicsBody(polygonFrom: path6.cgPath)
        pocket6.fillColor = SKColor.black
        pocket6.strokeColor = SKColor.black
        pocket6.physicsBody?.isDynamic = false
        pocket6.physicsBody?.categoryBitMask = 3
        pocket6.physicsBody?.contactTestBitMask = 1
        addChild(pocket6)
  
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        print("发生了碰撞")
        let bodyA = contact.bodyA
        let bodyB = contact.bodyB
        if ((bodyA.categoryBitMask == 1 && bodyB.categoryBitMask == 3) || (bodyA.categoryBitMask == 3 && bodyB.categoryBitMask == 1)) {
            print("碰撞了球袋")
            var disappearBall:SKPhysicsBody? = nil
            if bodyA.categoryBitMask == 1 {
                bodyA.node?.removeFromParent()
                disappearBall = bodyA
            }else{
                bodyB.node?.removeFromParent()
                disappearBall = bodyB
            }
            if disappearBall?.node?.name == "球球 (0).png" {
                disappearBall?.node?.position = CGPoint(x: kwidth / 2, y: 100)
                addChild(disappearBall!.node!)
            }else{
                //可以考虑剔除已经进了的球的信息，to do list
            }
        }
        
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.GameState == 0 {
            self.cue?.isHidden = false
        }else{
            
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.GameState == 0 {  //角度
            let touch = touches.first
            let touchpoint = touch!.location(in: self.ball!)
            let ballPoint = self.ball!.position
            let arc = -touchpoint.x / touchpoint.y
            self.cue?.zRotation = atan(arc)
            let a4 = sqrt(1 / (touchpoint.x * touchpoint.x + touchpoint.y * touchpoint.y))
            let PointBaseBall = CGPoint(x: 150 * touchpoint.x * a4, y: 150 * touchpoint.y * a4)
            let truePoint = CGPoint(x: PointBaseBall.x + ballPoint.x, y: PointBaseBall.y + ballPoint.y)
            self.cue?.position = truePoint
            self.AnglePoint = CGPoint(x: 115 * touchpoint.x * a4, y: 115 * touchpoint.y * a4)
        } else if self.GameState == 1 {   //力度
            let touch = touches.first
            let touchpoint = touch!.location(in: self.ball!)
            self.HitPower = sqrt(touchpoint.x * touchpoint.x + touchpoint.y * touchpoint.y) //击球力度
            let ballPoint = self.ball!.position
            let cuePosition = CGPoint(x: ballPoint.x + self.AnglePoint.x / 115 * (HitPower + 100), y: ballPoint.y + self.AnglePoint.y / 115 * (HitPower + 100))
            self.cue?.position = cuePosition
        }
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.GameState == 0 {
            self.GameState = 1
        }else if self.GameState == 1 {
            self.GameState = 2
            let cueAction = SKAction.move(to: CGPoint(x: (self.ball?.position.x)! + self.AnglePoint.x, y: (self.ball?.position.y)! + self.AnglePoint.y), duration: 0.15)
            self.cue?.run(cueAction, completion: {
                self.cue?.isHidden = true
                self.ball?.physicsBody?.applyImpulse(CGVector(dx: -self.AnglePoint.x * self.HitPower, dy: -self.AnglePoint.y * self.HitPower))
            })
        }
    }
    
    override func didFinishUpdate() {
        if self.GameState == 2 {
            var isAllBallStop = true
            for node1 in self.BallsArr {
                let node = node1 as! SKSpriteNode
                let ballname = node.name
                let NewPosition = node.position
                for Info1 in self.LastPositionArr {
                    let info = Info1 as! BallInfo
                    if info.Name == ballname {
                        let distance = (info.Position.x - NewPosition.x) * (info.Position.x - NewPosition.x) + (info.Position.y - NewPosition.y) * (info.Position.y - NewPosition.y)
                        if distance > 0.02 {
                            isAllBallStop = false
                        }
                        info.Position = NewPosition
                    }
                }
            }
            if isAllBallStop == true {
                self.GameState = 0
                print("球都静止了")
            }
        }
    }
    
}
