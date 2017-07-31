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

    var DataArr:NSMutableArray = NSMutableArray.init()
    var tableview:UITableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: 352, height: 352))
    class func buildView(NodeName:String, isMoneyShop:Bool)->UIView{
        let view = ShopTableView.init(frame: CGRect(x: 31, y: 31, width: 352, height: 352))
        view.backgroundColor = UIColor.white
        //本方法用来构建实例，但是不负责添加到view，view由调用方进行添加，方法内仅实现初始化以及数据配置功能
        view.tableview.delegate = view
        view.tableview.dataSource = view
        
        
        
        
        
        
        
        
        return view
    }
    
    //MARK: tableview代理
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init()
        return cell
    }
    func loadData(NodeName:String){
        if NodeName == "Floor3Shop" {
            // 3楼金钱商店 25金800血 25金4攻击 25金4防御，100金升级 退出
            
        }
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
