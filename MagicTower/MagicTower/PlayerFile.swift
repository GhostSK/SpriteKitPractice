//
//  PlayerFile.swift
//  MagicTower
//
//  Created by 胡杨林 on 2017/5/5.
//  Copyright © 2017年 胡杨林. All rights reserved.
//

import Foundation
import UIKit

class PlayerData: NSObject {
    static let instance:PlayerData = PlayerData.init()
    var health:Int = 1000
    var attack:Int = 10
    var defence:Int = 10
    var level:Int = 1
    var experience:Int = 0
    var money:Int = 0
    
    var yellowKey:Int = 0
    var blueKey:Int = 0
    var redKey:Int = 0
    
    private override init() {
       super.init()
    }
    
    class func shareInstance()->PlayerData{
        return self.instance
    }
    
    func changeHealth(Change:Int){  //如果是加血，传入负数
        self.health += Change
    }
    
}
