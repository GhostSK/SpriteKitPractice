//
//  PersonMarket.swift
//  RestaurantManager
//
//  Created by 胡杨林 on 2017/9/26.
//  Copyright © 2017年 胡杨林. All rights reserved.
//

import Foundation
import UIKit

class PersonMarket: UIView {
    var DataArr:NSMutableArray = NSMutableArray.init()
    var Scrollview:UIScrollView? = nil
    init(DataArr:NSArray) {
        super.init(frame: CGRect(x: 0, y: 0, width: 736, height: 414))
        self.DataArr = DataArr as! NSMutableArray
        let backImageView = UIImageView.init(frame: CGRect(x: 0, y: 0, width: 736, height: 414))
        backImageView.image = UIImage.init(named: "PersonMarketBackImage")
        self.addSubview(backImageView)
        
        let exitBtn = UIButton.init(frame: CGRect(x: 736 - 48, y: 0, width: 48, height: 48))
        exitBtn.setImage(UIImage.init(named: "exit"), for: .normal)
        exitBtn.setImage(UIImage.init(named: "exit"), for: .selected)
        exitBtn.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        self.addSubview(exitBtn)
        //单个雇员界面大小是260*300
        let scrollback = UIView.init(frame: CGRect(x: 20, y: 20, width: 736 - 40, height: 414 - 40))
        scrollback.backgroundColor = UIColor.init(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.25)
        self.addSubview(scrollback)
        self.Scrollview = UIScrollView.init(frame: CGRect(x: 30, y: 20, width: 736 - 60, height: 414 - 40))
        self.Scrollview?.backgroundColor = UIColor.clear
        self.Scrollview?.contentSize = CGSize(width: 280 * self.DataArr.count + 20, height: 374)
        self.addSubview(self.Scrollview!)
        for i in 0..<self.DataArr.count {
            let model = self.DataArr[i] as! EmployeeModel
            let emView = employeeViewInMarket.BuildEmployeeView(model: model, PositionPoint: CGPoint(x: 280 * i + 20, y: 20))
            emView.tag = 9000 + i
            self.Scrollview?.addSubview(emView)
            let btn = UIButton.init(frame: CGRect(x: 120 + 280 * i, y: 330, width: 80, height: 30))
            btn.tag = 8000 + i
            btn.backgroundColor = UIColor.gray
            btn.setTitle("招聘！", for: .normal)
            btn.setTitle("已招募", for: .selected)
            btn.addTarget(self, action: #selector(employPerson(btn:)), for: .touchUpInside)
            self.Scrollview?.addSubview(btn)
        }
        
        
        
        
    }
    
    @objc func employPerson(btn:UIButton){
        let tag = btn.tag - 8000
        print("选中了第\(tag)个按钮")
        btn.isSelected = true
        btn.isUserInteractionEnabled = false
        let view = self.viewWithTag(9000 + tag) as! employeeViewInMarket
        view.didEmployed()
    }
    
    @objc func dismissView() {
        self.removeFromSuperview()
    }
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 736, height: 414))
        let backImageView = UIImageView.init(frame: CGRect(x: 0, y: 0, width: 736, height: 414))
        backImageView.image = UIImage.init(named: "PersonMarketBackImage")
        self.addSubview(backImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//该类用来随机生成本次可以招聘的员工
class PersonMarketDatabase:NSObject {
    class func BuildData(Fame:NSInteger) -> NSArray {
        let dataArr = NSMutableArray.init()
        let count = Int(arc4random() % 5) + 10
//        print("随机数=\(count)")
        for _ in 1...count {
            let model = EmployeeModel.init()
            let male = arc4random() % 100
            if male % 2 == 0 { //根据性别设定头像记得
                model.Name = PersonMarketDatabase.getPersonName(isMan: false)
            }else{
                model.Name = PersonMarketDatabase.getPersonName(isMan: true)
            }
            if Fame < 200 { //最初级雇员，不会高于30，不会低于15
                var b = arc4random() % 15 + 15
                model.agility = NSInteger(b)
                b = arc4random() % 15 + 15
                model.calculateAbility = NSInteger(b)
                b = arc4random() % 15 + 15
                model.charmAbility = NSInteger(b)
                b = arc4random() % 15 + 15
                model.CookAbility = NSInteger(b)
                b = arc4random() % 15 + 15
                model.Lucky = NSInteger(b)
                b = arc4random() % 15 + 15
                model.military = NSInteger(b)
                let d = model.agility + model.calculateAbility + model.charmAbility + model.CookAbility + model.Lucky + model.military
                model.Payment = d - 25 + NSInteger(arc4random() % 50)  //初级人才雇用价格等于能力值和挂上一个30以内的随机数
                let rate = CGFloat(d) / CGFloat(model.Payment)
                if rate > 1.1 {
                    model.judge = "能力凑合，要价偏低，值得考虑"
                }else if rate < 0.9 {
                    model.judge = "能力凑合，要价偏高，仔细考虑"
                }else{
                    model.judge = "水平凑合，要价正常，普普通通"
                }
            }else if Fame < 500 {  //脱离初级的阶段
                
            }
            
            
            dataArr.add(model)
        }
        
        
        
        return dataArr
    }
    
    class func getPersonName(isMan:Bool) -> String {
        var result = ""
        let firstNameArr = NSArray.init(objects: "赵","钱","孙","李","周","吴","郑","王","冯","陈","蒋","沈","朱","秦","张","魏","范","柳","白","宁","徐","宋","左","卢","高","林","胡","马","袁","汪","童","蓝","黄","欧阳","上官","司马","夏侯","公孙","慕容")
        let boyLastNameArr = NSArray.init(objects: "铁林","瑞正","彬","斌","鲁","飞","二狗","狗蛋","大山","云川","长生","长云","长风","博君","丰年","顺","阿狗","楚生","华威","羽","英达","三星","波","小贤","金牙","星汉","建军","三壮","四郎","小五","大嘴","胖子","阿伯","长老","秀才","小明","定国","安国","兴邦","为民","豪","铁柱")
        let girlLastNameArr = NSArray.init(objects: "泊怡","欣","洁","翠花","静","从静","小丽","小莉","晓丽","佩君","梦思","艳","芳","文芳","红艳","春依","娟","琴","佳琪","嘉琪","洁珊","珊珊","薇","嘉雯","婷","金秀","锦绣","歆","璇","小璇","如","雅君","蝶","三姐","二妞","秀芬","柔","霞","银霞","彩霞")
        let a = firstNameArr.count
        let a1 = Int(arc4random() % UInt32(a))
        let firstStr:String = firstNameArr.object(at: a1) as! String
        if isMan == true {
            let b = boyLastNameArr.count
            let b1 = Int(arc4random() % UInt32(b))
            let lastStr:String = boyLastNameArr.object(at: b1) as! String
            result = firstStr + lastStr
        }else{
            let b = girlLastNameArr.count
            let b1 = Int(arc4random() % UInt32(b))
            let lastStr:String = girlLastNameArr.object(at: b1) as! String
            result = firstStr + lastStr
        }
        print("得到的名字是\(result)")
        return result
    }
    
}
