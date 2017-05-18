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
        node.ItemName = "smallHealth"
        return node
    }
    class func buildmediumHealth() ->GameItem{
        let mediumHealth:SKTexture = SKTexture(imageNamed: "f-671.jpg") // +500HP
        let node = GameItem.init(texture: mediumHealth, color: SKColor.clear, size: CGSize(width: 32, height: 32))
        node.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        node.ItemName = "mediumHealth"
        return node
    }
    class func buildblueKey() ->GameItem{
        let blueKey:SKTexture = SKTexture(imageNamed: "f-606.jpg")  //蓝钥匙
        let node = GameItem.init(texture: blueKey, color: SKColor.clear, size: CGSize(width: 32, height: 32))
        node.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        node.ItemName = "blueKey"
        return node
    }
    class func buildyellowKey() ->GameItem{
        let yellowKey:SKTexture = SKTexture(imageNamed: "f-607.jpg") //黄钥匙
        let node = GameItem.init(texture: yellowKey, color: SKColor.clear, size: CGSize(width: 32, height: 32))
        node.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        node.ItemName = "yellowKey"
        return node
    }
    class func buildredKey() ->GameItem{
        let redKey:SKTexture = SKTexture(imageNamed: "f-605.jpg")  //红钥匙
        let node = GameItem.init(texture: redKey, color: SKColor.clear, size: CGSize(width: 32, height: 32))
        node.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        node.ItemName = "redKey"
        return node
    }
    class func buildattackDiamond()->GameItem{
        let AttackDiamond:SKTexture = SKTexture(imageNamed: "f-675.jpg")  //攻击宝石
        let node = GameItem.init(texture: AttackDiamond, color: SKColor.clear, size: CGSize(width: 32, height: 32))
        node.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        node.ItemName = "AttackDiamond"
        return node
    }
    class func buildDefenceDiamond()->GameItem{
        let defenceDiamond:SKTexture = SKTexture(imageNamed: "f-676.jpg") //防御宝石
        let node = GameItem.init(texture: defenceDiamond, color: SKColor.clear, size: CGSize(width: 32, height: 32))
        node.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        node.ItemName = "defenceDiamond"
        return node
    }
    class func buildUpstairs() ->GameItem{
        let upstairs = SKTexture(imageNamed: "f-618.jpg")
        let node = GameItem.init(texture: upstairs, color: SKColor.clear, size: CGSize(width: 32, height: 32))
        node.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        node.ItemName = "upstairsNode"
        return node
    }
    class func buildDownstairs() ->GameItem{
        let downstairs = SKTexture(imageNamed: "f-588.jpg")
        let node = GameItem.init(texture: downstairs, color: SKColor.clear, size: CGSize(width: 32, height: 32))
        node.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        node.ItemName = "downstairsNode"
        return node
    }
    
    func ItemEvent(){
        //根据道具名称来执行对应功能
        let player = Player.shareInstance()
        
        switch self.ItemName {
        case "smallHealth":
            player.health += 200
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
    
    class func buildMonster(Name:String, Texture1Name:String, Texture2Name:String, Health:Int, Attack:Int, Defence:Int, Money:Int, Exper:Int) -> MonsterNode{
        let texture1 = SKTexture(imageNamed: Texture1Name)
        let texture2 = SKTexture(imageNamed: Texture2Name)
        
        let a = MonsterNode(texture: texture1, color: SKColor.clear, size: CGSize(width: 32, height: 32))
        //制作怪物纹理替换
        let act1 = SKAction.wait(forDuration: 1)
        let act2 = SKAction.setTexture(texture2)
        let act3 = SKAction.setTexture(texture1)
        let Actionsequence = SKAction.sequence([act1, act2, act1, act3])
        let loop = SKAction.repeatForever(Actionsequence)
        a.run(loop)
        //设定A的数值
        a.monsterHealth = Health
        a.monsterAttack = Attack
        a.monsterDefence = Defence
        a.monsterMoney = Money
        a.monsterExperience = Exper
        return a
    }
    
}


