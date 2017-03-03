//
//  UnitNode.swift
//  FightSceneDemo
//
//  Created by 胡杨林 on 17/2/27.
//  Copyright © 2017年 胡杨林. All rights reserved.
//

import Foundation
import SpriteKit

class UnitNode: SKSpriteNode {
    public var MaxHealth: CGFloat = 100.0
    public var Health: CGFloat = 100.0
    public var physicsAttack:CGFloat = 30.0   //物理攻击 用于结算物理伤害
    public var physicsDefences:CGFloat = 20.0   //物理防御  用于结算物理伤害
    public var MagicAttack: CGFloat = 0.0   //魔法攻击力，用于结算法术伤害和治疗量
    public var MagicDefences_light:CGFloat = 0.0  //光属性魔防，用于结算光系法术伤害
    public var MagicDefences_dark:CGFloat = 0.0  //暗系魔法防御，用于结算暗属性法术伤害
    public var MagicDefences_water:CGFloat = 20.0   //水属性魔法防御，用于结算水系法术伤害，自然属性，自带20%抗性
    public var MagicDefences_fire:CGFloat = 15.0   //火属性魔法防御，用于结算火属性法术伤害，自然属性，自带15%抗性
    
     // 另外，治疗魔法不结算抗性，直接满量加 你家魔防抗辅助治疗？
    
    
    private var healthBarnode: SKSpriteNode? = nil
    override var anchorPoint: CGPoint {  //重写父类anchorPoint读写方法
        set {
            super.anchorPoint = newValue
            self.HealthBar(HealthChanged: 0)  //这里用于把血条添加上，因此变动量为0
        }
        get {
            return super.anchorPoint
        }
    }
    
    init(_ size: CGSize, MaxHealth:CGFloat) {
        
        super.init(texture: nil, color: SKColor.clear, size: size)
        self.MaxHealth = MaxHealth
        self.size = size
        self.Health = MaxHealth
        self.isUserInteractionEnabled = false
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func HealthBar(HealthChanged: CGFloat) {  //该方法用于更新血条
        if (self.healthBarnode == nil) {
            self.healthBarnode = SKSpriteNode(color: SKColor.clear, size: CGSize(width: size.width, height: 5))
            self.healthBarnode?.anchorPoint = CGPoint(x: 0.0, y: 0.0)
            self.healthBarnode?.position = CGPoint(x: super.anchorPoint.x * size.width * -1, y: size.height * (1 - super.anchorPoint.y))
            self.addChild(self.healthBarnode!)
        }
        
        
        let node = SKSpriteNode(color: SKColor.clear, size:(self.healthBarnode?.size)!)
        node.anchorPoint = CGPoint.zero
        node.position = CGPoint.zero
        self.Health = self.Health - HealthChanged
        let a = self.Health / self.MaxHealth
        if a > 0.5 {  //绿血
            node.color = SKColor.green
        }else if a > 0.25{
            node.color = SKColor.yellow
        }else{
            node.color = SKColor.red
        }
        node.size = CGSize(width: (self.healthBarnode?.size.width)! * a, height: 5)
        self.healthBarnode?.removeAllChildren()
        self.healthBarnode?.addChild(node)
    }
    
    
}
