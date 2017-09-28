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
    
}
