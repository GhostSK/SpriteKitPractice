//
//  EventAndMonster.swift
//  MagicTower
//
//  Created by 胡杨林 on 2017/5/17.
//  Copyright © 2017年 胡杨林. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class GameItem: SKSpriteNode {
    //道具类 包括但不限于 宝石 钥匙 血瓶 剑盾 金币等
    //static let texture不能用于赋值，因此如果这样写每次生成一个实例都会生成这么多纹理，作废
    /*
     let smallHealth:SKTexture = SKTexture(imageNamed: "f-670.jpg")  //+200HP
     let mediumHealth:SKTexture = SKTexture(imageNamed: "f-671.jpg") // +500HP
     let blueKey:SKTexture = SKTexture(imageNamed: "f-606.jpg")  //蓝钥匙
     let redKey:SKTexture = SKTexture(imageNamed: "f-605.jpg")  //红钥匙
     let yellowKey:SKTexture = SKTexture(imageNamed: "f-607.jpg") //黄钥匙
     let AttackDiamond:SKTexture = SKTexture(imageNamed: "f-675.jpg")  //攻击宝石
     let defenceDiamond:SKTexture = SKTexture(imageNamed: "f-676.jpg") //防御宝石
     */
    
    var ItemName:String = ""
    
    //MARK: 建立节点
    //已经有 小血瓶+200 中血瓶+500 红蓝黄钥匙 攻击防御宝石
    class func buildsmallHealth()->GameItem{
        let smallHealth:SKTexture = SKTexture(imageNamed: "f-670.jpg")  //+200HP
        let node = GameItem.init(texture: smallHealth, color: SKColor.clear, size: CGSize(width: 32, height: 32))
        node.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        node.zPosition = 1.0
        node.ItemName = "smallHealth"
        return node
    }
    class func buildmediumHealth() ->GameItem{
        let mediumHealth:SKTexture = SKTexture(imageNamed: "f-671.jpg") // +500HP
        let node = GameItem.init(texture: mediumHealth, color: SKColor.clear, size: CGSize(width: 32, height: 32))
        node.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        node.zPosition = 1.0
        node.ItemName = "mediumHealth"
        return node
    }
    class func buildblueKey() ->GameItem{
        let blueKey:SKTexture = SKTexture(imageNamed: "f-606.jpg")  //蓝钥匙
        let node = GameItem.init(texture: blueKey, color: SKColor.clear, size: CGSize(width: 32, height: 32))
        node.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        node.zPosition = 1.0
        node.ItemName = "blueKey"
        return node
    }
    class func buildyellowKey() ->GameItem{
        let yellowKey:SKTexture = SKTexture(imageNamed: "f-607.jpg") //黄钥匙
        let node = GameItem.init(texture: yellowKey, color: SKColor.clear, size: CGSize(width: 32, height: 32))
        node.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        node.zPosition = 1.0
        node.ItemName = "yellowKey"
        return node
    }
    class func buildredKey() ->GameItem{
        let redKey:SKTexture = SKTexture(imageNamed: "f-605.jpg")  //红钥匙
        let node = GameItem.init(texture: redKey, color: SKColor.clear, size: CGSize(width: 32, height: 32))
        node.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        node.zPosition = 1.0
        node.ItemName = "redKey"
        return node
    }
    class func buildattackDiamond()->GameItem{
        let AttackDiamond:SKTexture = SKTexture(imageNamed: "f-675.jpg")  //攻击宝石
        let node = GameItem.init(texture: AttackDiamond, color: SKColor.clear, size: CGSize(width: 32, height: 32))
        node.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        node.zPosition = 1.0
        node.ItemName = "AttackDiamond"
        return node
    }
    class func buildDefenceDiamond()->GameItem{
        let defenceDiamond:SKTexture = SKTexture(imageNamed: "f-676.jpg") //防御宝石
        let node = GameItem.init(texture: defenceDiamond, color: SKColor.clear, size: CGSize(width: 32, height: 32))
        node.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        node.zPosition = 1.0
        node.ItemName = "defenceDiamond"
        return node
    }
    class func buildbalanceDiamond()->GameItem{
        let texture = SKTexture(imageNamed: "f-678.jpg")
        let node = GameItem.init(texture: texture, color: SKColor.clear, size: CGSize(width: 32, height: 32))
        node.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        node.zPosition = 1.0
        node.ItemName = "balanceDiamond"
        return node
    }
    class func buildyellowDoor()->GameItem{
        let texture = SKTexture(imageNamed: "f-603.jpg")
        let node = GameItem.init(texture: texture, color: SKColor.clear, size: CGSize(width: 32, height: 32))
        node.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        node.zPosition = 1.0
        node.ItemName = "yellowDoor"
        return node
    }
    class func buildblueDoor()->GameItem{
        let texture = SKTexture(imageNamed: "f-602.jpg")
        let node = GameItem.init(texture: texture, color: SKColor.clear, size: CGSize(width: 32, height: 32))
        node.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        node.zPosition = 1.0
        node.ItemName = "blueDoor"
        return node
    }
    class func buildredDoor()->GameItem{
        let texture = SKTexture(imageNamed: "f-601.jpg")
        let node = GameItem.init(texture: texture, color: SKColor.clear, size: CGSize(width: 32, height: 32))
        node.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        node.zPosition = 1.0
        node.ItemName = "redDoor"
        return node
    }
    class func buildRailing()->GameItem{
        let texture = SKTexture(imageNamed: "f-600.jpg")
        let node = GameItem.init(texture: texture, color: SKColor.clear, size: CGSize(width: 32, height: 32))
        node.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        node.zPosition = 1.0
        node.ItemName = "railing"
        return node
    }
    class func SbuildFloor2Hinder()->GameItem{
        //本节点不能交互，在触发对应剧情后消失，消失方法可以考虑遍历二层所有子节点抓ItemName对应节点然后设置hidden
        let texture = SKTexture(imageNamed: "f-604.jpg")
        let node = GameItem.init(texture: texture, color: SKColor.clear, size: CGSize(width: 32, height: 32))
        node.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        node.zPosition = 1.0
        node.ItemName = "Floor2Hinder"
        return node
    }
    
    class func SbuildFloor2Person1()->GameItem{
        let texture = SKTexture(imageNamed: "f-680.jpg")
        let node = GameItem.init(texture: texture, color: SKColor.clear, size: CGSize(width: 32, height: 32))
        node.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        node.zPosition = 1.0
        node.ItemName = "Floor2Person1"
        return node
    }
    class func SbuildFloor2Person2()->GameItem{
        let texture = SKTexture(imageNamed: "f-681.jpg")
        let node = GameItem.init(texture: texture, color: SKColor.clear, size: CGSize(width: 32, height: 32))
        node.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        node.zPosition = 1.0
        node.ItemName = "Floor2Person2"
        return node
    }
    
    func setPosition(hang:Int, lie:Int) {
        let a = (lie - 1) * 32 + 16
        let b = (hang - 1) * 32 + 16
        let p = CGPoint(x: a, y: b)
        self.position = p
    }
    
    func ItemEvent(){
        //根据道具名称来执行对应功能
        let player = Player.shareInstance()
        
        switch self.ItemName {
        case "smallHealth":
            player.health += 250
            print("血量+200")
            self.isHidden = true
            break
        case "mediumHealth":
            player.health += 500
            self.isHidden = true
            break
        case "blueKey":
            player.blueKey += 1
            self.isHidden = true
            break
        case "redKey":
            player.redKey += 1
            self.isHidden = true
            break
        case "yellowKey":
            player.yellowKey += 1
            self.isHidden = true
            break
        case "AttackDiamond":
            player.attack += 3
            self.isHidden = true
            break
        case "defenceDiamond":
            player.defence += 3
            self.isHidden = true
            break
        case "balanceDiamond":
            player.defence += 3
            player.attack += 3
            self.isHidden = true
            break
        case "yellowDoor":
            if player.yellowKey >= 1 {
                player.yellowKey -= 1
                self.isHidden = true
            }else{
                let view = refuseView.init(text: "缺少黄钥匙")
                let vc = UIApplication.shared.keyWindow?.rootViewController
                let view2 = vc?.view as! SKView
                let scene = view2.scene as! testScene
                scene.isShowingAlertView = true
                vc?.view.addSubview(view)
            }
            break
        case "blueDoor":
            if player.blueKey >= 1 {
                player.blueKey -= 1
                self.isHidden = true
            }else{
                let view = refuseView.init(text: "缺少蓝钥匙")
                let vc = UIApplication.shared.keyWindow?.rootViewController
                let view2 = vc?.view as! SKView
                let scene = view2.scene as! testScene
                scene.isShowingAlertView = true
                vc?.view.addSubview(view)
            }
            break
        case "redDoor":
            if player.redKey >= 1 {
                player.redKey -= 1
                self.isHidden = true
            }else{
                let view = refuseView.init(text: "缺少红钥匙")
                let vc = UIApplication.shared.keyWindow?.rootViewController
                let view2 = vc?.view as! SKView
                let scene = view2.scene as! testScene
                scene.isShowingAlertView = true
                vc?.view.addSubview(view)
            }
            break
        case "railing":
            self.isHidden = true
            break
        default:
            print("未命中任意一条")
            break
        }
        
    }
    
}

