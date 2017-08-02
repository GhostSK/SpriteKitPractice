//
//  ShopTableView.swift
//  MagicTower
//
//  Created by 胡杨林 on 2017/7/10.
//  Copyright © 2017年 胡杨林. All rights reserved.
//

import UIKit
import SpriteKit

class ShopTableView: UIView,UITableViewDelegate,UITableViewDataSource {
    var ShopName:String = ""
    var DataArr:NSMutableArray = NSMutableArray.init()
    var tableview:UITableView = UITableView.init()
    class func buildView(NodeName:String, isMoneyShop:Bool)->UIView{
        let view = ShopTableView.init(frame: CGRect(x: 31, y: 31, width: 352, height: 352))
        view.backgroundColor = UIColor.white
        //本方法用来构建实例，但是不负责添加到view，view由调用方进行添加，方法内仅实现初始化以及数据配置功能
        view.tableview.delegate = view
        view.tableview.dataSource = view
        view.ShopName = NodeName
        view.tag = 10000
        view.tableview.delegate = view
        view.tableview.dataSource = view
        view.tableview.frame = CGRect(x: 0, y: 52, width: 352, height: 300)
        view.addSubview(view.tableview)
        view.isUserInteractionEnabled = true
        let title = UILabel.init(frame: CGRect(x: 20, y: 5, width: 300, height: 35))
        title.numberOfLines = 2
        title.text = "马化腾爸爸说过，在提出问题之前，先想想自己冲够了钱么？"
        title.sizeToFit()
        view.addSubview(title)
        
        return view
    }
    
    //MARK: tableview代理
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init()
        let label = UILabel.init(frame: CGRect(x: 20, y: 20, width: 300, height: 30))
        cell.contentView.addSubview(label)
        cell.backgroundColor = UIColor(colorLiteralRed: 249.0/255, green: 219.0/255, blue: 222.0/255, alpha: 1.0)
        switch indexPath.row {
        case 0:
            if self.ShopName == "Floor3Shop" {
                label.text = "使用25金钱提升4点攻击力"
            }else if self.ShopName == "Floor5Shop"{
                label.text = "使用30经验提升5点攻击力"
            }
            break
        case 1:
            if self.ShopName == "Floor3Shop" {
                label.text = "使用25金钱提升4点防御力力"
            }else if self.ShopName == "Floor5Shop"{
                label.text = "使用30经验提升5点防御力力"
            }
            break
        case 2:
            if self.ShopName == "Floor3Shop" {
                label.text = "使用25金钱提升800血量"
            }else if self.ShopName == "Floor5Shop"{
                label.text = "使用100经验提升1个等级"
            }
            break
        default:
            label.text = "离开商店"
            break
        }
        
        
        cell.selectionStyle = .none
        return cell
    }
    func loadData(NodeName:String){
        if NodeName == "Floor3Shop" {
            // 3楼金钱商店 25金800血 25金4攻击 25金4防御 退出
            
            
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let player = Player.shareInstance()
        switch indexPath.row {
        case 0:
            if self.ShopName == "Floor3Shop" {
                if player.money >= 25 {
                    player.money -= 25
                    player.attack += 4
                    let view = refuseView.init(text: "攻击力提升了四点！")
                    self.addSubview(view)
                }else{
                    let view = refuseView.init(text: "金钱不足")
                    let vc = UIApplication.shared.keyWindow?.rootViewController
                    vc?.view.addSubview(view)
                }
            }else if self.ShopName == "Floor5Shop" {
                if player.experience >= 30 {
                    player.experience -= 30
                    player.attack += 5
                }else{
                    let view = refuseView.init(text: "经验不足")
                    let vc = UIApplication.shared.keyWindow?.rootViewController
                    vc?.view.addSubview(view)
                }
            }
            break
        case 1:
            if self.ShopName == "Floor3Shop" {
                if player.money >= 25 {
                    player.money -= 25
                    player.defence += 4
                    let view = refuseView.init(text: "防御力提升了四点！")
                    self.addSubview(view)
                }else{
                    let view = refuseView.init(text: "金钱不足")
                    let vc = UIApplication.shared.keyWindow?.rootViewController
                    vc?.view.addSubview(view)
                }
            }else if self.ShopName == "Floor5Shop" {
                if player.experience >= 30 {
                    player.experience -= 30
                    player.defence += 5
                }else{
                    let view = refuseView.init(text: "经验不足")
                    let vc = UIApplication.shared.keyWindow?.rootViewController
                    vc?.view.addSubview(view)
                }
            }
            break
        case 2:
            if self.ShopName == "Floor3Shop" {
                if player.money >= 25 {
                    player.money -= 25
                    player.health += 800
                    let view = refuseView.init(text: "血量提升了八百点！")
                    self.addSubview(view)
                }else{
                    let view = refuseView.init(text: "金钱不足")
                    let vc = UIApplication.shared.keyWindow?.rootViewController
                    vc?.view.addSubview(view)
                }
            }else if self.ShopName == "Floor5Shop" {
                if player.experience >= 100 {
                    player.experience -= 100
                    player.attack += 7
                    player.defence += 7
                    player.health += 1000
                    player.level += 1
                }else{
                    let view = refuseView.init(text: "经验不足")
                    let vc = UIApplication.shared.keyWindow?.rootViewController
                    vc?.view.addSubview(view)
                }
            }
            break


            
        default:
//            let vc = UIApplication.shared.keyWindow?.rootViewController
//            let view = vc?.view.viewWithTag(10000)
//            view?.removeFromSuperview()
            self.removeFromSuperview()
            break
        }
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}





