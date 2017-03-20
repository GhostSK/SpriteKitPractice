//
//  GameScene.swift
//  OtherNodes
//
//  Created by 胡杨林 on 17/3/20.
//  Copyright © 2017年 胡杨林. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var effectNode = SKEffectNode()
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
        //创建精灵对象pictureNode,作为相片
        let pictureNode = SKSpriteNode(imageNamed: "1.jpg")
        pictureNode.position = CGPoint(x: 0, y: 0)
        pictureNode.setScale(0.9)
//        addChild(pictureNode)
        let photoFrame = SKSpriteNode(imageNamed: "2.png")  //相框
        photoFrame.position = CGPoint(x: 200, y: 150)
        addChild(photoFrame)
        let maskNode = SKSpriteNode(imageNamed: "3.png") //裁剪
        let cropNode = SKCropNode()
        cropNode.position = CGPoint(x: 0, y: 0)  //要注意遮罩层位置，还有修改后的被遮罩的图片的坐标是以遮罩层为基准的
        cropNode.addChild(pictureNode)
        cropNode.maskNode = maskNode
        photoFrame.addChild(cropNode)
        //以上为裁减节点
        //使用代码添加形状节点
        let rect = SKShapeNode(rect: CGRect(x: 100, y: 400, width: 120, height: 80), cornerRadius: 20)
        rect.lineWidth = 10
        rect.strokeColor = SKColor.red
        rect.fillColor = SKColor.green
        addChild(rect)
        let circular = SKShapeNode(circleOfRadius: 100)
        circular.position = CGPoint(x: 100, y: 550)
        addChild(circular)
        let ellipse = SKShapeNode(ellipseIn: CGRect(x: 200, y: 550, width: 300, height: 150))
        ellipse.strokeColor = SKColor.blue
        ellipse.glowWidth = 30  //光晕效果
        addChild(ellipse)
        //线段
        let line = SKShapeNode()
        line.lineWidth = 10
        line.position = CGPoint(x: 100, y: 100)
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 0.0, y: 0.0))
        path.addLine(to: CGPoint(x: 600, y: 600))
        line.strokeColor = SKColor.orange
        line.path = path
        addChild(line)
        
        
        //效果节点
        effectNode.position = CGPoint(x: 100, y: 550)
        addChild(effectNode)
        let spriteNode = SKSpriteNode(imageNamed: "1.jpg")
        effectNode.addChild(spriteNode)
        //模糊滤镜在touchesBegan
        
        
        
    }
    func blurFilrer() ->CIFilter {
        let filter = CIFilter(name: "CIGaussianBlur")
        filter?.setDefaults()
        let value = NSNumber(value: 10.0)
        filter?.setValue(value, forKey: "inputRadius")
        return filter!
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        effectNode.filter = self.blurFilrer()
    }
    
    
}
