//
//  GameScene.swift
//  MusicAndMovieDemo
//
//  Created by 胡杨林 on 17/3/9.
//  Copyright © 2017年 胡杨林. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation

class GameScene: SKScene {
    var audioEffect:AVAudioPlayer? = nil
    
    
    override func didMove(to view: SKView) {
        let labelNode = SKLabelNode(text: "欢迎来到艾兴瓦尔德")
        labelNode.fontSize = 44
        labelNode.position = CGPoint(x: 100, y: 100)
        addChild(labelNode)
        let path = Bundle.main.path(forResource: "03", ofType:"mp3")
        let pathURL = NSURL.fileURL(withPath: path!)
        do {
            audioEffect = try AVAudioPlayer(contentsOf: pathURL)
        } catch { }
        audioEffect?.play()
        
        
        
    }
}
