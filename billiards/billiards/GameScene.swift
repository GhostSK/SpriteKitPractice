//
//  GameScene.swift
//  billiards
//
//  Created by 胡杨林 on 2017/8/2.
//  Copyright © 2017年 胡杨林. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    var ball:SKSpriteNode? = nil
    var count:Int = 0
    var point:CGPoint = CGPoint.zero
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
        
        
 
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.ball!.physicsBody?.isDynamic = true
        print("\(self.ball!.position.x) +++ \(self.ball!.position.y)")
        print("\(self.ball!.size.width) +++ \(self.ball!.size.height)")
        for touch in touches {
            let touchA:UITouch = touch
            let touchPoint = touchA.location(in: self)
            print("点击位置是 x = \(touchPoint.x), y = \(touchPoint.y)")
            self.ball?.physicsBody?.applyImpulse(CGVector(dx: (self.ball!.position.x - touchPoint.x) / self.view!.frame.size.width * 500 , dy: (self.ball!.position.y - touchPoint.y) / self.view!.frame.size.width * 500))
        }
        

        
    }
    override func didSimulatePhysics(){
        if self.ball!.position.x - self.point.x < 0.03 && self.ball!.position.y - self.point.y < 0.03 {
//            self.ball?.physicsBody?.isDynamic = false
//            print("球停下了 x = \(self.ball!.position.x) y = \(self.ball!.position.y)")
        }
        self.point = self.ball!.position
        
    }
    override func didFinishUpdate() {

    }
    
    func buildBasephysicsWorld(){
        
    }
    func buildBalls(){
        self.buildBall(textureName: "球球 (0).png", position: CGPoint(x: 60, y: 150))
        self.buildBall(textureName: "球球 (1).png", position: CGPoint(x: 280, y: 250))
        self.buildBall(textureName: "球球 (2).png", position: CGPoint(x: 240, y: 250))
        self.buildBall(textureName: "球球 (3).png", position: CGPoint(x: 200, y: 250))
        self.buildBall(textureName: "球球 (4).png", position: CGPoint(x: 160, y: 250))
        self.buildBall(textureName: "球球 (5).png", position: CGPoint(x: 120, y: 290))
        self.buildBall(textureName: "球球 (6).png", position: CGPoint(x: 280, y: 290))
        self.buildBall(textureName: "球球 (7).png", position: CGPoint(x: 240, y: 290))
        self.buildBall(textureName: "球球 (8).png", position: CGPoint(x: 200, y: 290))
        self.buildBall(textureName: "球球 (9).png", position: CGPoint(x: 160, y: 380))
        
    }
    func buildBall(textureName:String, position:CGPoint){
        let ball1 = SKSpriteNode(texture: SKTexture(imageNamed: textureName))
        ball1.position = position
        ball1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
//        ball1.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: textureName), size: ball1.size)
        ball1.physicsBody = SKPhysicsBody(circleOfRadius: 16, center: CGPoint(x: 0.5, y: 0.5))
        ball1.physicsBody?.isDynamic = true
        ball1.physicsBody?.restitution = 0.85
        ball1.physicsBody?.linearDamping = 0.28
        ball1.physicsBody?.friction = 0.45
        ball1.physicsBody?.angularDamping = 0.12
        ball1.physicsBody?.mass = 0.4
        ball1.physicsBody?.contactTestBitMask = 3
        ball1.physicsBody?.categoryBitMask = 1
        
        if textureName == "球球 (0).png" {
            self.ball = ball1  //白球
            ball1.name = "智障白球"
        }
        addChild(ball1)
    }
    
    
    func buildPocket(){
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
            if disappearBall?.node?.name == "智障白球" {
                disappearBall?.node?.position = CGPoint(x: 100, y: 100)
                addChild(disappearBall!.node!)
            }
        }
        
        
    }
    func didEnd(_ contact: SKPhysicsContact) {
        
    }
    
}
