//
//  EmployeeView.swift
//  RestaurantManager
//
//  Created by 胡杨林 on 2017/9/26.
//  Copyright © 2017年 胡杨林. All rights reserved.
//

import Foundation
import UIKit
class employeeViewInMarket: UIView {
    class func BuildEmployeeView(model:EmployeeModel, PositionPoint:CGPoint)->employeeViewInMarket{
        let view = employeeViewInMarket.init(frame: CGRect(x: PositionPoint.x, y: PositionPoint.y, width: 260, height: 300))
        view.backgroundColor = UIColor.init(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.55)
        let headImageView = UIImageView.init(frame: CGRect(x: 15, y: 15, width: 60, height:80))
        headImageView.image = UIImage(named: "443png")
        view.addSubview(headImageView)
        let nameTitle = UILabel.init(frame: CGRect(x: 90, y: 25, width: 50, height: 25))
        nameTitle.text = "姓名："
        nameTitle.adjustsFontSizeToFitWidth = true
        view.addSubview(nameTitle)
        let nameLabel = UILabel.init(frame: CGRect(x: 140, y: 25, width: 110, height: 25))
        nameLabel.text = model.Name == "" ? "尼古拉斯·二狗子" : model.Name
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.font = UIFont.systemFont(ofSize: 16)
        view.addSubview(nameLabel)
        
        let PayPrice = UILabel.init(frame: CGRect(x: 90, y: 60, width: 50, height: 25))
        PayPrice.text = "薪酬："
        PayPrice.adjustsFontSizeToFitWidth = true
        view.addSubview(PayPrice)
        let Price = UILabel.init(frame: CGRect(x: 140, y: 60, width: 110, height: 25))
        Price.text = "\(model.Payment)"
        view.addSubview(Price)
        
        //数值条
        let Label1 = UILabel.init(frame: CGRect(x: 15, y: 110, width: 55, height: 20))
        Label1.text = "灵巧"
        Label1.textAlignment = .center
        Label1.adjustsFontSizeToFitWidth = true
        view.addSubview(Label1)
        let bar1 = abilityBar.buildBar(Frame: CGRect(x: 75, y: 115, width: 140, height: 10), value: model.agility, ColorType: 0)
        view.addSubview(bar1)
        let right1 = UILabel.init(frame: CGRect(x: 220, y: 110, width: 30, height: 20))
        right1.text = "\(model.agility)"
        right1.adjustsFontSizeToFitWidth = true
        view.addSubview(right1)
        
        let Label2 = UILabel.init(frame: CGRect(x: 15, y: 135, width: 55, height: 20))
        Label2.text = "计算"
        Label2.textAlignment = .center
        Label2.adjustsFontSizeToFitWidth = true
        view.addSubview(Label2)
        let bar2 = abilityBar.buildBar(Frame: CGRect(x: 75, y: 140, width: 140, height: 10), value: model.calculateAbility, ColorType: 1)
        view.addSubview(bar2)
        let right2 = UILabel.init(frame: CGRect(x: 220, y: 135, width: 30, height: 20))
        right2.text = "\(model.calculateAbility)"
        right2.adjustsFontSizeToFitWidth = true
        view.addSubview(right2)
        
        let Label3 = UILabel.init(frame: CGRect(x: 15, y: 160, width: 55, height: 20))
        Label3.text = "厨艺"
        Label3.textAlignment = .center
        Label3.adjustsFontSizeToFitWidth = true
        view.addSubview(Label3)
        let bar3 = abilityBar.buildBar(Frame: CGRect(x: 75, y: 165, width: 140, height: 10), value: model.CookAbility, ColorType: 2)
        view.addSubview(bar3)
        let right3 = UILabel.init(frame: CGRect(x: 220, y: 160, width: 30, height: 20))
        right3.text = "\(model.CookAbility)"
        right3.adjustsFontSizeToFitWidth = true
        view.addSubview(right3)
        
