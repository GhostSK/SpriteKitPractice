//
//  SecondScene.swift
//  MusicAndMovieDemo
//
//  Created by 胡杨林 on 17/3/12.
//  Copyright © 2017年 胡杨林. All rights reserved.
//

import Foundation
import AVFoundation
import SpriteKit

class SecondScene: SKScene {
    var playerShip:SKSpriteNode = SKSpriteNode(imageNamed: "ship.png")
    var playerBullets:NSMutableArray = NSMutableArray(capacity: 5)
    var currentBullet:Int = 0
    var music:AVAudioPlayer? = nil
    var sound:AVAudioPlayer? = nil
    override func didMove(to view: SKView) {
        let background:SKSpriteNode = SKSpriteNode(imageNamed: "background.jpg")
        background.position = CGPoint(x: (self.view?.frame.midX)!, y: (self.view?.frame.midY)!)
        addChild(background)
        background.setScale(3.5)
        //设置精灵对象
        self.playerShip.position = CGPoint(x: (self.view?.frame.midX)!, y: (self.view?.frame.minY)!)
        self.playerShip.setScale(1.3)
        addChild(self.playerShip)
        
        for _ in 0...4 {
            let bullet = SKSpriteNode(imageNamed: "bullet.png")
            bullet.position = self.playerShip.position
            bullet.isHidden = true
            self.playerBullets.add(bullet)
            self.addChild(bullet)
        }
        //添加背景音乐
        let path = Bundle.main.path(forResource: "03", ofType: "mp3")
        let pathURL:URL = URL.init(fileURLWithPath: path!)
        music = try? AVAudioPlayer(contentsOf: pathURL)
        music?.play()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for _ in touches {
            let playerbullet:SKSpriteNode = self.playerBullets.object(at: currentBullet) as! SKSpriteNode
            currentBullet += currentBullet
            if currentBullet == 5 {
                currentBullet = 0
            }
            playerbullet.position = self.playerShip.position
            playerbullet.isHidden = false
            let firebulletAction:SKAction = SKAction.move(to: CGPoint(x:self.playerShip.position.x, y:(self.view?.frame.maxY)!), duration: 1.0)
            let endBulletAction:SKAction = SKAction.run {
                playerbullet.removeAllActions()
                playerbullet.isHidden = true
            }
            let firebulletAndDestroy:SKAction = SKAction.sequence([firebulletAction,endBulletAction])
            playerbullet.run(firebulletAndDestroy)
            
            let path = Bundle.main.path(forResource: "sound", ofType: "caf")
            let pathURL:URL = URL.init(fileURLWithPath: path!)
            sound = try? AVAudioPlayer(contentsOf: pathURL)
            sound?.play()
            
        }
    }
    
}
