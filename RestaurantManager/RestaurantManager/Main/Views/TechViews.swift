//
//  TechViews.swift
//  RestaurantManager
//
//  Created by 胡杨林 on 2017/9/20.
//  Copyright © 2017年 胡杨林. All rights reserved.
//

import UIKit
//import ARKit

class TechViews: UIView, refreshTechViewDelegate {
    
    var kwidth = UIScreen.main.bounds.size.width
    var kheight = UIScreen.main.bounds.size.height
    let dataArr:NSMutableArray = NSMutableArray.init()
    var Title:UILabel? = nil
    var scrollView:UIScrollView? = nil
    let LineArr:NSMutableArray = NSMutableArray.init()
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
        self.scrollView?.contentSize = CGSize(width: self.frame.width, height: 700)
        self.scrollView?.backgroundColor = UIColor.clear
        addSubview(self.scrollView!)
        self.buildtestData()
        self.loadData()
    }
    
    func buildtestData(){
        for _ in 0...9 {
            let testModel = baseMenu.init()
            testModel.Name = "担担面"
            testModel.Picture = UIImage(named: "Foodtest01")
            self.dataArr.add(testModel)
        }
    }
    

    func loadData(){
        
        let item0 = TechItem.init(frame: CGRect(x: self.frame.width / 6 - 27.5, y: 50, width: 55, height: 75), Menu: self.dataArr[0] as! baseMenu)
        item0.Itemdelegate = self
        self.scrollView!.addSubview(item0)
        let item1 = TechItem.init(frame: CGRect(x: self.frame.width / 2 - 27.5, y: 50, width: 55, height: 75), Menu: self.dataArr[1] as! baseMenu)
        item1.Itemdelegate = self
        self.scrollView!.addSubview(item1)
        let item2 = TechItem.init(frame: CGRect(x: self.frame.width / 6 * 5 - 27.5, y: 50, width: 55, height: 75), Menu: self.dataArr[2] as! baseMenu)
        item2.Itemdelegate = self
        self.scrollView!.addSubview(item2)
        let item3 = TechItem.init(frame: CGRect(x: self.frame.width / 6 - 27.5, y: 175, width: 55, height: 75), Menu: self.dataArr[3] as! baseMenu)
        item3.Itemdelegate = self
        self.scrollView!.addSubview(item3)
        let item4 = TechItem.init(frame: CGRect(x: self.frame.width / 2 - 27.5, y: 175, width: 55, height: 75), Menu: self.dataArr[4] as! baseMenu)
        item4.Itemdelegate = self
        self.scrollView!.addSubview(item4)
        let item5 = TechItem.init(frame: CGRect(x: self.frame.width / 6 * 5 - 27.5, y: 175, width: 55, height: 75), Menu: self.dataArr[5] as! baseMenu)
        item5.Itemdelegate = self
        self.scrollView!.addSubview(item5)
        let item6 = TechItem.init(frame: CGRect(x: self.frame.width / 3 - 27.5, y: 330, width: 55, height: 75), Menu: self.dataArr[6] as! baseMenu)
        item6.Itemdelegate = self
        self.scrollView!.addSubview(item6)
        let item7 = TechItem.init(frame: CGRect(x: self.frame.width / 3 * 2 - 27.5, y: 330, width: 55, height: 75), Menu: self.dataArr[7] as! baseMenu)
        item7.Itemdelegate = self
        self.scrollView!.addSubview(item7)
        let item8 = TechItem.init(frame: CGRect(x: self.frame.width / 2 - 27.5, y: 485, width: 55, height: 75), Menu: self.dataArr[8] as! baseMenu)
        item8.Itemdelegate = self
        self.scrollView!.addSubview(item8)
        let item9 = TechItem.init(frame: CGRect(x: self.frame.width / 2 - 27.5, y: 620, width: 55, height: 75), Menu: self.dataArr[9] as! baseMenu)
        item9.Itemdelegate = self
        self.scrollView!.addSubview(item9)
        self.setLines()
    }
    func setLines(){
        
        /*  //线段结构图
         口          口           口
         0           1            2
         口          口           口
         3           4            5
         3  3  3   6    7   5  5  5
                8           9
               口           口
               10           11
               10  10   11  11
                      12
                      口
                      13
                      口 */
        
        let L0path = UIBezierPath.init(rect: CGRect(x: self.frame.width / 6 - 3, y: 125, width: 6, height: 50))
        let L0 = CAShapeLayer.init()
        L0.path = L0path.cgPath
        L0.fillColor = UIColor.lightGray.cgColor
        self.scrollView?.layer.addSublayer(L0)
        self.LineArr.add(L0)
        
        let L1path = UIBezierPath.init(rect: CGRect(x: self.frame.width / 2 - 3, y: 125, width: 6, height: 50))
        let L1 = CAShapeLayer.init()
        L1.path = L1path.cgPath
        L1.fillColor = UIColor.lightGray.cgColor
        self.scrollView?.layer.addSublayer(L1)
        self.LineArr.add(L1)
        
        let L2path = UIBezierPath.init(rect: CGRect(x: self.frame.width / 6 * 5 - 3, y: 125, width: 6, height: 50))
        let L2 = CAShapeLayer.init()
        L2.path = L2path.cgPath
        L2.fillColor = UIColor.lightGray.cgColor
        self.scrollView?.layer.addSublayer(L2)
        self.LineArr.add(L2)
        
        let L3path = UIBezierPath.init()
        L3path.move(to: CGPoint(x: self.frame.width / 6 - 3, y: 250))
        L3path.addLine(to: CGPoint(x: self.frame.width / 6 - 3, y: 290 + 3))
        L3path.addLine(to: CGPoint(x: self.frame.width / 3 + 3, y: 290 + 3))
        L3path.addLine(to: CGPoint(x: self.frame.width / 3 + 3, y: 290 - 3))
        L3path.addLine(to: CGPoint(x: self.frame.width / 6 + 3, y: 290 - 3))
        L3path.addLine(to: CGPoint(x: self.frame.width / 6 + 3, y: 250))
        L3path.addLine(to: CGPoint(x: self.frame.width / 6 - 3, y: 250))
        L3path.stroke()
        let L3 = CAShapeLayer.init()
        L3.path = L3path.cgPath
        L3.fillColor = UIColor.lightGray.cgColor
        self.scrollView?.layer.addSublayer(L3)
        self.LineArr.add(L3)
        
        let L4path = UIBezierPath.init()
        L4path.move(to: CGPoint(x: self.frame.width / 2 - 3, y: 250))
        L4path.addLine(to: CGPoint(x: self.frame.width / 2 - 3, y: 290 + 3))
        L4path.addLine(to: CGPoint(x: self.frame.width / 2 + 3, y: 290 + 3))
        L4path.addLine(to: CGPoint(x: self.frame.width / 2 + 3, y: 250))
        L4path.addLine(to: CGPoint(x: self.frame.width / 2 - 3, y: 250))
        L4path.stroke()
        let L4 = CAShapeLayer.init()
        L4.path = L4path.cgPath
        L4.fillColor = UIColor.lightGray.cgColor
        self.scrollView?.layer.addSublayer(L4)
        self.LineArr.add(L4)
        
        let L5path = UIBezierPath.init()
        L5path.move(to: CGPoint(x: self.frame.width / 6 * 5 - 3, y: 250))
        L5path.addLine(to: CGPoint(x: self.frame.width / 6 * 5 - 3, y: 290 - 3))
        L5path.addLine(to: CGPoint(x: self.frame.width / 3 * 2 - 3, y: 290 - 3))
        L5path.addLine(to: CGPoint(x: self.frame.width / 3 * 2 - 3, y: 290 + 3))
        L5path.addLine(to: CGPoint(x: self.frame.width / 6 * 5 + 3, y: 290 + 3))
        L5path.addLine(to: CGPoint(x: self.frame.width / 6 * 5 + 3, y: 250))
        L5path.addLine(to: CGPoint(x: self.frame.width / 6 * 5 - 3, y: 250))
        L5path.stroke()
        let L5 = CAShapeLayer.init()
        L5.path = L5path.cgPath
        L5.fillColor = UIColor.lightGray.cgColor
        self.scrollView?.layer.addSublayer(L5)
        self.LineArr.add(L5)
        
        let L6path = UIBezierPath.init(rect: CGRect(x: self.frame.width / 3 - 3, y: 290 - 3, width: self.frame.width / 6 + 6, height: 6))
        let L6 = CAShapeLayer.init()
        L6.path = L6path.cgPath
        L6.fillColor = UIColor.lightGray.cgColor
        self.scrollView?.layer.addSublayer(L6)
        self.LineArr.add(L6)
        
        let L7path = UIBezierPath.init(rect: CGRect(x: self.frame.width / 2 - 3, y: 290 - 3, width: self.frame.width / 6 + 6, height: 6))
        let L7 = CAShapeLayer.init()
        L7.path = L7path.cgPath
        L7.fillColor = UIColor.lightGray.cgColor
        self.scrollView?.layer.addSublayer(L7)
        self.LineArr.add(L7)
        
        let L8path = UIBezierPath.init(rect: CGRect(x: self.frame.width / 3 - 3, y: 290 + 3, width: 6, height: 37))
        let L8 = CAShapeLayer.init()
        L8.path = L8path.cgPath
        L8.fillColor = UIColor.lightGray.cgColor
        self.scrollView?.layer.addSublayer(L8)
        self.LineArr.add(L8)
        
        let L9path = UIBezierPath.init(rect: CGRect(x: self.frame.width / 3 * 2 - 3, y: 290 + 3, width: 6, height: 37))
        let L9 = CAShapeLayer.init()
        L9.path = L9path.cgPath
        L9.fillColor = UIColor.lightGray.cgColor
        self.scrollView?.layer.addSublayer(L9)
        self.LineArr.add(L9)
        
        let L10path = UIBezierPath.init()
        L10path.move(to: CGPoint(x: self.frame.width / 3 - 3, y: 405))
        L10path.addLine(to: CGPoint(x: self.frame.width / 3 - 3, y: 445 + 3))
        L10path.addLine(to: CGPoint(x: self.frame.width / 2 - 3, y: 445 + 3))
        L10path.addLine(to: CGPoint(x: self.frame.width / 2 - 3, y: 445 - 3))
        L10path.addLine(to: CGPoint(x: self.frame.width / 3 + 3, y: 445 - 3))
        L10path.addLine(to: CGPoint(x: self.frame.width / 3 + 3, y: 405))
        L10path.addLine(to: CGPoint(x: self.frame.width / 3 - 3, y: 405))
        L10path.stroke()
        let L10 = CAShapeLayer.init()
        L10.path = L10path.cgPath
        L10.fillColor = UIColor.lightGray.cgColor
        self.scrollView?.layer.addSublayer(L10)
        self.LineArr.add(L10)
        
        let L11path = UIBezierPath.init()
        L11path.move(to: CGPoint(x: self.frame.width / 3 * 2 - 3, y: 405))
        L11path.addLine(to: CGPoint(x: self.frame.width / 3 * 2 - 3, y: 445 - 3))
        L11path.addLine(to: CGPoint(x: self.frame.width / 2 + 3, y: 445 - 3))
        L11path.addLine(to: CGPoint(x: self.frame.width / 2 + 3, y: 445 + 3))
        L11path.addLine(to: CGPoint(x: self.frame.width / 3 * 2 + 3, y: 445 + 3))
        L11path.addLine(to: CGPoint(x: self.frame.width / 3 * 2 + 3, y: 405))
        L11path.addLine(to: CGPoint(x: self.frame.width / 3 * 2 - 3, y: 405))
        L11path.stroke()
        let L11 = CAShapeLayer.init()
        L11.path = L11path.cgPath
        L11.fillColor = UIColor.lightGray.cgColor
        self.scrollView?.layer.addSublayer(L11)
        self.LineArr.add(L11)
        
        let L12path = UIBezierPath.init(rect: CGRect(x: self.frame.width / 2 - 3, y: 445 - 3, width: 6, height: 40 + 3))
        let L12 = CAShapeLayer.init()
        L12.path = L12path.cgPath
        L12.fillColor = UIColor.lightGray.cgColor
        self.scrollView?.layer.addSublayer(L12)
        self.LineArr.add(L12)
        
        let L13path = UIBezierPath.init(rect: CGRect(x: self.frame.width / 2 - 3, y: 560, width: 6, height: 60))
        let L13 = CAShapeLayer.init()
        L13.path = L13path.cgPath
        L13.fillColor = UIColor.lightGray.cgColor
        self.scrollView?.layer.addSublayer(L13)
        self.LineArr.add(L13)
        
    }
    
    func DismissView() {
        self.removeFromSuperview()
    }
    
    func refreshView() {
        //逻辑判断线条颜色
    }
    
}