class MonsterNode: SKSpriteNode {
    var monsterHealth:Int = 0
    var monsterAttack:Int = 0
    var monsterDefence:Int = 0
    var monsterMoney:Int = 0
    var monsterExperience:Int = 0
    var monsterName:String = ""
    var monsterAnimation:SKAction? = nil
    var monsterPicture:UIImage? = nil
    
    func setPosition(hang:Int, lie:Int) {
        let a = (lie - 1) * 32 + 16
        let b = (hang - 1) * 32 + 16
        let p = CGPoint(x: a, y: b)
        self.position = p
    }
    
    class func buildMonster(Name:String, Texture1Name:String, Texture2Name:String, Health:Int, Attack:Int, Defence:Int, Money:Int, Exper:Int) -> MonsterNode{
        let texture1 = SKTexture(imageNamed: Texture1Name)
        let texture2 = SKTexture(imageNamed: Texture2Name)
        
        let a = MonsterNode(texture: texture1, color: SKColor.clear, size: CGSize(width: 32, height: 32))
        a.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        a.zPosition = 1.0
        //制作怪物纹理替换
        let act1 = SKAction.wait(forDuration: 0.5)
        let act2 = SKAction.setTexture(texture2)
        let act3 = SKAction.setTexture(texture1)
        let Actionsequence = SKAction.sequence([act1, act2, act1, act3])
        let loop = SKAction.repeatForever(Actionsequence)
        a.monsterAnimation = loop
        a.run(loop)
        //设定A的数值
        a.monsterName = Name
        a.monsterHealth = Health
        a.monsterAttack = Attack
        a.monsterDefence = Defence
        a.monsterMoney = Money
        a.monsterExperience = Exper
        a.monsterPicture = UIImage.init(named: Texture1Name)
        return a
    }
    
    
}

