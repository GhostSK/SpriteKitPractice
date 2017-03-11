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
    var label: SKLabelNode? = nil
    
    override func didMove(to view: SKView) {
        let labelNode = SKLabelNode(text: "欢迎来到艾兴瓦尔德")
        labelNode.fontSize = 44
        labelNode.position = CGPoint(x: 300, y: 100)
        addChild(labelNode)
        let path = Bundle.main.path(forResource: "03", ofType:"mp3")
        let pathURL = NSURL.fileURL(withPath: path!)
        audioEffect = try? AVAudioPlayer(contentsOf: pathURL)
        audioEffect?.play()
        let label2 = SKLabelNode(text: "")
        label2.fontSize = 44
        label2.position = CGPoint(x: 300, y: 250)
        self.label = label2
        addChild(label2)
        audioEffect?.volume = 8  //设置音量  1-10
        audioEffect?.numberOfLoops = 1000  //循环次数
        let btn = UIButton.init(frame: CGRect(x: 550, y: 250, width: 80, height: 30))
        btn.setTitle("进入场景", for: .normal)
        btn.addTarget(self, action: #selector(nextScene), for: .touchUpInside)
        self.view?.addSubview(btn)
        
    }
    func nextScene() {
        let scene = SecondScene()
        self.view?.presentScene(scene)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //判断音乐是否播放
        if (audioEffect?.isPlaying)! {
            //如果音乐正在播放
            removeAllChildren()
            audioEffect?.stop()
            //创建并设置标签
            let Label = SKLabelNode(text: "背景音乐停止播放")
            Label.position = CGPoint(x: 300, y: 100)
            Label.fontSize = 44
            Label.fontColor = SKColor.red
            addChild(Label)
        }else{
            //音乐没有在播放
            removeAllChildren()
            addChild(self.label!)
            let label = SKLabelNode(text: "背景音乐正在播放")
            label.position = CGPoint(x: 300, y: 100)
            label.fontSize = 44
            label.fontColor = SKColor.blue
            addChild(label)
            self.audioEffect?.play()
        }
    }
    override func update(_ currentTime: TimeInterval) {
        self.label?.text = "当前播放了\(Int(audioEffect!.currentTime))秒"
    }
}
