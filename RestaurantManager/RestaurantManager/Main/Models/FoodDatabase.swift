//
//  FoodDatabase.swift
//  RestaurantManager
//
//  Created by 胡杨林 on 2017/10/10.
//  Copyright © 2017年 胡杨林. All rights reserved.
//

import Foundation
import UIKit
class FoodDatabase:NSObject  {
    
    static let dataBase = FoodDatabase.init()
    var DataDic:NSMutableDictionary = NSMutableDictionary.init()  //存放数据，使用menuType提取NSArray
    
    class func ShareInstance() -> FoodDatabase{
        return dataBase
    }
    
    override init() {
        super.init()
        let arr1 = NSMutableArray.init()
        let model01 = baseMenu.init()
        model01.canBeunlock = true
        model01.isLock = false
        model01.Name = "BBQ鸡翅"
        model01.Picture = UIImage.init(named: "美国菜-BBQ鸡翅_小")
        model01.Price = 50
        model01.Techlevel = 1
        model01.TechNeeds = 0
        model01.type = MenuType.America
        arr1.add(model01)
        let model02 = baseMenu.init()
        model02.canBeunlock = true
        model02.isLock = false
        model02.Name = "美国热狗"
        model02.Picture = UIImage.init(named: "美国菜-美国热狗_小")
        model02.Price = 55
        model02.Techlevel = 1
        model02.TechNeeds = 0
        model02.type = MenuType.America
        arr1.add(model02)
        let model03 = baseMenu.init()
        model03.canBeunlock = true
        model03.isLock = false
        model03.Name = "抹茶芝士蛋糕"
        model03.Picture = UIImage.init(named: "美国菜-抹茶芝士蛋糕_小")
        model03.Price = 60
        model03.Techlevel = 1
        model03.TechNeeds = 0
        model03.type = MenuType.America
        arr1.add(model03)
        let model04 = baseMenu.init()
        model04.canBeunlock = true
        model04.isLock = true
        model04.Name = "鸡柳汉堡"
        model04.Picture = UIImage.init(named: "美国菜-鸡柳汉堡_小")
        model04.Price = 120
        model04.Techlevel = 2
        model04.TechNeeds = 1200
        model04.type = MenuType.America
        arr1.add(model04)
        let model05 = baseMenu.init()
        model05.canBeunlock = true
        model05.isLock = true
        model05.Name = "香草美国牛排"
        model05.Picture = UIImage.init(named: "美国菜-香草美国牛排_小")
        model05.Price = 140
        model05.Techlevel = 2
        model05.TechNeeds = 1400
        model05.type = MenuType.America
        arr1.add(model05)
        let model06 = baseMenu.init()
        model06.canBeunlock = true
        model06.isLock = true
        model06.Name = "澳洲牛柳"
        model06.Picture = UIImage.init(named: "美国菜-澳洲牛柳_小")
        model06.Price = 200
        model06.Techlevel = 2
        model06.TechNeeds = 2500
        model06.type = MenuType.America
        arr1.add(model06)
        let model07 = baseMenu.init()
        model07.canBeunlock = false
        model07.isLock = true
        model07.Name = "香煎牛肉扒"
        model07.Picture = UIImage.init(named: "美国菜-香煎牛肉扒_小")
        model07.Price = 450
        model07.Techlevel = 3
        model07.TechNeeds = 8000
        model07.type = MenuType.America
        arr1.add(model07)
        let model08 = baseMenu.init()
        model08.canBeunlock = false
        model08.isLock = true
        model08.Name = "巧克力火锅"
        model08.Picture = UIImage.init(named: "美国菜-巧克力火锅_小")
        model08.Price = 400
        model08.Techlevel = 3
        model08.TechNeeds = 7000
        model08.type = MenuType.America
        arr1.add(model08)
        let model09 = baseMenu.init()
        model09.canBeunlock = false
        model09.isLock = true
        model09.Name = "椒盐牛仔骨"
        model09.Picture = UIImage.init(named: "美国菜-椒盐牛仔骨_小")
        model09.Price = 600
        model09.Techlevel = 4
        model09.TechNeeds = 10000
        model09.type = MenuType.America
        arr1.add(model09)
        let model00 = baseMenu.init()
        model00.canBeunlock = false
        model00.isLock = true
        model00.Name = "煎红酒丁骨牛排"
        model00.Picture = UIImage.init(named: "美国菜-煎红酒丁骨牛排_小")
        model00.Price = 1200
        model00.Techlevel = 5
        model00.TechNeeds = 15000
        model00.type = MenuType.America
        arr1.add(model00)
        
        self.DataDic.setValue(arr1, forKey: MenuType.America.rawValue)
    }
    
    func getData(type:MenuType) -> NSMutableArray {
        let Str = type.rawValue
        let arr = self.DataDic.value(forKey: Str) as! NSMutableArray
        return arr;
    }
    
}
