//
//  MonsterInfoModel.swift
//  Magictower
//
//  Created by 胡杨林 on 17/4/7.
//  Copyright © 2017年 胡杨林. All rights reserved.
//

import Foundation

class MonsterInfoModel: NSObject {
    var name:String? = nil  //怪物名字
    var health: Int = 0   //怪物血量
    var attack:Int = 0    //怪物攻击力
    var defences:Int = 0   //怪物防御力
    var experience: Int = 0   //怪物击杀后获得经验
    var money: Int = 0    //怪物击杀后获得金钱数
    
    init(Name:String, Health:Int, Attack:Int, Defences:Int, Exp:Int, Money:Int) {
        self.name = Name
        self.health = Health
        self.attack = Attack
        self.defences = Defences
        self.experience = Exp
        self.money = Money
    }
    
}