        let Label4 = UILabel.init(frame: CGRect(x: 15, y: 185, width: 55, height: 20))
        Label4.text = "武力"
        Label4.textAlignment = .center
        Label4.adjustsFontSizeToFitWidth = true
        view.addSubview(Label4)
        let bar4 = abilityBar.buildBar(Frame: CGRect(x: 75, y: 190, width: 140, height: 10), value: model.military, ColorType: 3)
        view.addSubview(bar4)
        let right4 = UILabel.init(frame: CGRect(x: 220, y: 185, width: 30, height: 20))
        right4.text = "\(model.military)"
        right4.adjustsFontSizeToFitWidth = true
        view.addSubview(right4)
        
        let Label5 = UILabel.init(frame: CGRect(x: 15, y: 210, width: 55, height: 20))
        Label5.text = "魅力"
        Label5.textAlignment = .center
        Label5.adjustsFontSizeToFitWidth = true
        view.addSubview(Label5)
        let bar5 = abilityBar.buildBar(Frame: CGRect(x: 75, y: 215, width: 140, height: 10), value: model.charmAbility, ColorType: 4)
        view.addSubview(bar5)
        let right5 = UILabel.init(frame: CGRect(x: 220, y: 210, width: 30, height: 20))
        right5.text = "\(model.charmAbility)"
        right5.adjustsFontSizeToFitWidth = true
        view.addSubview(right5)
        
        let Label6 = UILabel.init(frame: CGRect(x: 15, y: 235, width: 55, height: 20))
        Label6.text = "气运"
        Label6.textAlignment = .center
        Label6.adjustsFontSizeToFitWidth = true
        view.addSubview(Label6)
        let bar6 = abilityBar.buildBar(Frame: CGRect(x: 75, y: 240, width: 140, height: 10), value: model.Lucky, ColorType: 5)
        view.addSubview(bar6)
        let right6 = UILabel.init(frame: CGRect(x: 220, y: 235, width: 30, height: 20))
        right6.text = "\(model.Lucky)"
        right6.adjustsFontSizeToFitWidth = true
        view.addSubview(right6)
        
        let judgeTitle = UILabel.init(frame: CGRect(x: 15, y: 260, width: 55, height: 20))
        judgeTitle.text = "评价"
        judgeTitle.textAlignment = .center
        view.addSubview(judgeTitle)
        let judge = UILabel.init(frame: CGRect(x: 75, y: 260, width: 170, height: 35))
        judge.numberOfLines = 2
        judge.textAlignment = .left
//        judge.text = "吃的挺多，偷懒在行，凑合着用吧。"
        judge.text = model.judge
        judge.adjustsFontSizeToFitWidth = true
        view.addSubview(judge)
        
        return view
    }
    
    func didEmployed(){
        let view = UIView.init(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
        view.backgroundColor = UIColor.init(red: 147.0/255, green: 147.0/255, blue: 147.0/255, alpha: 0.8)
        let mark = UIImageView.init(frame: CGRect(x: (view.frame.size.width - 200) / 2, y: (view.frame.size.height - 100) / 2, width: 200, height: 100))
        mark.image = UIImage.init(named: "招募印章")
        view.addSubview(mark)
        self.addSubview(view)
    }
    
}

class abilityBar: UIView {
    //http://www.iconfont.cn/search/index?searchType=icon&q=%E8%BF%9B%E5%BA%A6%E6%9D%A1
    class func buildBar(Frame:CGRect, value:NSInteger, ColorType:NSInteger)->abilityBar{
        let view = abilityBar.init(frame: Frame)
        let backImage = UIImageView.init(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        backImage.image = UIImage(named: "progress_back")
        view.addSubview(backImage)
        let value2 = CGFloat(value)
        let upImage = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width / 100.0 * value2, height: view.frame.size.height))
        var color = ColorType
        if color > 5{
            color = 5
        }
        let upname = "progress_up\(color)"
        upImage.image = UIImage(named: upname)
        view.addSubview(upImage)
        return view;
    }
}

