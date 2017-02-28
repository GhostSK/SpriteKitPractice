//
//  GameScene.swift
//  FightSceneDemo
//
//  Created by 胡杨林 on 17/2/27.
//  Copyright © 2017年 胡杨林. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var enemy1:UnitNode?
    private var enemy2:UnitNode?
    private var enemy3:UnitNode?
    
    private var friend1:UnitNode?
    private var friend2:UnitNode?
    private var friend3:UnitNode?
    
    
    private var a:CGFloat = 151
    private var Mainmenu:UIView? = nil
    private var FightState:String? = nil
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor.white
        let node = UnitNode(CGSize(width: 80, height: 150) , MaxHealth: 151)
        node.position = CGPoint(x: 500, y: 40)
        node.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        let texture = SKTexture(imageNamed: "41")
        node.texture = texture
        addChild(node)
        self.friend1 = node
        self.buildMenu()
        self.view?.addSubview(self.Mainmenu!)

        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       self.a -= 10
        if a <= 0 {
            a = 151
        }
         self.friend1?.HealthBar(NowHealth:self.a)
        for a in touches {
            let b = a.location(in: self)
            let c = nodes(at: b)
            print("点击点上有\(c.count)个node")
        }
        
    }
    
    func buildMenu() {
        self.Mainmenu = UIView(frame: CGRect(x: 600, y: 150, width: 90, height: 135))
        self.Mainmenu?.backgroundColor = SKColor.init(colorLiteralRed: 64.0/255, green: 64.0/255, blue: 64.0/255, alpha: 1.0)
        let btn1 = UIButton(type: UIButtonType.custom)
        btn1.frame = CGRect(x: 5, y: 3, width: 80, height: 30)
        btn1.setTitle("攻击", for: UIControlState.normal)
        btn1.backgroundColor = SKColor.black
        btn1.setTitleColor(SKColor.white, for: UIControlState.normal)
        btn1.addTarget(self, action: #selector(MainmenuAttack), for: UIControlEvents.touchUpInside)
        self.Mainmenu?.addSubview(btn1)
        let btn2 = UIButton(type: UIButtonType.custom)
        btn2.frame = CGRect(x: 5, y: 36, width: 80, height: 30)
        btn2.setTitle("法术", for: UIControlState.normal)
        btn2.backgroundColor = SKColor.black
        btn2.setTitleColor(SKColor.white, for: UIControlState.normal)
        btn2.addTarget(self, action: #selector(MainmenuMagic), for: UIControlEvents.touchUpInside)
        self.Mainmenu?.addSubview(btn2)
        let btn3 = UIButton(type: UIButtonType.custom)
        btn3.frame = CGRect(x: 5, y: 69, width: 80, height: 30)
        btn3.setTitle("道具", for: UIControlState.normal)
        btn3.backgroundColor = SKColor.black
        btn3.setTitleColor(SKColor.white, for: UIControlState.normal)
        btn3.addTarget(self, action: #selector(MainmenuItem), for: UIControlEvents.touchUpInside)
        self.Mainmenu?.addSubview(btn3)
        let btn4 = UIButton(type: UIButtonType.custom)
        btn4.frame = CGRect(x: 5, y: 102, width: 80, height: 30)
        btn4.setTitle("跑路", for: UIControlState.normal)
        btn4.backgroundColor = SKColor.black
        btn4.setTitleColor(SKColor.white, for: UIControlState.normal)
        btn4.addTarget(self, action: #selector(MainmenuEscape), for: UIControlEvents.touchUpInside)
        self.Mainmenu?.addSubview(btn4)
        //以上为主菜单构建
        
    }
    func MainmenuAttack() {
        self.FightState = "攻击响应"
        
    }
    func MainmenuMagic() {
                print("法术响应")
        
    }
    func MainmenuItem() {
                print("道具响应")
    }
    func MainmenuEscape() {
                print("跑路响应")
    }
    
}
