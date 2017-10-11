//
//  Models.swift
//  RestaurantManager
//
//  Created by 胡杨林 on 2017/9/19.
//  Copyright © 2017年 胡杨林. All rights reserved.
//

import UIKit

enum MenuType: String {
    case Home = "家常菜"
    case ShanDong = "鲁菜"
    case huaiyang = "淮扬菜"
    case Stark = "粤菜"
    case Tully = "川菜"
    case Tyrell = "意大利菜"
    case French = "法国菜"
    case Japan = "日式料理"
    case America = "美国菜"
    case India = "印度菜"
    case Korea = "韩国菜"
}
enum FoodTaste {  //存在复合味道，思考是否引入，如酸甜，咸鲜
    case sweet  //甜
    case salt   //咸
    case pepper  //辣
    case sour   //酸
    case flesh  //鲜
    case bitter  //苦
}


class baseMenu: NSObject {
    
    var Name:String = "" //菜谱名
    var Price:NSInteger = 100 //基础售价 （精制后可以提升溢价率）
    var type:MenuType? = MenuType.Home  //菜系
    var Picture:UIImage? = nil  //图片
    var Techlevel:NSInteger = 0  //菜品科技等级，决定研发顺序
    var qualityLevel:NSInteger = 0  //质量等级，影响最终售价
    var TechNeeds:NSInteger = 100  //科技研发值，越高，需要的研发时间就越久
//    var taste:FoodTaste = .sweet  //客人口味
    var isLock:Bool = true    //菜品是否锁定
    var canBeunlock:Bool = false    //是否允许解除锁定
    
}
