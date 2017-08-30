//
//  GameScene.swift
//  billiards
//
//  Created by 胡杨林 on 2017/8/2.
//  Copyright © 2017年 胡杨林. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
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

        self.buildBalls()
        
        
        
 
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.ball?.physicsBody?.applyImpulse(CGVector(dx: 15.0, dy: 10.0))
        self.ball!.physicsBody?.isDynamic = true
        print("\(self.ball!.position.x) +++ \(self.ball!.position.y)")
        print("\(self.ball!.size.width) +++ \(self.ball!.size.height)")
        for touch in touches {
            let touchA:UITouch = touch
            let touchPoint = touchA.location(in: self)
            print("点击位置是 x = \(touchPoint.x), y = \(touchPoint.y)")
            self.ball?.physicsBody?.applyImpulse(CGVector(dx: (self.ball!.position.x - touchPoint.x) / self.view!.frame.size.width * 414 , dy: (self.ball!.position.y - touchPoint.y) / self.view!.frame.size.width * 414))
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
        ball1.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: textureName), size: ball1.size)
        ball1.physicsBody?.isDynamic = true
        ball1.physicsBody?.restitution = 0.85
        ball1.physicsBody?.linearDamping = 0.28
        ball1.physicsBody?.friction = 0.45
        ball1.physicsBody?.angularDamping = 0.12
        ball1.physicsBody?.mass = 0.4
        ball1.physicsBody?.collisionBitMask = 3
        if textureName == "球球 (0).png" {
            self.ball = ball1  //白球
        }
        addChild(ball1)
    }
    
    
    func buildPocket(){
//        let pocket1 = SKSpriteNode(
        
        
        
    }
    
    
}
