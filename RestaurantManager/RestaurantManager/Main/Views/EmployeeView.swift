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
        let view = employeeViewInMarket.init(frame: CGRect(x: PositionPoint.x, y: PositionPoint.y, width: 200, height: 300))
        let headImageView = UIImageView.init(frame: CGRect(x: 15, y: 15, width: 60, height:80))
        headImageView.image = UIImage(named: "443png")
        view.addSubview(headImageView)
        
        
        
        return view
    }
    
    
}
