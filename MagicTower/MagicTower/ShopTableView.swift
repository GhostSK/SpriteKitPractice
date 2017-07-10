//
//  ShopTableView.swift
//  MagicTower
//
//  Created by 胡杨林 on 2017/7/10.
//  Copyright © 2017年 胡杨林. All rights reserved.
//

import UIKit
import SpriteKit

class ShopTableView: UIView {

    class func showView(){
        let view = UIView.init(frame: CGRect(x: 31, y: 31, width: 352, height: 352))
        view.backgroundColor = UIColor.purple
        let vc = UIApplication.shared.keyWindow?.rootViewController
        vc?.view.addSubview(view)
    }

}
