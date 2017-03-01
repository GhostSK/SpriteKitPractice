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
    
    private var coverView:UIView? = nil
    
    
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
        if self.FightState == "攻击响应" {
            print("攻击响应成功")
            
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
        
    }
    func MainmenuMagic() {
        print("法术菜单响应")
        self.Mainmenu?.isHidden = true
        self.MagicMenu?.isHidden = false
        //制造遮罩层，使得点击法术选择区外的触摸可以取消法术面板退回上一步
        let coverView = UIView(frame: (self.view?.frame)!)
        coverView.backgroundColor = SKColor.clear
        let cancelGesture = UITapGestureRecognizer(target: self, action: #selector(cancelMagic))
        coverView.addGestureRecognizer(cancelGesture)
        self.coverView = coverView
        self.view?.addSubview(coverView)
        
    }
    func MainmenuMagicChange(btn:UIButton) {
                print("法术响应——第一个技能")
        
    }
    func MainmenuItem() {
                print("道具响应")
    }
    func MainmenuEscape() {
                print("跑路响应")
    }
    func cancelMagic() {
        self.MagicMenu?.isHidden = true
        self.Mainmenu?.isHidden = false
        self.coverView?.removeFromSuperview()
    }
    
    
}
