//
//  customerInfo.swift
//  RestaurantManager
//
//  Created by 胡杨林 on 2017/10/11.
//  Copyright © 2017年 胡杨林. All rights reserved.
//

import Foundation

///本类用于存放顾客的基本数据模型
class CustomerModel: NSObject {
    var Name = "上班族"
    var TotalMoney = 150  //携带的金钱总额，决定了顾客能接受的最高价格
    var perferType:MenuType = .Home  //偏好的菜系 可能会多给钱
    var perferFood:NSMutableArray = NSMutableArray.init(object: "披萨")  //用队列存放喜爱的菜式，可以有多个
    var TipWish = 0.25  //0-1之间，决定了给出小费的可能性
    var MaxTip = 20  //最大小费数，确定会给出小费之后随机或者根据满意度决定
    var patience = 30  //无辅助（饮料）手段时可以等待的最大时间，单位为秒
    var describe = "只是一个普普通通的上班族，工作之余会到这里节约煮饭的时间"
    
    override init() {
        super.init()
    }
//    func buildCustomer(Name:String, TotalMoney:NSInteger, perferType:MenuType, Perf™)
    
    
}
