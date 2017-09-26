//
//  EmployeeModel.swift
//  RestaurantManager
//
//  Created by 胡杨林 on 2017/9/25.
//  Copyright © 2017年 胡杨林. All rights reserved.
//

import Foundation
import UIKit

class EmployeeModel:NSObject {
    //职位： 厨师 跑堂 掌柜 保安 迎宾
    //属性： 手艺 敏捷 计算 武力 魅力  运气
    ///名字
    var Name:String = "二狗子"
    var Payment:NSInteger = 200  //薪酬
    var CookAbility:NSInteger = 30  //厨艺
    var agility:NSInteger = 30  //敏捷
    var calculateAbility:NSInteger = 30  //计算
    var military: NSInteger = 30  //武力
    var charmAbility: NSInteger = 30  //魅力
    var Lucky: NSInteger = 30 //运气
    var Picture:UIImage? = nil  //照片
}
