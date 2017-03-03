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
    
    
    private var Mainmenu:UIView? = nil
    private var MagicMenu:UIView? = nil
    
    
    
    private var FightState:String? = nil
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor.white
        self.buildPlayerAndMonsters()
        self.buildMenu()
        self.view?.addSubview(self.Mainmenu!)

        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.FightState == "攻击响应" {
            for i in touches {
                let loc = i.location(in: self)
                let node = nodes(at: loc).first
                if node == self.enemy1 || node == enemy2 || node == enemy3 {
                    print("你成功的选择到了敌人")
                    print("转入物理攻击命中计算及伤害计算")
                    self.attackcalculate(from: self.friend1!, to: node as! UnitNode)
                }else{
                    self.cancelAction()
                }
            }
            return
        }else if self.FightState == "法术选择响应" {
            for i in touches {
                let loc = i.location(in: self)
                let node = nodes(at: loc).first
                if node == self.enemy1 || node == enemy2 || node == enemy3 {
                    print("你成功的选择到了敌人")
                    print("转入物理攻击命中计算及伤害计算")
                    self.attackcalculate(from: self.friend1!, to: node as! UnitNode)
                }else{
                    self.cancelAction()
                }
            }
            return
        }
    }
    
    func buildPlayerAndMonsters() {
        let node = UnitNode(CGSize(width: 80, height: 150) , MaxHealth: 151)
        node.position = CGPoint(x: 500, y: 40)
        node.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        let texture = SKTexture(imageNamed: "41")
        node.texture = texture
        node.physicsAttack = 50
        node.physicsDefences = 30
        addChild(node)
        self.friend1 = node
        let texture_monster = SKTexture(imageNamed: "monster1")
        let mon1 = UnitNode.init(CGSize(width: 73, height: 93), MaxHealth: 200)
        mon1.texture = texture_monster
        mon1.anchorPoint = CGPoint.zero
        mon1.position = CGPoint(x: 100, y: 100)
        mon1.physicsAttack = 35
        mon1.physicsDefences = 25
        self.enemy1 = mon1
        addChild(mon1)
        let mon2 = UnitNode.init(CGSize(width: 73, height: 93), MaxHealth: 240)
        mon2.texture = texture_monster
        mon2.anchorPoint = CGPoint.zero
        mon2.position = CGPoint(x: 130, y: 200)
        mon2.physicsAttack = 40
        mon2.physicsDefences = 30
        self.enemy2 = mon2
        addChild(mon2)
        let mon3 = UnitNode.init(CGSize(width: 73, height: 93), MaxHealth: 200)
        mon3.texture = texture_monster
        mon3.anchorPoint = CGPoint.zero
        mon3.position = CGPoint(x: 160, y: 300)
        mon3.physicsAttack = 35
        mon3.physicsDefences = 25
        self.enemy3 = mon3
        addChild(mon3)
        

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
        
        self.MagicMenu = UIView(frame: CGRect(x: 220, y: 100, width: 175, height: 260))
        self.MagicMenu?.backgroundColor = SKColor.init(colorLiteralRed: 64.0/255, green: 64.0/255, blue: 64.0/255, alpha: 1.0)
        self.view?.addSubview(self.MagicMenu!)
        self.MagicMenu?.isHidden = true
        let Magic1 = UIButton(type: UIButtonType.custom)
        Magic1.frame = CGRect(x: 5, y: 5, width: 80, height: 80)
        Magic1.setImage(UIImage.init(named: "44-1"), for: UIControlState.normal)
        Magic1.addTarget(self, action: #selector(MainmenuMagicChange(btn:)), for: UIControlEvents.touchUpInside)
        Magic1.tag = 1008601
        self.MagicMenu?.addSubview(Magic1)
        let Magic2 = UIButton(type: UIButtonType.custom)
        Magic2.frame = CGRect(x: 90, y: 5, width: 80, height: 80)
        Magic2.setImage(UIImage.init(named: "44-2"), for: UIControlState.normal)
        Magic2.addTarget(self, action: #selector(MainmenuMagicChange(btn:)), for: UIControlEvents.touchUpInside)
        Magic2.tag = 1008602
        self.MagicMenu?.addSubview(Magic2)
        let Magic3 = UIButton(type: UIButtonType.custom)
        Magic3.frame = CGRect(x: 5, y: 90, width: 80, height: 80)
        Magic3.setImage(UIImage.init(named: "44-3"), for: UIControlState.normal)
        Magic3.addTarget(self, action: #selector(MainmenuMagicChange(btn:)), for: UIControlEvents.touchUpInside)
        Magic3.tag = 1008603
        self.MagicMenu?.addSubview(Magic3)
        let Magic4 = UIButton(type: UIButtonType.custom)
        Magic4.frame = CGRect(x: 90, y: 90, width: 80, height: 80)
        Magic4.setImage(UIImage.init(named: "44-4"), for: UIControlState.normal)
        Magic4.addTarget(self, action: #selector(MainmenuMagicChange(btn:)), for: UIControlEvents.touchUpInside)
        Magic4.tag = 1008604
        self.MagicMenu?.addSubview(Magic4)
        let Magic5 = UIButton(type: UIButtonType.custom)
        Magic5.frame = CGRect(x: 5, y: 175, width: 80, height: 80)
        Magic5.setImage(UIImage.init(named: "44-5"), for: UIControlState.normal)
        Magic5.addTarget(self, action: #selector(MainmenuMagicChange(btn:)), for: UIControlEvents.touchUpInside)
        Magic5.tag = 1008605
        self.MagicMenu?.addSubview(Magic5)
        let Magic6 = UIButton(type: UIButtonType.custom)
        Magic6.frame = CGRect(x: 90, y: 175, width: 80, height: 80)
        Magic6.setImage(UIImage.init(named: "44-6"), for: UIControlState.normal)
        Magic6.addTarget(self, action: #selector(MainmenuMagicChange(btn:)), for: UIControlEvents.touchUpInside)
        Magic6.tag = 1008606
        self.MagicMenu?.addSubview(Magic6)
        
        
        
    }
    func MainmenuAttack() {
        self.FightState = "攻击响应"
        self.Mainmenu?.isHidden = true   //进入攻击选择状态，隐藏主菜单
//        self.view?.addSubview(self.coverView!)
        
    }
    func MainmenuMagic() {
        print("法术菜单响应")
        self.FightState = "法术选择响应"
        self.Mainmenu?.isHidden = true
        self.MagicMenu?.isHidden = false
        
    }
    func MainmenuMagicChange(btn:UIButton) {
        let tag = btn.tag
        switch tag {
        case 1008601:
            print("法术响应——第一个法术")
            break
        case 1008602:
            print("法术响应——第二个法术")
            break
        case 1008603:
            print("法术响应——第三个法术")
            break
        case 1008604:
            print("法术响应——第四个法术")
        case 1008605:
            print("法术响应——第五个法术")
            break
        case 1008606:
            print("法术响应——第六个法术")
            break
        default:
            break
        }
        self.FightState = "法术目标选择响应"
        
    }
    func MainmenuItem() {
                print("道具响应")
    }
    func MainmenuEscape() {
                print("跑路响应")
        let a = "逃跑成功计算率公式"
        if  a != "逃跑" {  //根据敏捷等属性来计算逃跑成功率
            print("逃跑成功")
        }else{
            print("逃跑失败")
            print("转入下一个战斗环节")
        }
    }
    func cancelAction() {
        self.MagicMenu?.isHidden = true
        self.FightState = ""  //退出攻击状态
        //这里需要加入隐藏道具栏的语句
        self.Mainmenu?.isHidden = false
    }
    
    func attackcalculate(from:UnitNode, to:UnitNode) {
        let a = from.physicsAttack - to.physicsDefences
        to.HealthBar(HealthChanged: a)  //该方法的调用参数传入为变动值，正数为扣血，负数为加血
        print("剩余血量为\(to.Health)")
        let fadein = SKAction.fadeOut(withDuration: 0.05)
        let fadeout = SKAction.fadeIn(withDuration: 0.05)
        let fade = SKAction.sequence([fadein,fadeout])
        to.run(fade)  //被攻击时的闪烁特效
        if to.Health <= 0 {
            let disappear = SKAction.fadeOut(withDuration: 0.5)
            to.run(disappear)
        }
    }
    
    
}