class staircaseNode :SKSpriteNode {
    var presentFloor:Int = 0
    var isupstairs:Bool = true
    
    init(presentFloor:Int, position:CGPoint, isUp:Bool) {
        if isUp {
            super.init(texture: SKTexture(imageNamed: "f-618.jpg"), color: SKColor.clear, size: CGSize(width: 32, height: 32))
        }else{
            super.init(texture: SKTexture(imageNamed: "f-588.jpg"), color: SKColor.clear, size: CGSize(width: 32, height: 32))
        }
        self.zPosition = 1.0
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.position = position
        self.presentFloor = presentFloor
        self.isupstairs = isUp
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


class ShopNode: SKSpriteNode {
    var isMoneyShop:Bool = true  //true 金钱商店 false 经验值商店
    var NodeName:String = ""
    class func buildShopNode(isMoneyShop:Bool,Name:String) -> ShopNode {
        let node = ShopNode.init(texture: nil, color: SKColor.clear, size: CGSize(width: 32, height: 32))
        node.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        //该节点应该用于触发事件 调出tableview窗口
        //节点本身不能进行添加tableview因为格式不兼容
        node.NodeName = Name
        
        return node
    }
   

    func setPosition(hang:Int, lie:Int) {
        let a = (lie - 1) * 32 + 16
        let b = (hang - 1) * 32 + 16
        let p = CGPoint(x: a, y: b)
        self.position = p
    }
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}





class refuseView: UIView {
    init(text:String) {
        super.init(frame: CGRect(x: (414 - 352) / 2, y: 20, width: 352, height: 352))
        self.backgroundColor = SKColor.clear
        let label = UILabel.init(frame: CGRect(x: 30, y: 202, width: 260, height: 26))
        label.text = text
        label.backgroundColor = SKColor.white
        label.textAlignment = .center
        self.addSubview(label)
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(disappear))
        self.addGestureRecognizer(tap)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func disappear(){
        self.removeFromSuperview()
        let vc = UIApplication.shared.keyWindow?.rootViewController
        let view2 = vc?.view as! SKView
        let scene = view2.scene as! testScene
        scene.isShowingAlertView = false
    }
    
}



