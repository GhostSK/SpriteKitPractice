//
//  GameScene.swift
//  MoveController
//
//  Created by 胡杨林 on 17/2/23.
//  Copyright © 2017年 胡杨林. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var movePoint :SKShapeNode? = nil
    private var Player: SKSpriteNode? = nil
    private var ismoveTouch:Bool = true
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor.blue
        let moveController = SKShapeNode.init(rectOf: CGSize.init(width: 106, height: 106), cornerRadius: 53)
        moveController.position = CGPoint(x: 70, y: 70)
        moveController.lineWidth = 2
        moveController.name = "moveController"
        addChild(moveController)
        let movePoint = SKShapeNode.init(circleOfRadius: 6)
        movePoint.fillColor = SKColor.white
        movePoint.position = CGPoint(x: 70, y: 70)
        self.movePoint = movePoint
        addChild(movePoint)
        let player = SKSpriteNode(color: SKColor.red , size: CGSize.init(width: 10, height: 10))
        player.position = CGPoint(x: 368, y: 207)
        self.Player = player
        addChild(player)
        let btn = UIButton.init(type: UIButtonType.custom)
        btn.frame = CGRect(x: (self.view?.frame.size.width)! - 130, y: 70, width: 80, height: 30)
        btn.setTitle("复位", for: UIControlState.normal)
        btn.backgroundColor = SKColor.white
        btn.setTitleColor(SKColor.black, for: UIControlState.normal)
        btn.addTarget(self, action: #selector(resetPosition), for: UIControlEvents.touchUpInside)
        self.view?.addSubview(btn)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.ismoveTouch = true
            let position = t.location(in: self)
            let xl = position.x - 70
            let yl = position.y - 70
            if abs(xl) <= 15 && abs(yl) <= 15 {
                return
            }
            if abs(xl) >= 35 && abs(yl) >= 35 {
                self.ismoveTouch = false
                return
            }
            let z = xl / yl
            let temp =  2500 / (1 + z * z)
            var ys = sqrt(temp)
            if yl < 0 {
                ys = ys * -1
            }
            var xs = abs(ys * z)
            if xl < 0 {
                xs = -xs
            }
            let newPoi = CGPoint(x: 70 + xs , y: 70 + ys)
            self.movePoint?.position = newPoi
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.movePoint?.position = CGPoint(x: 70, y: 70)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.ismoveTouch {
            for t in touches {
                let position = t.location(in: self)
                let xl = position.x - 70
                let yl = position.y - 70
                if abs(xl) <= 15 && abs(yl) <= 15 {
                    return
                }
                let z = xl / yl
                let temp =  2500 / (1 + z * z)
                var ys = sqrt(temp)
                if yl < 0 {
                    ys = ys * -1
                }
                var xs = abs(ys * z)
                if xl < 0 {
                    xs = -xs
                }
                let newPoi = CGPoint(x: 70 + xs , y: 70 + ys)
                self.movePoint?.position = newPoi
            }

        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        let poi = CGPoint(x: (self.movePoint?.position.x)! - 70, y: (self.movePoint?.position.y)! - 70)
        let moveAction = SKAction.move(to: CGPoint(x: (self.Player?.position.x)! + poi.x, y: (self.Player?.position.y)! + poi.y) , duration: 0.1)
        self.Player?.run(moveAction)
    }
    func resetPosition() {
        self.Player?.removeFromParent()
        self.Player = nil
        let player = SKSpriteNode(color: SKColor.red , size: CGSize.init(width: 10, height: 10))
        player.position = CGPoint(x: 368, y: 207)
        self.Player = player
        addChild(player)
    }
}