class TechItem: UIView {
    
    var model:baseMenu? = nil
    var lockView:UIView? = nil
    var Picture:UIImageView? = nil
    var NameLabel:UILabel? = nil
    weak var Itemdelegate:refreshTechViewDelegate?
    init(frame:CGRect, Menu:baseMenu) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.model = Menu
        self.Picture = UIImageView(frame: CGRect(x: 0, y: 0, width: 55, height: 55))
        self.Picture!.image = self.model?.Picture
        self.addSubview(Picture!)
        self.NameLabel = UILabel.init(frame: CGRect(x: 0, y: 55, width: 55, height: 20))
        NameLabel!.textAlignment = .center
        NameLabel!.text = self.model?.Name
        NameLabel?.adjustsFontSizeToFitWidth = true
        self.addSubview(NameLabel!)
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(setLocked))
        self.addGestureRecognizer(tap)
        self.lockView = UIView(frame: CGRect(x: 0, y: 0, width: 55, height: 55))
        self.lockView?.backgroundColor = UIColor.init(colorLiteralRed: 45.0/255, green: 45.0/255, blue: 45.0/255, alpha: 0.65)
        let lock = UIImageView(frame: self.lockView!.frame)
        lock.image = UIImage(named: "FoodLock")
        self.lockView?.addSubview(lock)
        self.addSubview(self.lockView!)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLocked() {
        if self.model?.isLock == false {
            if self.lockView != nil {
                self.lockView?.removeFromSuperview()
            }
        }
    }
    
}
protocol refreshTechViewDelegate : class {
    
    func refreshView()
}

