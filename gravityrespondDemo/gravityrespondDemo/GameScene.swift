//
//  GameScene.swift
//  gravityrespondDemo
//
//  Created by 胡杨林 on 17/3/9.
//  Copyright © 2017年 胡杨林. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion

class GameScene: SKScene {
    public var vc:UIViewController?
    var playerShip: SKSpriteNode = SKSpriteNode(imageNamed: "Spaceship")
    var mManager:CMMotionManager? = CMMotionManager()
    override func didMove(to view: SKView) {
        //创建并设置作为背景的node
        let background:SKSpriteNode = SKSpriteNode(imageNamed: "1455")
        background.position = CGPoint(x: (self.view?.frame.midX)!, y: (self.view?.frame.midY)!)
        background.size = (self.view?.frame.size)!
        self.addChild(background)
        self.playerShip.setScale(0.3)
        self.playerShip.position = CGPoint(x: (self.view?.frame.midX)!, y: (self.view?.frame.minY)! + self.playerShip.frame.size.height)
        addChild(self.playerShip)
        /*
         解决alertController不能正常弹出的问题
         实质上，在didMoveToView方法中，是由目前唯一的ViewController：GameViewController正在执行present GameScene的过程，在本方法中ViewController忙碌，因此需要错开这段present GameScene的时间，使用GCD或者将代码执行移动到update方法中均可正常弹出
         */
        DispatchQueue.main.async {
            if self.mManager?.isAccelerometerAvailable == true {
                self.showAlert(title: "恭喜", message: "重力感应可用")
                self.mManager?.startAccelerometerUpdates()
            }else{
                self.showAlert(title: "抱歉", message: "重力感应不可用")
            }
        }
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.playerShip.physicsBody = SKPhysicsBody(rectangleOf: self.playerShip.frame.size)
        self.playerShip.physicsBody?.isDynamic = true  //能够承受碰撞和其他外力作用（非静态物理体）
        self.playerShip.physicsBody?.mass = 0.2
        self.physicsWorld.gravity = CGVector(dx: 0.0, dy: 0.0)
    }
    func shipUpdate() {
        let data:CMAccelerometerData? = self.mManager?.accelerometerData
        //获取accelerometer数据
        var value = data?.acceleration.x
        if value == nil {
            value = 0
        }
        if fabs(value!) > 0.2  {
            let fvector = CGVector(dx: 400.0*(value!), dy: 0)
            self.playerShip.physicsBody?.applyForce(fvector)
        }
        var value2 = data?.acceleration.y
        if value2 == nil {
            value2 = 0
        }
        if fabs(value2!) > 0.2  {
            let fvector = CGVector(dx: 0, dy: 400.0*(value2!))
            self.playerShip.physicsBody?.applyForce(fvector)
        }
        
    }
    override func update(_ currentTime: TimeInterval) {
        self.shipUpdate()
    }
    
    func showAlert(title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .cancel) { _ in }
        alertController.addAction(okAction)
        self.vc?.present(alertController, animated: true, completion: nil)

    }

}
