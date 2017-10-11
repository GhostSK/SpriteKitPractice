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
        // MARK:美国菜
        let arr1 = NSMutableArray.init()
        let model01 = baseMenu.init()
        model01.canBeunlock = true
        model01.isLock = false
        model01.Name = "烤鸡翅"
        model01.Picture = UIImage.init(named: "美国菜-BBQ鸡翅_小")
        model01.Price = 50
        model01.Techlevel = 1
        model01.TechNeeds = 0
        model01.type = MenuType.America
        arr1.add(model01)
        let model02 = baseMenu.init()
        model02.canBeunlock = true
        model02.isLock = false
        model02.Name = "热狗"
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
        model05.Name = "香草牛排"
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
        model00.Name = "红酒骨牛排"
        model00.Picture = UIImage.init(named: "美国菜-煎红酒丁骨牛排_小")
        model00.Price = 1200
        model00.Techlevel = 5
        model00.TechNeeds = 15000
        model00.type = MenuType.America
        arr1.add(model00)
        self.DataDic.setValue(arr1, forKey: MenuType.America.rawValue)
        
        // MARK:法国菜
        let arr2 = NSMutableArray.init()
        let model11 = baseMenu.init()
        model11.canBeunlock = true
        model11.isLock = false
        model11.Name = "洋葱汤"
        model11.Picture = UIImage.init(named: "法国菜-法式洋葱汤_小")
        model11.Price = 50
        model11.Techlevel = 1
        model11.TechNeeds = 0
        model11.type = MenuType.French
        arr2.add(model11)
        let model12 = baseMenu.init()
        model12.canBeunlock = true
        model12.isLock = false
        model12.Name = "烩土豆"
        model12.Picture = UIImage.init(named: "法国菜-法式烩土豆_小")
        model12.Price = 55
        model12.Techlevel = 1
        model12.TechNeeds = 0
        model12.type = MenuType.French
        arr2.add(model12)
        let model13 = baseMenu.init()
        model13.canBeunlock = true
        model13.isLock = false
        model13.Name = "奶油蘑菇汤"
        model13.Picture = UIImage.init(named: "法国菜-奶油蘑菇汤_小")
        model13.Price = 60
        model13.Techlevel = 1
        model13.TechNeeds = 0
        model13.type = MenuType.French
        arr2.add(model13)
        let model14 = baseMenu.init()
        model14.canBeunlock = true
        model14.isLock = true
        model14.Name = "马赛鱼羹"
        model14.Picture = UIImage.init(named: "法国菜-马赛鱼羹_小")
        model14.Price = 120
        model14.Techlevel = 2
        model14.TechNeeds = 1200
        model14.type = MenuType.French
        arr2.add(model14)
        let model15 = baseMenu.init()
        model15.canBeunlock = true
        model15.isLock = true
        model15.Name = "沙朗牛排"
        model15.Picture = UIImage.init(named: "法国菜-沙朗牛排_小")
        model15.Price = 140
        model15.Techlevel = 2
        model15.TechNeeds = 1400
        model15.type = MenuType.French
        arr2.add(model15)
        let model16 = baseMenu.init()
        model16.canBeunlock = true
        model16.isLock = true
        model16.Name = "煎龙利鱼"
        model16.Picture = UIImage.init(named: "法国菜-香煎龙利鱼佐牛油汁_小")
        model16.Price = 200
        model16.Techlevel = 2
        model16.TechNeeds = 2500
        model16.type = MenuType.French
        arr2.add(model16)
        let model17 = baseMenu.init()
        model17.canBeunlock = false
        model17.isLock = true
        model17.Name = "法式烤鸡"
        model17.Picture = UIImage.init(named: "法国菜-法式烤鸡_小")
        model17.Price = 450
        model17.Techlevel = 3
        model17.TechNeeds = 8000
        model17.type = MenuType.French
        arr2.add(model17)
        let model18 = baseMenu.init()
        model18.canBeunlock = false
        model18.isLock = true
        model18.Name = "牡蛎杯"
        model18.Picture = UIImage.init(named: "法国菜-牡蛎杯_小")
        model18.Price = 400
        model18.Techlevel = 3
        model18.TechNeeds = 7000
        model18.type = MenuType.French
        arr2.add(model18)
        let model19 = baseMenu.init()
        model19.canBeunlock = false
        model19.isLock = true
        model19.Name = "法国龙虾"
        model19.Picture = UIImage.init(named: "法国菜-法国龙虾_小")
        model19.Price = 600
        model19.Techlevel = 4
        model19.TechNeeds = 10000
        model19.type = MenuType.French
        arr2.add(model19)
        let model10 = baseMenu.init()
        model10.canBeunlock = false
        model10.isLock = true
        model10.Name = "鹅肝酱"
        model10.Picture = UIImage.init(named: "法国菜-鹅肝酱_小")
        model10.Price = 1200
        model10.Techlevel = 5
        model10.TechNeeds = 15000
        model10.type = MenuType.French
        arr2.add(model10)
        self.DataDic.setValue(arr2, forKey: MenuType.French.rawValue)
        
        // MARK:家常菜
        let arr3 = NSMutableArray.init()
        let model21 = baseMenu.init()
        model21.canBeunlock = true
        model21.isLock = false
        model21.Name = "韭菜炒鸡蛋"
        model21.Picture = UIImage.init(named: "家常菜-韭菜炒鸡蛋_小")
        model21.Price = 50
        model21.Techlevel = 1
        model21.TechNeeds = 0
        model21.type = MenuType.Home
        arr3.add(model21)
        let model22 = baseMenu.init()
        model22.canBeunlock = true
        model22.isLock = false
        model22.Name = "酸辣土豆丝"
        model22.Picture = UIImage.init(named: "家常菜-酸辣土豆丝_小")
        model22.Price = 55
        model22.Techlevel = 1
        model22.TechNeeds = 0
        model22.type = MenuType.Home
        arr3.add(model22)
        let model23 = baseMenu.init()
        model23.canBeunlock = true
        model23.isLock = false
        model23.Name = "番茄炒蛋"
        model23.Picture = UIImage.init(named: "家常菜-西红柿炒蛋_小")
        model23.Price = 60
        model23.Techlevel = 1
        model23.TechNeeds = 0
        model23.type = MenuType.Home
        arr3.add(model23)
        let model24 = baseMenu.init()
        model24.canBeunlock = true
        model24.isLock = true
        model24.Name = "干煸四季豆"
        model24.Picture = UIImage.init(named: "家常菜-干煸四季豆_小")
        model24.Price = 120
        model24.Techlevel = 2
        model24.TechNeeds = 1200
        model24.type = MenuType.Home
        arr3.add(model24)
        let model25 = baseMenu.init()
        model25.canBeunlock = true
        model25.isLock = true
        model25.Name = "红烧茄子"
        model25.Picture = UIImage.init(named: "家常菜-红烧茄子_小")
        model25.Price = 140
        model25.Techlevel = 2
        model25.TechNeeds = 1400
        model25.type = MenuType.Home
        arr3.add(model25)
        let model26 = baseMenu.init()
        model26.canBeunlock = true
        model26.isLock = true
        model26.Name = "可乐鸡翅"
        model26.Picture = UIImage.init(named: "家常菜-可乐鸡翅_小")
        model26.Price = 200
        model26.Techlevel = 2
        model26.TechNeeds = 2500
        model26.type = MenuType.Home
        arr3.add(model26)
        let model27 = baseMenu.init()
        model27.canBeunlock = false
        model27.isLock = true
        model27.Name = "水煮鱼"
        model27.Picture = UIImage.init(named: "家常菜-水煮鱼_小")
        model27.Price = 450
        model27.Techlevel = 3
        model27.TechNeeds = 8000
        model27.type = MenuType.Home
        arr3.add(model27)
        let model28 = baseMenu.init()
        model28.canBeunlock = false
        model28.isLock = true
        model28.Name = "酸菜鱼"
        model28.Picture = UIImage.init(named: "家常菜-酸菜鱼_小")
        model28.Price = 400
        model28.Techlevel = 3
        model28.TechNeeds = 7000
        model28.type = MenuType.Home
        arr3.add(model28)
        let model29 = baseMenu.init()
        model29.canBeunlock = false
        model29.isLock = true
        model29.Name = "糖醋排骨"
        model29.Picture = UIImage.init(named: "家常菜-糖醋排骨_小")
        model29.Price = 600
        model29.Techlevel = 4
        model29.TechNeeds = 10000
        model29.type = MenuType.Home
        arr3.add(model29)
        let model20 = baseMenu.init()
        model20.canBeunlock = false
        model20.isLock = true
        model20.Name = "红烧肉"
        model20.Picture = UIImage.init(named: "家常菜-红烧肉_小")
        model20.Price = 1200
        model20.Techlevel = 5
        model20.TechNeeds = 15000
        model20.type = MenuType.Home
        arr3.add(model20)
        self.DataDic.setValue(arr3, forKey: MenuType.Home.rawValue)
        
        // MARK:淮扬菜
        let arr4 = NSMutableArray.init()
        let model31 = baseMenu.init()
        model31.canBeunlock = true
        model31.isLock = false
        model31.Name = "扬州炒饭"
        model31.Picture = UIImage.init(named: "淮扬菜-扬州炒饭_小")
        model31.Price = 50
        model31.Techlevel = 1
        model31.TechNeeds = 0
        model31.type = MenuType.huaiyang
        arr4.add(model31)
        let model32 = baseMenu.init()
        model32.canBeunlock = true
        model32.isLock = false
        model32.Name = "大煮干丝"
        model32.Picture = UIImage.init(named: "淮扬菜-大煮干丝_小")
        model32.Price = 55
        model32.Techlevel = 1
        model32.TechNeeds = 0
        model32.type = MenuType.huaiyang
        arr4.add(model32)
        let model33 = baseMenu.init()
        model33.canBeunlock = true
        model33.isLock = false
        model33.Name = "黄桥烧饼"
        model33.Picture = UIImage.init(named: "淮扬菜-黄桥烧饼_小")
        model33.Price = 60
        model33.Techlevel = 1
        model33.TechNeeds = 0
        model33.type = MenuType.huaiyang
        arr4.add(model33)
        let model34 = baseMenu.init()
        model34.canBeunlock = true
        model34.isLock = true
        model34.Name = "平桥豆腐"
        model34.Picture = UIImage.init(named: "淮扬菜-平桥豆腐_小")
        model34.Price = 120
        model34.Techlevel = 2
        model34.TechNeeds = 1200
        model34.type = MenuType.huaiyang
        arr4.add(model34)
        let model35 = baseMenu.init()
        model35.canBeunlock = true
        model35.isLock = true
        model35.Name = "文思豆腐"
        model35.Picture = UIImage.init(named: "淮扬菜-文思豆腐_小")
        model35.Price = 140
        model35.Techlevel = 2
        model35.TechNeeds = 1400
        model35.type = MenuType.huaiyang
        arr4.add(model35)
        let model36 = baseMenu.init()
        model36.canBeunlock = true
        model36.isLock = true
        model36.Name = "松鼠桂鱼"
        model36.Picture = UIImage.init(named: "淮扬菜-松鼠桂鱼_小")
        model36.Price = 200
        model36.Techlevel = 2
        model36.TechNeeds = 2500
        model36.type = MenuType.huaiyang
        arr4.add(model36)
        let model37 = baseMenu.init()
        model37.canBeunlock = false
        model37.isLock = true
        model37.Name = "三套鸭"
        model37.Picture = UIImage.init(named: "淮扬菜-三套鸭_小")
        model37.Price = 450
        model37.Techlevel = 3
        model37.TechNeeds = 8000
        model37.type = MenuType.huaiyang
        arr4.add(model37)
        let model38 = baseMenu.init()
        model38.canBeunlock = false
        model38.isLock = true
        model38.Name = "扬州狮子头"
        model38.Picture = UIImage.init(named: "淮扬菜-扬州狮子头_小")
        model38.Price = 400
        model38.Techlevel = 3
        model38.TechNeeds = 7000
        model38.type = MenuType.huaiyang
        arr4.add(model38)
        let model39 = baseMenu.init()
        model39.canBeunlock = false
        model39.isLock = true
        model39.Name = "水晶肴肉"
        model39.Picture = UIImage.init(named: "淮扬菜-水晶肴肉_小")
        model39.Price = 600
        model39.Techlevel = 4
        model39.TechNeeds = 10000
        model39.type = MenuType.huaiyang
        arr4.add(model39)
        let model30 = baseMenu.init()
        model30.canBeunlock = false
        model30.isLock = true
        model30.Name = "蟹粉狮子头"
        model30.Picture = UIImage.init(named: "淮扬菜-蟹粉狮子头_小")
        model30.Price = 1200
        model30.Techlevel = 5
        model30.TechNeeds = 15000
        model30.type = MenuType.huaiyang
        arr4.add(model30)
        self.DataDic.setValue(arr4, forKey: MenuType.huaiyang.rawValue)
        
        // MARK:印度菜
        let arr5 = NSMutableArray.init()
        let model41 = baseMenu.init()
        model41.canBeunlock = true
        model41.isLock = false
        model41.Name = "印度拉茶"
        model41.Picture = UIImage.init(named: "印度菜-印度拉茶_小")
        model41.Price = 50
        model41.Techlevel = 1
        model41.TechNeeds = 0
        model41.type = MenuType.India
        arr5.add(model41)
        let model42 = baseMenu.init()
        model42.canBeunlock = true
        model42.isLock = false
        model42.Name = "印度抛饼"
        model42.Picture = UIImage.init(named: "印度菜-印度抛饼_小")
        model42.Price = 55
        model42.Techlevel = 1
        model42.TechNeeds = 0
        model42.type = MenuType.India
        arr5.add(model42)
        let model43 = baseMenu.init()
        model43.canBeunlock = true
        model43.isLock = false
        model43.Name = "印度炒面"
        model43.Picture = UIImage.init(named: "印度菜-印度炒面_小")
        model43.Price = 60
        model43.Techlevel = 1
        model43.TechNeeds = 0
        model43.type = MenuType.India
        arr5.add(model43)
        let model44 = baseMenu.init()
        model44.canBeunlock = true
        model44.isLock = true
        model44.Name = "泊兰馕"
        model44.Picture = UIImage.init(named: "印度菜-泊兰馕_小")
        model44.Price = 120
        model44.Techlevel = 2
        model44.TechNeeds = 1200
        model44.type = MenuType.India
        arr5.add(model44)
        let model45 = baseMenu.init()
        model45.canBeunlock = true
        model45.isLock = true
        model45.Name = "菠菜奶豆腐"
        model45.Picture = UIImage.init(named: "印度菜-菠菜奶豆腐_小")
        model45.Price = 140
        model45.Techlevel = 2
        model45.TechNeeds = 1400
        model45.type = MenuType.India
        arr5.add(model45)
        let model46 = baseMenu.init()
        model46.canBeunlock = true
        model46.isLock = true
        model46.Name = "波亚尼炖饭"
        model46.Picture = UIImage.init(named: "印度菜-波亚尼炖饭_小")
        model46.Price = 200
        model46.Techlevel = 2
        model46.TechNeeds = 2500
        model46.type = MenuType.India
        arr5.add(model46)
        let model47 = baseMenu.init()
        model47.canBeunlock = false
        model47.isLock = true
        model47.Name = "奶油鸡"
        model47.Picture = UIImage.init(named: "印度菜-奶油鸡_小")
        model47.Price = 450
        model47.Techlevel = 3
        model47.TechNeeds = 8000
        model47.type = MenuType.India
        arr5.add(model47)
        let model48 = baseMenu.init()
        model48.canBeunlock = false
        model48.isLock = true
        model48.Name = "马萨拉咖喱鸡"
        model48.Picture = UIImage.init(named: "印度菜-马萨拉咖喱鸡_小")
        model48.Price = 400
        model48.Techlevel = 3
        model48.TechNeeds = 7000
        model48.type = MenuType.India
        arr5.add(model48)
        let model49 = baseMenu.init()
        model49.canBeunlock = false
        model49.isLock = true
        model49.Name = "坦都里烤鸡"
        model49.Picture = UIImage.init(named: "印度菜-坦都里烤鸡_小")
        model49.Price = 600
        model49.Techlevel = 4
        model49.TechNeeds = 10000
        model49.type = MenuType.India
        arr5.add(model49)
        let model40 = baseMenu.init()
        model40.canBeunlock = false
        model40.isLock = true
        model40.Name = "塔利"
        model40.Picture = UIImage.init(named: "印度菜-塔利_小")
        model40.Price = 1200
        model40.Techlevel = 5
        model40.TechNeeds = 15000
        model40.type = MenuType.India
        arr5.add(model40)
        self.DataDic.setValue(arr5, forKey: MenuType.India.rawValue)

        // MARK:日式料理
        let arr6 = NSMutableArray.init()
        let model51 = baseMenu.init()
        model51.canBeunlock = true
        model51.isLock = false
        model51.Name = "味增汤"
        model51.Picture = UIImage.init(named: "日本菜-味增汤_小")
        model51.Price = 50
        model51.Techlevel = 1
        model51.TechNeeds = 0
        model51.type = MenuType.Japan
        arr6.add(model51)
        let model52 = baseMenu.init()
        model52.canBeunlock = true
        model52.isLock = false
        model52.Name = "生鱼片"
        model52.Picture = UIImage.init(named: "日本菜-生鱼片_小")
        model52.Price = 55
        model52.Techlevel = 1
        model52.TechNeeds = 0
        model52.type = MenuType.Japan
        arr6.add(model52)
        let model53 = baseMenu.init()
        model53.canBeunlock = true
        model53.isLock = false
        model53.Name = "寿司"
        model53.Picture = UIImage.init(named: "日本菜-寿司_小")
        model53.Price = 60
        model53.Techlevel = 1
        model53.TechNeeds = 0
        model53.type = MenuType.Japan
        arr6.add(model53)
        let model54 = baseMenu.init()
        model54.canBeunlock = true
        model54.isLock = true
        model54.Name = "刺身"
        model54.Picture = UIImage.init(named: "日本菜-刺身_小")
        model54.Price = 120
        model54.Techlevel = 2
        model54.TechNeeds = 1200
        model54.type = MenuType.Japan
        arr6.add(model54)
        let model55 = baseMenu.init()
        model55.canBeunlock = true
        model55.isLock = true
        model55.Name = "蛋包饭"
        model55.Picture = UIImage.init(named: "日本菜-蛋包饭_小")
        model55.Price = 140
        model55.Techlevel = 2
        model55.TechNeeds = 1400
        model55.type = MenuType.Japan
        arr6.add(model55)
        let model56 = baseMenu.init()
        model56.canBeunlock = true
        model56.isLock = true
        model56.Name = "大阪烧"
        model56.Picture = UIImage.init(named: "日本菜-大阪烧_小")
        model56.Price = 200
        model56.Techlevel = 2
        model56.TechNeeds = 2500
        model56.type = MenuType.Japan
        arr6.add(model56)
        let model57 = baseMenu.init()
        model57.canBeunlock = false
        model57.isLock = true
        model57.Name = "天妇罗"
        model57.Picture = UIImage.init(named: "日本菜-天妇罗_小")
        model57.Price = 450
        model57.Techlevel = 3
        model57.TechNeeds = 8000
        model57.type = MenuType.Japan
        arr6.add(model57)
        let model58 = baseMenu.init()
        model58.canBeunlock = false
        model58.isLock = true
        model58.Name = "乌冬面"
        model58.Picture = UIImage.init(named: "日本菜-乌冬面_小")
        model58.Price = 400
        model58.Techlevel = 3
        model58.TechNeeds = 7000
        model58.type = MenuType.Japan
        arr6.add(model58)
        let model59 = baseMenu.init()
        model59.canBeunlock = false
        model59.isLock = true
        model59.Name = "鳗鱼饭"
        model59.Picture = UIImage.init(named: "日本菜-鳗鱼饭_小")
        model59.Price = 600
        model59.Techlevel = 4
        model59.TechNeeds = 10000
        model59.type = MenuType.Japan
        arr6.add(model59)
        let model50 = baseMenu.init()
        model50.canBeunlock = false
        model50.isLock = true
        model50.Name = "神户牛肉"
        model50.Picture = UIImage.init(named: "日本菜-神户牛肉_小")
        model50.Price = 1200
        model50.Techlevel = 5
        model50.TechNeeds = 15000
        model50.type = MenuType.Japan
        arr6.add(model50)
        self.DataDic.setValue(arr6, forKey: MenuType.Japan.rawValue)
        // MARK:韩式料理
        let arr7 = NSMutableArray.init()
        let model61 = baseMenu.init()
        model61.canBeunlock = true
        model61.isLock = false
        model61.Name = "酱汤泡饭"
        model61.Picture = UIImage.init(named: "韩国菜-酱汤泡饭_小")
        model61.Price = 50
        model61.Techlevel = 1
        model61.TechNeeds = 0
        model61.type = MenuType.Korea
        arr7.add(model61)
        let model62 = baseMenu.init()
        model62.canBeunlock = true
        model62.isLock = false
        model62.Name = "冷面"
        model62.Picture = UIImage.init(named: "韩国菜-冷面_小")
        model62.Price = 55
        model62.Techlevel = 1
        model62.TechNeeds = 0
        model62.type = MenuType.Korea
        arr7.add(model62)
        let model63 = baseMenu.init()
        model63.canBeunlock = true
        model63.isLock = false
        model63.Name = "大枣粥"
        model63.Picture = UIImage.init(named: "韩国菜-大枣粥_小")
        model63.Price = 60
        model63.Techlevel = 1
        model63.TechNeeds = 0
        model63.type = MenuType.Korea
        arr7.add(model63)
        let model64 = baseMenu.init()
        model64.canBeunlock = true
        model64.isLock = true
        model64.Name = "牛杂碎汤"
        model64.Picture = UIImage.init(named: "韩国菜-牛杂碎汤_小")
        model64.Price = 120
        model64.Techlevel = 2
        model64.TechNeeds = 1200
        model64.type = MenuType.Korea
        arr7.add(model64)
        let model65 = baseMenu.init()
        model65.canBeunlock = true
        model65.isLock = true
        model65.Name = "清炖牛尾汤"
        model65.Picture = UIImage.init(named: "韩国菜-清炖牛尾汤_小")
        model65.Price = 140
        model65.Techlevel = 2
        model65.TechNeeds = 1400
        model65.type = MenuType.Korea
        arr7.add(model65)
        let model66 = baseMenu.init()
        model66.canBeunlock = true
        model66.isLock = true
        model66.Name = "雪浓汤"
        model66.Picture = UIImage.init(named: "韩国菜-雪浓汤_小")
        model66.Price = 200
        model66.Techlevel = 2
        model66.TechNeeds = 2500
        model66.type = MenuType.Korea
        arr7.add(model66)
        let model67 = baseMenu.init()
        model67.canBeunlock = false
        model67.isLock = true
        model67.Name = "炖年糕"
        model67.Picture = UIImage.init(named: "韩国菜-炖年糕_小")
        model67.Price = 450
        model67.Techlevel = 3
        model67.TechNeeds = 8000
        model67.type = MenuType.Korea
        arr7.add(model67)
        let model68 = baseMenu.init()
        model68.canBeunlock = false
        model68.isLock = true
        model68.Name = "参鸡汤"
        model68.Picture = UIImage.init(named: "韩国菜-参鸡汤_小")
        model68.Price = 400
        model68.Techlevel = 3
        model68.TechNeeds = 7000
        model68.type = MenuType.Korea
        arr7.add(model68)
        let model69 = baseMenu.init()
        model69.canBeunlock = false
        model69.isLock = true
        model69.Name = "韩国烤肉"
        model69.Picture = UIImage.init(named: "韩国菜-韩国烤肉_小")
        model69.Price = 600
        model69.Techlevel = 4
        model69.TechNeeds = 10000
        model69.type = MenuType.Korea
        arr7.add(model69)
        let model60 = baseMenu.init()
        model60.canBeunlock = false
        model60.isLock = true
        model60.Name = "炖真鲷"
        model60.Picture = UIImage.init(named: "韩国菜-炖真鲷_小")
        model60.Price = 1200
        model60.Techlevel = 5
        model60.TechNeeds = 15000
        model60.type = MenuType.Korea
        arr7.add(model60)
        self.DataDic.setValue(arr7, forKey: MenuType.Korea.rawValue)
       
        // MARK:鲁菜
        let arr8 = NSMutableArray.init()
        let model71 = baseMenu.init()
        model71.canBeunlock = true
        model71.isLock = false
        model71.Name = "一品豆腐"
        model71.Picture = UIImage.init(named: "鲁菜-一品豆腐_小")
        model71.Price = 50
        model71.Techlevel = 1
        model71.TechNeeds = 0
        model71.type = MenuType.ShanDong
        arr8.add(model71)
        let model72 = baseMenu.init()
        model72.canBeunlock = true
        model72.isLock = false
        model72.Name = "汤爆双脆"
        model72.Picture = UIImage.init(named: "鲁菜-汤爆双脆_小")
        model72.Price = 55
        model72.Techlevel = 1
        model72.TechNeeds = 0
        model72.type = MenuType.ShanDong
        arr8.add(model72)
        let model73 = baseMenu.init()
        model73.canBeunlock = true
        model73.isLock = false
        model73.Name = "芙蓉鸡片"
        model73.Picture = UIImage.init(named: "鲁菜-芙蓉鸡片_小")
        model73.Price = 60
        model73.Techlevel = 1
        model73.TechNeeds = 0
        model73.type = MenuType.ShanDong
        arr8.add(model73)
        let model74 = baseMenu.init()
        model74.canBeunlock = true
        model74.isLock = true
        model74.Name = "扒鸡"
        model74.Picture = UIImage.init(named: "鲁菜-德州扒鸡_小")
        model74.Price = 120
        model74.Techlevel = 2
        model74.TechNeeds = 1200
        model74.type = MenuType.ShanDong
        arr8.add(model74)
        let model75 = baseMenu.init()
        model75.canBeunlock = true
        model75.isLock = true
        model75.Name = "糖醋鲤鱼"
        model75.Picture = UIImage.init(named: "鲁菜-糖醋鲤鱼_小")
        model75.Price = 140
        model75.Techlevel = 2
        model75.TechNeeds = 1400
        model75.type = MenuType.ShanDong
        arr8.add(model75)
        let model76 = baseMenu.init()
        model76.canBeunlock = true
        model76.isLock = true
        model76.Name = "乌鱼蛋汤"
        model76.Picture = UIImage.init(named: "鲁菜-乌鱼蛋汤_小")
        model76.Price = 200
        model76.Techlevel = 2
        model76.TechNeeds = 2500
        model76.type = MenuType.ShanDong
        arr8.add(model76)
        let model77 = baseMenu.init()
        model77.canBeunlock = false
        model77.isLock = true
        model77.Name = "木樨肉"
        model77.Picture = UIImage.init(named: "鲁菜-木樨肉_小")
        model77.Price = 450
        model77.Techlevel = 3
        model77.TechNeeds = 8000
        model77.type = MenuType.ShanDong
        arr8.add(model77)
        let model78 = baseMenu.init()
        model78.canBeunlock = false
        model78.isLock = true
        model78.Name = "九转大肠"
        model78.Picture = UIImage.init(named: "鲁菜-九转大肠_小")
        model78.Price = 400
        model78.Techlevel = 3
        model78.TechNeeds = 7000
        model78.type = MenuType.ShanDong
        arr8.add(model78)
        let model79 = baseMenu.init()
        model79.canBeunlock = false
        model79.isLock = true
        model79.Name = "葱烧海参"
        model79.Picture = UIImage.init(named: "鲁菜-葱烧海参_小")
        model79.Price = 600
        model79.Techlevel = 4
        model79.TechNeeds = 10000
        model79.type = MenuType.ShanDong
        arr8.add(model79)
        let model70 = baseMenu.init()
        model70.canBeunlock = false
        model70.isLock = true
        model70.Name = "三丝鱼翅"
        model70.Picture = UIImage.init(named: "鲁菜-三丝鱼翅_小")
        model70.Price = 1200
        model70.Techlevel = 5
        model70.TechNeeds = 15000
        model70.type = MenuType.ShanDong
        arr8.add(model70)
        self.DataDic.setValue(arr8, forKey: MenuType.ShanDong.rawValue)
        
        // MARK:粤菜
        let arr9 = NSMutableArray.init()
        let model81 = baseMenu.init()
        model81.canBeunlock = true
        model81.isLock = false
        model81.Name = "潮州牛肉丸"
        model81.Picture = UIImage.init(named: "粤菜-潮州牛肉丸_小")
        model81.Price = 50
        model81.Techlevel = 1
        model81.TechNeeds = 0
        model81.type = MenuType.Stark
        arr9.add(model81)
        let model82 = baseMenu.init()
        model82.canBeunlock = true
        model82.isLock = false
        model82.Name = "客家酿豆腐"
        model82.Picture = UIImage.init(named: "粤菜-客家酿豆腐_小")
        model82.Price = 55
        model82.Techlevel = 1
        model82.TechNeeds = 0
        model82.type = MenuType.Stark
        arr9.add(model82)
        let model83 = baseMenu.init()
        model83.canBeunlock = true
        model83.isLock = false
        model83.Name = "白切鸡"
        model83.Picture = UIImage.init(named: "粤菜-白切鸡_小")
        model83.Price = 60
        model83.Techlevel = 1
        model83.TechNeeds = 0
        model83.type = MenuType.Stark
        arr9.add(model83)
        let model84 = baseMenu.init()
        model84.canBeunlock = true
        model84.isLock = true
        model84.Name = "白灼虾"
        model84.Picture = UIImage.init(named: "粤菜-白灼虾_小")
        model84.Price = 120
        model84.Techlevel = 2
        model84.TechNeeds = 1200
        model84.type = MenuType.Stark
        arr9.add(model84)
        let model85 = baseMenu.init()
        model85.canBeunlock = true
        model85.isLock = true
        model85.Name = "煲仔饭"
        model85.Picture = UIImage.init(named: "粤菜-煲仔饭_小")
        model85.Price = 140
        model85.Techlevel = 2
        model85.TechNeeds = 1400
        model85.type = MenuType.Stark
        arr9.add(model85)
        let model86 = baseMenu.init()
        model86.canBeunlock = true
        model86.isLock = true
        model86.Name = "广州文昌鸡"
        model86.Picture = UIImage.init(named: "粤菜-广州文昌鸡_小")
        model86.Price = 200
        model86.Techlevel = 2
        model86.TechNeeds = 2500
        model86.type = MenuType.Stark
        arr9.add(model86)
        let model87 = baseMenu.init()
        model87.canBeunlock = false
        model87.isLock = true
        model87.Name = "红烧乳鸽"
        model87.Picture = UIImage.init(named: "粤菜-红烧乳鸽_小")
        model87.Price = 450
        model87.Techlevel = 3
        model87.TechNeeds = 8000
        model87.type = MenuType.Stark
        arr9.add(model87)
        let model88 = baseMenu.init()
        model88.canBeunlock = false
        model88.isLock = true
        model88.Name = "芙蓉虾"
        model88.Picture = UIImage.init(named: "粤菜-芙蓉虾_小")
        model88.Price = 400
        model88.Techlevel = 3
        model88.TechNeeds = 7000
        model88.type = MenuType.Stark
        arr9.add(model88)
        let model89 = baseMenu.init()
        model89.canBeunlock = false
        model89.isLock = true
        model89.Name = "梅菜扣肉"
        model89.Picture = UIImage.init(named: "粤菜-梅菜扣肉_小")
        model89.Price = 600
        model89.Techlevel = 4
        model89.TechNeeds = 10000
        model89.type = MenuType.Stark
        arr9.add(model89)
        let model80 = baseMenu.init()
        model80.canBeunlock = false
        model80.isLock = true
        model80.Name = "蜜汁叉烧"
        model80.Picture = UIImage.init(named: "粤菜-蜜汁叉烧_小")
        model80.Price = 1200
        model80.Techlevel = 5
        model80.TechNeeds = 15000
        model80.type = MenuType.Stark
        arr9.add(model80)
        self.DataDic.setValue(arr9, forKey: MenuType.Stark.rawValue)
        
        // MARK:川菜
        let arrA = NSMutableArray.init()
        let model91 = baseMenu.init()
        model91.canBeunlock = true
        model91.isLock = false
        model91.Name = "麻婆豆腐"
        model91.Picture = UIImage.init(named: "川菜-麻婆豆腐_小")
        model91.Price = 50
        model91.Techlevel = 1
        model91.TechNeeds = 0
        model91.type = MenuType.Tully
        arrA.add(model91)
        let model92 = baseMenu.init()
        model92.canBeunlock = true
        model92.isLock = false
        model92.Name = "夫妻肺片"
        model92.Picture = UIImage.init(named: "川菜-夫妻肺片_小")
        model92.Price = 55
        model92.Techlevel = 1
        model92.TechNeeds = 0
        model92.type = MenuType.Tully
        arrA.add(model92)
        let model93 = baseMenu.init()
        model93.canBeunlock = true
        model93.isLock = false
        model93.Name = "担担面"
        model93.Picture = UIImage.init(named: "川菜-担担面_小")
        model93.Price = 60
        model93.Techlevel = 1
        model93.TechNeeds = 0
        model93.type = MenuType.Tully
        arrA.add(model93)
        let model94 = baseMenu.init()
        model94.canBeunlock = true
        model94.isLock = true
        model94.Name = "宫保鸡丁"
        model94.Picture = UIImage.init(named: "川菜-宫保鸡丁_小")
        model94.Price = 120
        model94.Techlevel = 2
        model94.TechNeeds = 1200
        model94.type = MenuType.Tully
        arrA.add(model94)
        let model95 = baseMenu.init()
        model95.canBeunlock = true
        model95.isLock = true
        model95.Name = "回锅肉"
        model95.Picture = UIImage.init(named: "川菜-回锅肉_小")
        model95.Price = 140
        model95.Techlevel = 2
        model95.TechNeeds = 1400
        model95.type = MenuType.Tully
        arrA.add(model95)
        let model96 = baseMenu.init()
        model96.canBeunlock = true
        model96.isLock = true
        model96.Name = "鱼香肉丝"
        model96.Picture = UIImage.init(named: "川菜-鱼香肉丝_小")
        model96.Price = 200
        model96.Techlevel = 2
        model96.TechNeeds = 2500
        model96.type = MenuType.Tully
        arrA.add(model96)
        let model97 = baseMenu.init()
        model97.canBeunlock = false
        model97.isLock = true
        model97.Name = "粉蒸牛肉"
        model97.Picture = UIImage.init(named: "川菜-粉蒸牛肉_小")
        model97.Price = 450
        model97.Techlevel = 3
        model97.TechNeeds = 8000
        model97.type = MenuType.Tully
        arrA.add(model97)
        let model98 = baseMenu.init()
        model98.canBeunlock = false
        model98.isLock = true
        model98.Name = "怪味鸡"
        model98.Picture = UIImage.init(named: "川菜-怪味鸡_小")
        model98.Price = 400
        model98.Techlevel = 3
        model98.TechNeeds = 7000
        model98.type = MenuType.Tully
        arrA.add(model98)
        let model99 = baseMenu.init()
        model99.canBeunlock = false
        model99.isLock = true
        model99.Name = "干烧岩鲤"
        model99.Picture = UIImage.init(named: "川菜-干烧岩鲤_小")
        model99.Price = 600
        model99.Techlevel = 4
        model99.TechNeeds = 10000
        model99.type = MenuType.Tully
        arrA.add(model99)
        let model90 = baseMenu.init()
        model90.canBeunlock = false
        model90.isLock = true
        model90.Name = "东坡肘子"
        model90.Picture = UIImage.init(named: "川菜-东坡肘子_小")
        model90.Price = 1200
        model90.Techlevel = 5
        model90.TechNeeds = 15000
        model90.type = MenuType.Tully
        arrA.add(model90)
        self.DataDic.setValue(arrA, forKey: MenuType.Tully.rawValue)
        // MARK:意大利菜
        let arrB = NSMutableArray.init()
        let model101 = baseMenu.init()
        model101.canBeunlock = true
        model101.isLock = false
        model101.Name = "意式鸡排"
        model101.Picture = UIImage.init(named: "意大利菜-意式鸡排_小")
        model101.Price = 50
        model101.Techlevel = 1
        model101.TechNeeds = 0
        model101.type = MenuType.Tyrell
        arrB.add(model101)
        let model102 = baseMenu.init()
        model102.canBeunlock = true
        model102.isLock = false
        model102.Name = "意面"
        model102.Picture = UIImage.init(named: "意大利菜-意大利面_小")
        model102.Price = 55
        model102.Techlevel = 1
        model102.TechNeeds = 0
        model102.type = MenuType.Tyrell
        arrB.add(model102)
        let model103 = baseMenu.init()
        model103.canBeunlock = true
        model103.isLock = false
        model103.Name = "意式烤鸡"
        model103.Picture = UIImage.init(named: "意大利菜-意大利烤鸡_小")
        model103.Price = 60
        model103.Techlevel = 1
        model103.TechNeeds = 0
        model103.type = MenuType.Tyrell
        arrB.add(model103)
        let model104 = baseMenu.init()
        model104.canBeunlock = true
        model104.isLock = true
        model104.Name = "甘蓝菜饭"
        model104.Picture = UIImage.init(named: "意大利菜-意大利式甘蓝菜饭_小")
        model104.Price = 120
        model104.Techlevel = 2
        model104.TechNeeds = 1200
        model104.type = MenuType.Tyrell
        arrB.add(model104)
        let model105 = baseMenu.init()
        model105.canBeunlock = true
        model105.isLock = true
        model105.Name = "墨鱼面"
        model105.Picture = UIImage.init(named: "意大利菜-墨鱼面_小")
        model105.Price = 140
        model105.Techlevel = 2
        model105.TechNeeds = 1400
        model105.type = MenuType.Tyrell
        arrB.add(model105)
        let model106 = baseMenu.init()
        model106.canBeunlock = true
        model106.isLock = true
        model106.Name = "鲜虾蝴蝶面"
        model106.Picture = UIImage.init(named: "意大利菜-鲜虾蝴蝶面_小")
        model106.Price = 200
        model106.Techlevel = 2
        model106.TechNeeds = 2500
        model106.type = MenuType.Tyrell
        arrB.add(model106)
        let model107 = baseMenu.init()
        model107.canBeunlock = false
        model107.isLock = true
        model107.Name = "牛柳炒意粉"
        model107.Picture = UIImage.init(named: "意大利菜-黑椒牛柳炒意粉_小")
        model107.Price = 450
        model107.Techlevel = 3
        model107.TechNeeds = 8000
        model107.type = MenuType.Tyrell
        arrB.add(model107)
        let model108 = baseMenu.init()
        model108.canBeunlock = false
        model108.isLock = true
        model108.Name = "皮埃蒙特肉饺"
        model108.Picture = UIImage.init(named: "意大利菜-皮埃蒙特肉饺_小")
        model108.Price = 400
        model108.Techlevel = 3
        model108.TechNeeds = 7000
        model108.type = MenuType.Tyrell
        arrB.add(model108)
        let model109 = baseMenu.init()
        model109.canBeunlock = false
        model109.isLock = true
        model109.Name = "披萨"
        model109.Picture = UIImage.init(named: "意大利菜-意大利披萨_小")
        model109.Price = 600
        model109.Techlevel = 4
        model109.TechNeeds = 10000
        model109.type = MenuType.Tyrell
        arrB.add(model109)
        let model100 = baseMenu.init()
        model100.canBeunlock = false
        model100.isLock = true
        model100.Name = "海鲜烩饭"
        model100.Picture = UIImage.init(named: "意大利菜-意大利海鲜烩饭_小")
        model100.Price = 1200
        model100.Techlevel = 5
        model100.TechNeeds = 15000
        model100.type = MenuType.Tyrell
        arrB.add(model100)
        self.DataDic.setValue(arrB, forKey: MenuType.Tyrell.rawValue)
        //MARK:新增处
    }
    
    func getData(type:MenuType) -> NSMutableArray {
        let Str = type.rawValue
        let arr = self.DataDic.value(forKey: Str) as! NSMutableArray
        return arr;
    }
    
}
