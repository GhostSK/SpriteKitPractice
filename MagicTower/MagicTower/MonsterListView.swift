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
    
    public func calculateDamage(PlayerAttack:Int, PlayerDefence:Int){
        //model加载后要调用calculate方法计算伤害值
        let MonA = Int(self.attack!)
        let MonD = Int(self.defence!)
        let PlayA = PlayerAttack
        let PlayD = PlayerDefence
        if PlayA <= MonD! {
            
            self.damage =  "????"
            return
        }
        if PlayD >= MonA! {
            self.damage = "0"
            return
        }
        var a = 0
        repeat{
            a += 1
        }while (a * (PlayA - MonD!) < Int(self.health!)!)
        
        let b = a * (MonA! - PlayD)
        let bStr = "\(b)"
        self.damage = bStr
        return
    }
    init(HeadImage:UIImage, Name:String, Attack:Int, Defence:Int, Health:Int, Money:Int, Exper:Int) {
        super.init()
        self.headImage = HeadImage
        self.name = Name
        self.attack = "\(Attack)"
        self.defence = "\(Defence)"
        self.health = "\(Health)"
        self.money = "\(Money)"
        self.exper = "\(Exper)"
        let player = PlayerData.shareInstance()
        self.calculateDamage(PlayerAttack: player.attack, PlayerDefence: player.defence)
        
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
        let player = PlayerData.shareInstance()
        let a = player.attack
        let d = player.defence
        self.model?.calculateDamage(PlayerAttack: a, PlayerDefence: d)
        self.Damage.text = self.model?.damage
    }
    
}

class MonsterListView: UIView,UITableViewDelegate, UITableViewDataSource {
    var maintable: UITableView? = nil
    var DataArr:NSMutableArray? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //测试数据
        self.DataArr = NSMutableArray.init()
        let head = UIImage.init(named:"placeholder.jpg")
        let model1 = MonsterModel.init(HeadImage: head!, Name: "AAA", Attack:10, Defence: 10, Health: 100, Money: 5, Exper: 3)
        self.DataArr?.add(model1)
        let model2 = MonsterModel.init(HeadImage: head!, Name: "BBB", Attack: 12, Defence: 10, Health: 100, Money: 5, Exper: 5)
        self.DataArr?.add(model2)
        
        
        self.maintable = UITableView.init()
        self.maintable?.delegate = self
        self.maintable?.dataSource = self
        self.maintable?.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        self.maintable?.backgroundColor = SKColor.blue
        addSubview(self.maintable!)
        self.backgroundColor = SKColor.red
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //tableview相关代理
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.DataArr!.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.maintable?.dequeueReusableCell(withIdentifier: "MonsterListCell")
//        cell.model = self.DataArr?.object(at: indexPath.row) as? MonsterModel
        return cell!
        //swift 随机背景颜色
//        let cell = UITableViewCell()
//        let red = arc4random()%255
//        let reddouble:Float = Float(red) / 255.0
//        let blue = arc4random()%255
//        let bluedouble:Float = Float(blue) / 255.0
//        let green = arc4random()%255
//        let greenDouble = Float(green) / 255.0
//        let color = SKColor.init(colorLiteralRed: reddouble, green: greenDouble, blue: bluedouble, alpha: 1.0)
//        cell.backgroundColor = color
//        return cell
    }
    
}


