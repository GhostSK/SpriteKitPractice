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
    var dataArr:NSMutableArray = NSMutableArray.init()
    var Title:UILabel? = nil
    var scrollView:UIScrollView? = nil
    let LineArr:NSMutableArray = NSMutableArray.init()
    let IconArr:NSMutableArray = NSMutableArray.init()
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
    
    class func buildTechView(type:MenuType) -> TechViews {
        let view = TechViews.init(frame: CGRect.zero)
        view.Title?.text = type.rawValue
        view.dataArr = FoodDatabase.ShareInstance().getData(type: type)
        view.loadData()
        return view
    }
    
    func buildtestData(){
        for i in 0...9 {
            let testModel = baseMenu.init()
            testModel.Name = "担担面"
            testModel.Picture = UIImage(named: "Foodtest01")
            if i < 3 {
                testModel.canBeunlock = true
            }
            self.dataArr.add(testModel)
        }
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
    }

    func loadData(){
        
        let item0 = TechItem.init(frame: CGRect(x: self.frame.width / 6 - 40, y: 50, width: 80, height: 75), Menu: self.dataArr[0] as! baseMenu)
        item0.Itemdelegate = self
        self.scrollView!.addSubview(item0)
        self.IconArr.add(item0)
        let item1 = TechItem.init(frame: CGRect(x: self.frame.width / 2 - 40, y: 50, width: 80, height: 75), Menu: self.dataArr[1] as! baseMenu)
        item1.Itemdelegate = self
        self.scrollView!.addSubview(item1)
        self.IconArr.add(item1)
        let item2 = TechItem.init(frame: CGRect(x: self.frame.width / 6 * 5 - 40, y: 50, width: 80, height: 75), Menu: self.dataArr[2] as! baseMenu)
        item2.Itemdelegate = self
        self.scrollView!.addSubview(item2)
        self.IconArr.add(item2)
        let item3 = TechItem.init(frame: CGRect(x: self.frame.width / 6 - 40, y: 175, width: 80, height: 75), Menu: self.dataArr[3] as! baseMenu)
        item3.Itemdelegate = self
        self.scrollView!.addSubview(item3)
        self.IconArr.add(item3)
        let item4 = TechItem.init(frame: CGRect(x: self.frame.width / 2 - 40, y: 175, width: 80, height: 75), Menu: self.dataArr[4] as! baseMenu)
        item4.Itemdelegate = self
        self.scrollView!.addSubview(item4)
        self.IconArr.add(item4)
        let item5 = TechItem.init(frame: CGRect(x: self.frame.width / 6 * 5 - 40, y: 175, width: 80, height: 75), Menu: self.dataArr[5] as! baseMenu)
        item5.Itemdelegate = self
        self.scrollView!.addSubview(item5)
        self.IconArr.add(item5)
        let item6 = TechItem.init(frame: CGRect(x: self.frame.width / 3 - 40, y: 330, width: 80, height: 75), Menu: self.dataArr[6] as! baseMenu)
        item6.Itemdelegate = self
        self.scrollView!.addSubview(item6)
        self.IconArr.add(item6)
        let item7 = TechItem.init(frame: CGRect(x: self.frame.width / 3 * 2 - 40, y: 330, width: 80, height: 75), Menu: self.dataArr[7] as! baseMenu)
        item7.Itemdelegate = self
        self.scrollView!.addSubview(item7)
        self.IconArr.add(item7)
        let item8 = TechItem.init(frame: CGRect(x: self.frame.width / 2 - 40, y: 485, width: 80, height: 75), Menu: self.dataArr[8] as! baseMenu)
        item8.Itemdelegate = self
        self.scrollView!.addSubview(item8)
        self.IconArr.add(item8)
        let item9 = TechItem.init(frame: CGRect(x: self.frame.width / 2 - 40, y: 620, width: 80, height: 75), Menu: self.dataArr[9] as! baseMenu)
        item9.Itemdelegate = self
        self.scrollView!.addSubview(item9)
        self.IconArr.add(item9)
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
    
    @objc func DismissView() {
        self.removeFromSuperview()
    }
    
    func refreshView() {
        //逻辑判断线条颜色

        let Item0 = self.IconArr[0] as! TechItem
        if Item0.model?.isLock == false {
            let Line0 = self.LineArr[0] as! CAShapeLayer
            Line0.fillColor = UIColor.white.cgColor
            let Item = self.IconArr[3] as! TechItem
            Item.model?.canBeunlock = true
        }
        let Item1 = self.IconArr[1] as! TechItem
        if Item1.model?.isLock == false {
            let Line1 = self.LineArr[1] as! CAShapeLayer
            Line1.fillColor = UIColor.white.cgColor
            let Item = self.IconArr[4] as! TechItem
            Item.model?.canBeunlock = true
        }
        let Item2 = self.IconArr[2] as! TechItem
        if Item2.model?.isLock == false {
            let Line2 = self.LineArr[2] as! CAShapeLayer
            Line2.fillColor = UIColor.white.cgColor
            let Item = self.IconArr[5] as! TechItem
            Item.model?.canBeunlock = true
        }
        let Item3 = self.IconArr[3] as! TechItem
        if Item3.model?.isLock == false {
            let Line3 = self.LineArr[3] as! CAShapeLayer
            Line3.fillColor = UIColor.white.cgColor
            let Item4 = self.IconArr[4] as! TechItem
            if Item4.model?.isLock == false {
                let Line8 = self.LineArr[8] as! CAShapeLayer
                Line8.fillColor = UIColor.white.cgColor
                let Item = self.IconArr[6] as! TechItem
                Item.model?.canBeunlock = true
            }
        }
        let Item4 = self.IconArr[4] as! TechItem
        if Item4.model?.isLock == false {
            let Line4 = self.LineArr[4] as! CAShapeLayer
            Line4.fillColor = UIColor.white.cgColor
            let Line6 = self.LineArr[6] as! CAShapeLayer
            Line6.fillColor = UIColor.white.cgColor
            let Line7 = self.LineArr[7] as! CAShapeLayer
            Line7.fillColor = UIColor.white.cgColor
            let Item3 = self.IconArr[3] as! TechItem
            if Item3.model?.isLock == false {
                let Line8 = self.LineArr[8] as! CAShapeLayer
                Line8.fillColor = UIColor.white.cgColor
                let Item = self.IconArr[6] as! TechItem
                Item.model?.canBeunlock = true
            }
            let Item5 = self.IconArr[5] as! TechItem
            if Item5.model?.isLock == false{
                let Line9 = self.LineArr[9] as! CAShapeLayer
                Line9.fillColor = UIColor.white.cgColor
                let Item = self.IconArr[7] as! TechItem
                Item.model?.canBeunlock = true
            }
        }
        let Item5 = self.IconArr[5] as! TechItem
        if Item5.model?.isLock == false {
            let Line5 = self.LineArr[5] as! CAShapeLayer
            Line5.fillColor = UIColor.white.cgColor
            let Item4 = self.IconArr[4] as! TechItem
            if Item4.model?.isLock == false {
                let Line9 = self.LineArr[9] as! CAShapeLayer
                Line9.fillColor = UIColor.white.cgColor
                let Item = self.IconArr[7] as! TechItem
                Item.model?.canBeunlock = true
            }
        }
        let Item6 = self.IconArr[6] as! TechItem
        if Item6.model?.isLock == false {
            let Line10 = self.LineArr[10] as! CAShapeLayer
            Line10.fillColor = UIColor.white.cgColor
            let Item7 = self.IconArr[7] as! TechItem
            if Item7.model?.isLock == false {
                let Line12 = self.LineArr[12] as! CAShapeLayer
                Line12.fillColor = UIColor.white.cgColor
                let Item = self.IconArr[8] as! TechItem
                Item.model?.canBeunlock = true
            }
        }
        let Item7 = self.IconArr[7] as! TechItem
        if  Item7.model?.isLock == false {
            let Line11 = self.LineArr[11] as! CAShapeLayer
            Line11.fillColor = UIColor.white.cgColor
            let Item6 = self.IconArr[6] as! TechItem
            if Item6.model?.isLock == false{
                let Line12 = self.LineArr[12] as! CAShapeLayer
                Line12.fillColor = UIColor.white.cgColor
                let Item = self.IconArr[8] as! TechItem
                Item.model?.canBeunlock = true
            }
        }
        let Item8 = self.IconArr[8] as! TechItem
        if  Item8.model?.isLock == false {
            let Line13 = self.LineArr[13] as! CAShapeLayer
            Line13.fillColor = UIColor.white.cgColor
            let Item9 = self.IconArr[9] as! TechItem
            Item9.model?.canBeunlock = true
        }
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
        self.backgroundColor = UIColor.clear
        self.model = Menu
        self.Picture = UIImageView(frame: CGRect(x: (frame.size.width - 55) / 2, y: 0, width: 55, height: 55))
        self.Picture!.image = self.model?.Picture
        self.addSubview(Picture!)
        self.NameLabel = UILabel.init(frame: CGRect(x: 0, y: 55, width: 80, height: 20))
        NameLabel!.textAlignment = .center
        NameLabel?.backgroundColor = UIColor.white
        NameLabel!.text = self.model?.Name
        NameLabel?.adjustsFontSizeToFitWidth = true
        self.addSubview(NameLabel!)
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(setLocked))
        self.addGestureRecognizer(tap)
        self.lockView = UIView(frame: CGRect(x: (frame.size.width - 55) / 2, y: 0, width: 55, height: 55))
        let backColor = UIColor.init(red: 45.0/255, green: 45.0/255, blue: 45.0/255, alpha: 0.5)
        self.lockView?.backgroundColor = backColor
        let lock = UIImageView(frame: CGRect(x: 0, y: 0, width: 55, height: 55))
        lock.image = UIImage(named: "FoodLock")
        self.lockView?.addSubview(lock)
        if Menu.isLock {
            self.addSubview(self.lockView!)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func setLocked() {
        if self.model?.isLock == true && self.model?.canBeunlock == true {
            if self.lockView != nil {
                self.model?.isLock = false
                self.lockView?.removeFromSuperview()
                self.Itemdelegate?.refreshView()
            }
        }
    }
    
}
protocol refreshTechViewDelegate : class {

    func refreshView()
}

