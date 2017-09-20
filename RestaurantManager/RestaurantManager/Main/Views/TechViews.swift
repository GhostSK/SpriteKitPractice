//
//  TechViews.swift
//  RestaurantManager
//
//  Created by 胡杨林 on 2017/9/20.
//  Copyright © 2017年 胡杨林. All rights reserved.
//

import UIKit

class TechViews: UIView {
    
    var kwidth = UIScreen.main.bounds.size.width
    var kheight = UIScreen.main.bounds.size.height
    var dataArr:[baseMenu]? = nil
    var Title:UILabel? = nil
    var scrollView:UIScrollView? = nil
    
    override init(frame: CGRect) {
        if kheight < kwidth {
            let a = kheight
            kheight = kwidth
            kwidth = a
        }
        super.init(frame: CGRect(x: 10, y: 10, width: kheight - 20, height: kwidth - 20))
        self.backgroundColor = UIColor.white
        self.BuildUpUI()
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func BuildUpUI(){
        print("width = \(kwidth) height = \(kheight)")
        let backImage = UIImageView.init(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        backImage.image = UIImage(named: "TechBackImage")
        self.addSubview(backImage)
        let exitBtn = UIButton.init(frame: CGRect(x:self.frame.width - 35, y: 0, width: 35, height: 35))
        exitBtn.setImage(UIImage(named: "关闭.png"), for: .normal)
        exitBtn.setImage(UIImage(named: "关闭"), for: .selected)
        exitBtn.addTarget(self, action: #selector(DismissView), for: .touchUpInside)
        self.addSubview(exitBtn)
        let titleback = UIImageView(frame: CGRect(x: self.frame.width / 2 - 60, y: 2, width: 120, height: 30))
        titleback.image = UIImage(named: "TechView_TitleBackground")
        self.addSubview(titleback)
        let titleLabel = UILabel.init(frame: CGRect(x: 0, y: 2, width: 120, height: 26))
        titleLabel.textAlignment = .center
        titleLabel.text = "印度尼西亚菜"
        titleback.addSubview(titleLabel)
        self.Title = titleLabel
        self.scrollView = UIScrollView.init(frame: CGRect(x: 0, y: 30, width: self.frame.width, height: self.frame.height - 30))
        self.scrollView?.contentSize = CGSize(width: self.frame.width, height: 550)
        self.scrollView?.backgroundColor = UIColor.clear
        addSubview(self.scrollView!)
    }
    
    
    func DismissView() {
        self.removeFromSuperview()
    }
    
}


class TechItem: UIView {
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLocked(isLock:Bool) {
        if isLock {
            
        }
    }
}

