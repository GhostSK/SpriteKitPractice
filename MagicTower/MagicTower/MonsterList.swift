//
//  MonsterList.swift
//  Magictower
//
//  Created by 胡杨林 on 17/4/7.
//  Copyright © 2017年 胡杨林. All rights reserved.
//

import Foundation
import UIKit

class MonsterList: UIView, UITableViewDelegate, UITableViewDataSource {
    
    var dataArr:NSMutableArray? = nil
    
    
    init(Frame:CGRect, InfoList:[MonsterInfoModel] ) {
        super.init(frame: Frame)
        let tableview = UITableView(frame: CGRect(x: 5, y: 5, width: Frame.width - 10, height: Frame.height - 10))
        tableview.delegate = self as UITableViewDelegate
        tableview.dataSource = self as UITableViewDataSource
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func ShowMostersInfo(List:[MonsterInfoModel]) {
        
        let backview = UIView(frame: CGRect(x: 20, y: 20, width: (self.superview?.frame.width)! - 40, height: (self.superview?.frame.height)! - 40))
        backview.backgroundColor = UIColor.blue
        addSubview(backview)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.dataArr != nil {
            return (self.dataArr?.count)!
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init()
        return cell
    }
}
