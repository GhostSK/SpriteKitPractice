//
//  MonsterListView.swift
//  MagicTower
//
//  Created by 胡杨林 on 2017/4/28.
//  Copyright © 2017年 胡杨林. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit


class MonsterModel: NSObject {
    var headImage:UIImage? = nil
    var name:String? = ""
    var attack:String? = ""
    var defence:String? = ""
    var health:String? = ""
    var money:String? = ""
    var exper:String? = ""
    var damage:String? = ""
    
    public func calculateDamage(PlayerAttack:String, PlayerDefence:String){
        //model加载后要调用calculate方法计算伤害值
        let MonA = Int(self.attack!)
        let MonD = Int(self.defence!)
        let PlayA = Int(PlayerAttack)
        let PlayD = Int(PlayerDefence)
        if PlayA! <= MonD! {
            
            self.damage =  "????"
        }
        if PlayD! >= MonA! {
            self.damage = "0"
        }
        var a = 0
        repeat{
            a += 1
        }while (a * (PlayA! - MonD!) < Int(self.health!)!)
        
        let b = a * (MonA! - PlayD!)
        let bStr = "\(b)"
        self.damage = bStr
    }
    
    
    
}

class MonsterListCell: UITableViewCell {
    
    public var model:MonsterModel? = nil
    
    @IBOutlet weak var HeadImage: UIImageView!
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Attack: UILabel!
    @IBOutlet weak var Defence: UILabel!
    @IBOutlet weak var Health: UILabel!
    @IBOutlet weak var Money: UILabel!
    @IBOutlet weak var Experience: UILabel!
    @IBOutlet weak var Damage: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.HeadImage.image = self.model?.headImage
        self.Attack.text = self.model?.attack
        self.Defence.text = self.model?.defence
        self.Health.text = self.model?.health
        self.Money.text = self.model?.money
        self.Experience.text = self.model?.exper
//        self.model?.calculateDamage(PlayerAttack: <#T##String#>, PlayerDefence: <#T##String#>)
        self.Damage.text = self.model?.damage
    }
    
}

class MonsterListView: UIView,UITableViewDelegate, UITableViewDataSource {
    var maintable: UITableView? = nil
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.maintable = UITableView.init()
        self.maintable?.delegate = self
        self.maintable?.dataSource = self
        self.maintable?.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        self.maintable?.backgroundColor = SKColor.blue
        addSubview(self.maintable!)
        self.backgroundColor = SKColor.yellow
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //tableview相关代理
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let red = arc4random()%255
        let reddouble:Float = Float(red) / 255.0
        let blue = arc4random()%255
        let bluedouble:Float = Float(blue) / 255.0
        let green = arc4random()%255
        let greenDouble = Float(green) / 255.0
        let color = SKColor.init(colorLiteralRed: reddouble, green: greenDouble, blue: bluedouble, alpha: 1.0)
        cell.backgroundColor = color
        return cell
    }
    
}


