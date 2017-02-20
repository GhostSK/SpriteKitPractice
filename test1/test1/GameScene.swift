//
//  GameScene.swift
//  test1
//
//  Created by 胡杨林 on 17/2/15.
//  Copyright © 2017年 胡杨林. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var Arr1 :NSMutableArray = []
    var Arr2 :NSMutableArray = []
    var Arr3 :NSMutableArray = []
    var Arr4 :NSMutableArray = []
    var Arr5 :NSMutableArray = []
    var Arr6 :NSMutableArray = []
    var Arr7 :NSMutableArray = []
    var Arr8 :NSMutableArray = []
    var Arr9 :NSMutableArray = []
    var Arr0 :NSMutableArray = []
    var selected1 : SKSpriteNode? = nil
    var selected2 : SKSpriteNode? = nil
    let text1 :SKTexture = SKTexture(imageNamed: "text1")
    let text2 :SKTexture = SKTexture(imageNamed: "text2")
    let text3 :SKTexture = SKTexture(imageNamed: "text3")
    let text4 :SKTexture = SKTexture(imageNamed: "text4")
    let text5 :SKTexture = SKTexture(imageNamed: "text5")
    let text6 :SKTexture = SKTexture(imageNamed: "text6")
    let text7 :SKTexture = SKTexture(imageNamed: "text7")
    let text8 :SKTexture = SKTexture(imageNamed: "text8")
    var text1Num: Int = 0
    var text2Num: Int = 0
    var text3Num: Int = 0
    var text4Num: Int = 0
    var text5Num: Int = 0
    var text6Num: Int = 0
    var text7Num: Int = 0
    var text8Num: Int = 0
    var turnPoint1 :CGPoint? = nil
    var turnPoint2 :CGPoint? = nil
    
    override func didMove(to view: SKView) {
        
        
        for i in (0..<100) {
            let wid = 31
          let node = SKSpriteNode(color: SKColor.red, size: CGSize(width: wid, height: wid) )
            node.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            node.zPosition = 0.0
            var a = arc4random()%7 + 1
            if i >= 92 {
                /*最坏的情况，到第93个方块时（总数-纹理数量个方块）,所有类型的方块数量均为奇数（无法配对消除）
                这时开始依次对各个种类的方块数量进行判断，如果为奇数，定向补足为偶数，如果全部为偶数，则重新随机
                 因为最终总的数量为偶数个，所以第100个一定能补上最后一个奇数类
                 */
                if text1Num % 2 == 1 {
                    a = 1
                }else if text2Num % 2 == 1{
                    a = 2
                }else if text3Num % 2 == 1{
                    a = 3
                }else if text4Num % 2 == 1{
                    a = 4
                }else if text5Num % 2 == 1{
                    a = 5
                }else if text6Num % 2 == 1{
                    a = 6
                }else if text7Num % 2 == 1{
                    a = 7
                }else if text8Num % 2 == 1{
                    a = 8
                }else{
                    a = arc4random()%7 + 1
                }
            }
            switch a {
            case 1:
                node.texture = text1
                text1Num += 1
                break
            case 2:
                node.texture = text2
                text2Num += 1
                break
            case 3:
                node.texture = text3
                text3Num += 1
                break
            case 4:
                node.texture = text4
                text4Num += 1
                break
            case 5:
                node.texture = text5
                text5Num += 1
                break
            case 6:
                node.texture = text6
                text6Num += 1
                break
            case 7:
                node.texture = text7
                text7Num += 1
                break
            case 8:
                node.texture = text8
                text8Num += 1
                break
            default:
                break
            }
            let i10 :Int = i / 10
            let i1 :Int = i % 10
            let position = CGPoint(x: ((self.view?.frame.width)! - 310) / 2 + CGFloat(i10) * 31 + 15, y: CGFloat(i1) * 31 + 115)
            node.position = position
            node.name = String(format: "%d", i)
            addChild(node)
            switch i10 {
            case 0:
                Arr0.add(node)
                break
            case 1:
                Arr1.add(node)
                break
            case 2:
                Arr2.add(node)
                break
            case 3:
                Arr3.add(node)
                break
            case 4:
                Arr4.add(node)
                break
            case 5:
                Arr5.add(node)
                break
            case 6:
                Arr6.add(node)
                break
            case 7:
                Arr7.add(node)
                break
            case 8:
                Arr8.add(node)
                break
            default:
                Arr9.add(node)
                break
            }
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch : UITouch = (touches as NSSet).anyObject() as! UITouch
        let point = touch.location(in: self)
        let objectArr = self.nodes(at: point)
        if objectArr.count == 0 {
            return
        }
        let p1 = objectArr[0]
        let p :SKSpriteNode = p1 as! SKSpriteNode
        if selected1 == nil {
            selected1 = p
            selected1?.color = SKColor.red
            selected1?.colorBlendFactor = 0.4
        }else if selected1 == p{
            selected1?.color = SKColor.clear
            selected1?.colorBlendFactor = 0.0
            selected1 = nil
        }else{
            selected2 = p
            selected2?.color = SKColor.red
            selected2?.colorBlendFactor = 0.4
            if selected1?.texture == selected2?.texture { //首先你点的两个纹理要一样，否则直接取消两个选中
                if isLink() {  //然后如果纹理一样，调用isLink判断能否连接
                    //添加消除连线
                    //连线顺序点一-（转折点1）-（转折点2）-点二
                    //连线精灵的起点为起始点锚点-2 -2，终点为终点锚点+2 +2
                    var line1 : SKSpriteNode? = nil
                    var line2 : SKSpriteNode? = nil
                    var line3 : SKSpriteNode? = nil
                    if turnPoint1 == nil  {  //直线相连
                        let linePoint1 = CGPoint(x: (selected1?.position.x)! - 2, y: (selected1?.position.y)! - 2)
                        let linePoint2 = CGPoint(x: (selected2?.position.x)! - 2, y: (selected2?.position.y)! - 2)
                        let width = abs((selected2?.position.x)! - (selected1?.position.x)!) + 4
                        let height = abs((selected1?.position.y)! - (selected2?.position.y)!) + 4
                        line1 = SKSpriteNode(color: SKColor.init(colorLiteralRed: 0, green: 1, blue: 1, alpha: 1) , size: CGSize(width: width, height: height))
                        line1?.zPosition = +1.0
                        line1?.anchorPoint = CGPoint.zero
                        if (selected1?.position.x)! < (selected2?.position.x)! || (selected1?.position.y)! < (selected2?.position.y)! {
                            line1?.position = linePoint1
                        }else{
                            line1?.position = linePoint2
                        }
                        
                        addChild(line1!)
                        
                        
                    }else if turnPoint2 == nil{  //单折角连线
                        let line1Point1 = CGPoint(x: (selected1?.position.x)! - 2, y: (selected1?.position.y)! - 2)
                        let line1Point2 = CGPoint(x: (turnPoint1?.x)! - 2, y: (turnPoint1?.y)! - 2)
                        let line2Point2 = CGPoint(x: (selected2?.position.x)! - 2, y: (selected2?.position.y)! - 2)
                        let width1 = abs((turnPoint1?.x)! - (selected1?.position.x)!) + 4
                        let height1 = abs((turnPoint1?.y)! - (selected1?.position.y)!) + 4
                        line1 = SKSpriteNode(color: SKColor.init(colorLiteralRed: 0, green: 1, blue: 1, alpha: 1), size: CGSize(width: width1, height: height1))
                        line1?.anchorPoint = CGPoint.zero
                        if (selected1?.position.x)! < (turnPoint1?.x)! || (selected1?.position.y)! < (turnPoint1?.y)!  {
                            line1?.position = line1Point1
                        }else{
                            line1?.position = line1Point2
                        }
                        let width2 = abs((turnPoint1?.x)! - (selected2?.position.x)!) + 4
                        let height2 = abs((turnPoint1?.y)! - (selected2?.position.y)!) + 4
                        line2 = SKSpriteNode(color: SKColor.init(colorLiteralRed: 0, green: 1, blue: 1, alpha: 1), size: CGSize(width: width2, height: height2))
                        line2?.anchorPoint = CGPoint.zero
                        if (selected2?.position.x)! < (turnPoint1?.x)! || (selected2?.position.y)! < (turnPoint1?.y)!  {
                            line2?.position = line2Point2
                        }else{
                            line2?.position = line1Point2
                        }
                        addChild(line1!)
                        addChild(line2!)
                        
                        
                    }else{  //双折角连线
                        let line1Point1 = CGPoint(x: (selected1?.position.x)! - 2, y: (selected1?.position.y)! - 2)
                        let line1Point2 = CGPoint(x: (turnPoint1?.x)! - 2, y: (turnPoint1?.y)! - 2)
                        let line2Point1 = CGPoint(x: (turnPoint2?.x)! - 2, y: (turnPoint2?.y)! - 2)
                        let line2Point2 = CGPoint(x: (selected2?.position.x)! - 2, y: (selected2?.position.y)! - 2)
                        let width1 = abs((turnPoint1?.x)! - (selected1?.position.x)!) + 4
                        let height1 = abs((turnPoint1?.y)! - (selected1?.position.y)!) + 4
                        line1 = SKSpriteNode(color: SKColor.init(colorLiteralRed: 0, green: 1, blue: 1, alpha: 1), size: CGSize(width: width1, height: height1))
                        line1?.anchorPoint = CGPoint.zero
                        if (selected1?.position.x)! < (turnPoint1?.x)! || (selected1?.position.y)! < (turnPoint1?.y)!  {
                            line1?.position = line1Point1
                        }else{
                            line1?.position = line1Point2
                        }
                        let width2 = abs((turnPoint1?.x)! - (turnPoint2?.x)!) + 4
                        let height2 = abs((turnPoint1?.y)! - (turnPoint2?.y)!) + 4
                        line2 = SKSpriteNode(color: SKColor.init(colorLiteralRed: 0, green: 1, blue: 1, alpha: 1), size: CGSize(width: width2, height: height2))
                        line2?.anchorPoint = CGPoint.zero
                        if (turnPoint2?.x)! < (turnPoint1?.x)! || (turnPoint2?.y)! < (turnPoint1?.y)!  {
                            line2?.position = line2Point1
                        }else{
                            line2?.position = line1Point2
                        }
                        let width3 = abs((selected2?.position.x)! - (turnPoint2?.x)!) + 4
                        let height3 = abs((selected2?.position.y)! - (turnPoint2?.y)!) + 4
                        line3 = SKSpriteNode(color: SKColor.init(colorLiteralRed: 0, green: 1, blue: 1, alpha: 1), size: CGSize(width: width3, height: height3))
                        line3?.anchorPoint = CGPoint.zero
                        if (turnPoint2?.x)! < (selected2?.position.x)! || (turnPoint2?.y)! < (selected2?.position.y)! {
                            line3?.position = line2Point1
                        }else{
                            line3?.position = line2Point2
                        }
                        addChild(line1!)
                        addChild(line2!)
                        addChild(line3!)
                    }
                    turnPoint1 = nil
                    turnPoint2 = nil
                    //播放音乐,同时等待0.2s
                    let time02 : TimeInterval = 0.2
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time02, execute: {
                                            if line1 != nil {
                                                line1!.removeFromParent()
                                            }
                                            if line2 != nil{
                                                line2!.removeFromParent()
                                            }
                                            if line3 != nil{
                                                line3?.removeFromParent()
                                            }
                        
                        
                        
                        self.selected1!.removeFromParent()
                        self.selected1?.color = SKColor.clear
                        self.selected1?.colorBlendFactor = 0.0
                        self.selected1 = nil
                        self.selected2!.removeFromParent()
                        self.selected2?.color = SKColor.clear
                        self.selected2?.colorBlendFactor = 0.0
                        self.selected2 = nil
                        if self.children.count == 0 {
                            let label = SKLabelNode(text: "YOU WIN!")
                            label.position = CGPoint(x: 200, y: 400)
                            label.fontSize = 55
                            label.fontColor = SKColor.white
                            self.addChild(label)
                        }
                    })
                }else{ //不能连接则取消两个选择
                    selected1?.color = SKColor.clear
                    selected1?.colorBlendFactor = 0.0
                    selected2?.color = SKColor.clear
                    selected2?.colorBlendFactor = 0.0
                    selected1 = nil
                    selected2 = nil
                }
            }else{
                selected1?.color = SKColor.clear
                selected1?.colorBlendFactor = 0.0
                selected2?.color = SKColor.clear
                selected2?.colorBlendFactor = 0.0
                selected1 = nil
                selected2 = nil
            }
        }
        
        
        
    }
    func isLink() -> Bool {
        let name1 = selected1?.name
        let Point1x:Int = Int(name1!)! / 10 + 2 //第一个方块的横坐标
        let Point1y:Int = Int(name1!)! % 10 + 2 //第一个方块的纵坐标
        let Point1StartArrXLeft = NSMutableArray() //每一个元素做纵向拓展，最后一个例外，方块左侧
        let Point1StartArrXRight = NSMutableArray()  //每一个元素做纵向拓展，最后一个不拓展，方块右侧
        let Point1StartArrYUp = NSMutableArray()  //每一个元素做横向拓展，最后一个不拓展，方块上方
        let Point1StartArrYDown = NSMutableArray()  //每一个元素做横向拓展，最后一个不拓展，方块下方
        let Po1 = selected1?.position
        for i in 1...Point1x{ // 第一个点的左边
            let PointNow = CGPoint(x: (Po1?.x)! - CGFloat(i) * 31, y: (Po1?.y)!)
            let PointNowValue = NSValue.init(cgPoint: PointNow)
            Point1StartArrXLeft.add(PointNowValue)
            if nodes(at: PointNow).count > 0 { //如果撞到实体方块，该方块成为列表最后一个（不会拓展），结束循环
                //否则撞到外界第二层边界，不做拓展
                break
            }
        }
        for i in 1...13-Point1x {  //第一个点的右边
            let PointNow = CGPoint(x: (Po1?.x)! + CGFloat(i) * 31, y: (Po1?.y)!)
            let PointNowValue = NSValue.init(cgPoint: PointNow)
            Point1StartArrXRight.add(PointNowValue)
            if nodes(at: PointNow).count > 0 { //如果撞到实体方块，该方块成为列表最后一个（不会拓展），结束循环
                //否则撞到外界第二层边界，不做拓展
                break
            }
        }
        for i in 1...Point1y{ // 第一个点的上边
            let PointNow = CGPoint(x: (Po1?.x)!, y: (Po1?.y)! + CGFloat(i) * 31)
            let PointNowValue = NSValue.init(cgPoint: PointNow)
            Point1StartArrYUp.add(PointNowValue)
            if nodes(at: PointNow).count > 0 { //如果撞到实体方块，该方块成为列表最后一个（不会拓展），结束循环
                //否则撞到外界第二层边界，不做拓展
                break
            }
        }
        for i in 1...13-Point1y {
            let PointNow = CGPoint(x: (Po1?.x)!, y: (Po1?.y)! - CGFloat(i) * 31)
            let PointNowValue = NSValue.init(cgPoint: PointNow)
            Point1StartArrYDown.add(PointNowValue)
            if nodes(at: PointNow).count > 0 { //如果撞到实体方块，该方块成为列表最后一个（不会拓展），结束循环
                //否则撞到外界第二层边界，不做拓展
                break
            }
        }
        //到这里，第一个点的四个方向的拓展保存完毕，同样道理对第二个点做同样操作
        let name2 = selected2?.name
        let Point2x:Int = Int(name2!)! / 10 + 1 //第一个方块的横坐标
        let Point2y:Int = Int(name2!)! % 10 + 1 //第一个方块的纵坐标
        let Point2StartArrXLeft = NSMutableArray() //每一个元素做纵向拓展，最后一个例外，方块左侧
        let Point2StartArrXRight = NSMutableArray()  //每一个元素做纵向拓展，最后一个不拓展，方块右侧
        let Point2StartArrYUp = NSMutableArray()  //每一个元素做横向拓展，最后一个不拓展，方块上方
        let Point2StartArrYDown = NSMutableArray()  //每一个元素做横向拓展，最后一个不拓展，方块下方
        let Po2 = selected2?.position
        for i in 1...Point2x{ // 第二个点的左边
            let PointNow = CGPoint(x: (Po2?.x)! - CGFloat(i) * 31, y: (Po2?.y)!)
            if nodes(at: PointNow).count == 0 { //如果没有方块，加入列表，否则结束循环
                let PointNowValue = NSValue.init(cgPoint: PointNow)
                Point2StartArrXLeft.add(PointNowValue)
            }else{
                break //撞到则终止循环
            }
        }
        for i in 1...11-Point2x {  //第二个点的右边
            let PointNow = CGPoint(x: (Po2?.x)! + CGFloat(i) * 31, y: (Po2?.y)!)
            if nodes(at: PointNow).count == 0 { //如果没有方块，加入列表，否则结束循环
                let PointNowValue = NSValue.init(cgPoint: PointNow)
                Point2StartArrXRight.add(PointNowValue)
            }else{
                break //撞到则终止循环
            }
        }
        for i in 1...11-Point2y{ // 第二个点的上边
            let PointNow = CGPoint(x: (Po2?.x)!, y: (Po2?.y)! + CGFloat(i) * 31)
            if nodes(at: PointNow).count == 0 { //如果没有方块，加入列表，否则结束循环
                let PointNowValue = NSValue.init(cgPoint: PointNow)
                Point2StartArrYUp.add(PointNowValue)
            }else{
                break //撞到则终止循环
            }
        }
        for i in 1...Point2y { //第二点下
            let PointNow = CGPoint(x: (Po2?.x)!, y: (Po2?.y)! - CGFloat(i) * 31)
            if nodes(at: PointNow).count == 0 { //如果没有方块，加入列表，否则结束循环
                let PointNowValue = NSValue.init(cgPoint: PointNow)
                Point2StartArrYDown.add(PointNowValue)
            }else{
                break //撞到则终止循环
            }
        }
        //以上为第二点四项拓展，只包括空位，不包括邻接方块
        //开始判断连线情况，首先第一种情况，两个方块直线相连口-----口
        //这种情况第二点一定位于第一点四个方向的终端节点上，直接进行判断
        var a = Point1StartArrXLeft.lastObject as! NSValue
        var aP = a.cgPointValue
        if aP.x == selected2?.position.x && aP.y == selected2?.position.y {
            print("成功配对-左")
            return true
        }
        a = Point1StartArrXRight.lastObject as! NSValue
        aP = a.cgPointValue
        if aP.x == selected2?.position.x && aP.y == selected2?.position.y {
            print("成功配对-右")
            return true
        }
        a = Point1StartArrYUp.lastObject as! NSValue
        aP = a.cgPointValue
        if aP.x == selected2?.position.x && aP.y == selected2?.position.y {
            print("成功配对-上")
            return true
        }
        a = Point1StartArrYDown.lastObject as! NSValue
        aP = a.cgPointValue
        if aP.x == selected2?.position.x && aP.y == selected2?.position.y {
            print("成功配对-下")
            return true
        }
        //如果直线没配对成功，一个转折，用点1的拓展队列（去末尾）跟点二的四项搜索重合，重合则连接成功
        /*可以判断两点的相对方位从而减少工作量，一个折角的话方向都是接近的方向，
         比如点一左上点二右下，则搜索点一的右分支-点二上分支
         口-----
               |
               |
               口
         和点一下分支-点二左分支即可
         口
         |
         |
         |--------口
         
         不用4X4嵌套循环，优化效率
        */
        if (selected1?.position.x)! < (selected2?.position.x)! {
            if (selected1?.position.y)! < (selected2?.position.y)! { //点一在左下
                for b in Point1StartArrXRight {
                    let b1 = b as! NSValue
                    let b2 = b1.cgPointValue //拿到A的延伸点
                    for c in Point2StartArrYDown{
                        let c1 = c as! NSValue
                        let c2 = c1.cgPointValue
                        if c2.x == b2.x && b2.y == c2.y {
                            print("成功配对-点一左下-右下折角")
                            turnPoint1 = c2
                            return true
                        }
                    }
                    
                }
                for b in Point1StartArrYUp {
                    let b1 = b as! NSValue
                    let b2 = b1.cgPointValue //拿到A的延伸点
                    for c in Point2StartArrXLeft{
                        let c1 = c as! NSValue
                        let c2 = c1.cgPointValue
                        if c2.x == b2.x && b2.y == c2.y {
                            print("成功配对-点一左下-左上折角")
                            turnPoint1 = c2
                            return true
                        }
                    }
                    
                }
            }else{//点一在左上
                for b in Point1StartArrXRight {
                    let b1 = b as! NSValue
                    let b2 = b1.cgPointValue //拿到A的延伸点
                    for c in Point2StartArrYUp{
                        let c1 = c as! NSValue
                        let c2 = c1.cgPointValue
                        if c2.x == b2.x && b2.y == c2.y {
                            print("成功配对-点一左上-右上折角")
                            turnPoint1 = c2
                            return true
                        }
                    }
                    
                }
                for b in Point1StartArrYDown {
                    let b1 = b as! NSValue
                    let b2 = b1.cgPointValue //拿到A的延伸点
                    for c in Point2StartArrXLeft{
                        let c1 = c as! NSValue
                        let c2 = c1.cgPointValue
                        if c2.x == b2.x && b2.y == c2.y {
                            print("成功配对-点一左上-左下折角")
                            turnPoint1 = c2
                            return true
                        }
                    }
                    
                }
            }
        }else{
            if (selected1?.position.y)! < (selected2?.position.y)! { //点一在右下
                for b in Point1StartArrYUp {
                    let b1 = b as! NSValue
                    let b2 = b1.cgPointValue //拿到A的延伸点
                    for c in Point2StartArrXRight{
                        let c1 = c as! NSValue
                        let c2 = c1.cgPointValue
                        if c2.x == b2.x && b2.y == c2.y {
                            print("成功配对-点一右下-右上折角")
                            turnPoint1 = c2
                            return true
                        }
                    }
                    
                }
                for b in Point1StartArrXLeft {
                    let b1 = b as! NSValue
                    let b2 = b1.cgPointValue //拿到A的延伸点
                    for c in Point2StartArrYDown{
                        let c1 = c as! NSValue
                        let c2 = c1.cgPointValue
                        if c2.x == b2.x && b2.y == c2.y {
                            print("成功配对-点一右下-左下折角")
                            turnPoint1 = c2
                            return true
                        }
                    }
                    
                }
            }else{//点一在右上
                for b in Point2StartArrXRight {
                    let b1 = b as! NSValue
                    let b2 = b1.cgPointValue //拿到A的延伸点
                    for c in Point1StartArrYDown{
                        let c1 = c as! NSValue
                        let c2 = c1.cgPointValue
                        if c2.x == b2.x && b2.y == c2.y {
                            print("成功配对-点一右上-右下折角")
                            turnPoint1 = c2
                            return true
                        }
                    }
                    
                }
                for b in Point2StartArrYUp {
                    let b1 = b as! NSValue
                    let b2 = b1.cgPointValue //拿到A的延伸点
                    for c in Point1StartArrXLeft{
                        let c1 = c as! NSValue
                        let c2 = c1.cgPointValue
                        if c2.x == b2.x && b2.y == c2.y {
                            print("成功配对-点一右上-左上折角")
                            turnPoint1 = c2
                            return true
                        }
                    }
                    
                }
            }
        }
        //单折角配对失败，最后可能双折角
        /*
         双折角四个方向都需要考虑因为存在
             口--|     口--|
                 |        |
        口-------|        |---口
         两种情况，左边的情况点一的延伸是反向的，右边的情况点一的延伸才是正向的
         */
        //第二个点的四向队列没有保存不能延伸的末端节点，因此反从点二的点去拓展并与点一四向队列求重合
        //这样可以少判断一次去掉末端队列
        //重要：两方块在同一行/同一列但是需要折角两次的情况需要另行考虑
        //重要：因为两块处于同一行时，可能走上右下也可能走下又上
        if (selected1?.position.x)! == (selected2?.position.x)!  || (selected1?.position.y)! == (selected2?.position.y)!  {
            if (selected1?.position.y)! == (selected2?.position.y)!  {
                
                for b in Point2StartArrYUp {  //点二在右上，第一段线从上侧拉出，则第二段走向必为左，第三段向下
                    let b1 = b as! NSValue
                    let b2 = b1.cgPointValue  //取得拓展起点
                    for c in 1...Point2x{
                        let b3 = CGPoint(x: b2.x - CGFloat(c) * 31, y: b2.y )
                        if nodes(at: b3).count == 0 {
                            for d in Point1StartArrYUp {
                                let d1 = d as! NSValue
                                let d2 = d1.cgPointValue
                                if d2.x == b3.x && d2.y == b3.y {
                                    turnPoint1 = b3
                                    turnPoint2 = b2
                                    print("横向水平01上左下折线成功")
                                    return true
                                }
                            }
                        }else{
                            break
                        }
                    }
                }
                for b in Point2StartArrYUp {  //点二在左上，第一段线从上侧拉出，则第二段走向必为右，第三段向下
                    let b1 = b as! NSValue
                    let b2 = b1.cgPointValue  //取得拓展起点
                    for c in 1...11 - Point2x{
                        let b3 = CGPoint(x: b2.x + CGFloat(c) * 31, y: b2.y )
                        if nodes(at: b3).count == 0 {
                            for d in Point1StartArrYUp {
                                let d1 = d as! NSValue
                                let d2 = d1.cgPointValue
                                if d2.x == b3.x && d2.y == b3.y {
                                    turnPoint1 = b3
                                    turnPoint2 = b2
                                    print("横向水平02上右下折线成功")
                                    return true
                                }
                            }
                        }else{
                            break
                        }
                    }
                }
                for b in Point2StartArrYDown {  //点二在右下，第一段线从下侧拉出，则第二段走向必为左，第三段向上
                    let b1 = b as! NSValue
                    let b2 = b1.cgPointValue  //取得拓展起点
                    for c in 1...Point2x{
                        let b3 = CGPoint(x: b2.x  - CGFloat(c) * 31, y: b2.y )
                        if nodes(at: b3).count == 0 {
                            for d in Point1StartArrYDown {
                                let d1 = d as! NSValue
                                let d2 = d1.cgPointValue
                                if d2.x == b3.x && d2.y == b3.y {
                                    turnPoint1 = b3
                                    turnPoint2 = b2
                                    print("横向水平03下左上折线成功")
                                    return true
                                }
                            }
                        }else{
                            break
                        }
                    }
                }
                for b in Point2StartArrYDown {  //点二在左下，第一段线从下侧拉出，则第二段走向必为右，第三段向上
                    let b1 = b as! NSValue
                    let b2 = b1.cgPointValue  //取得拓展起点
                    for c in 1...10 - Point2x{
                        let b3 = CGPoint(x: b2.x  + CGFloat(c) * 31, y: b2.y )
                        if nodes(at: b3).count == 0 {
                            for d in Point1StartArrYDown {
                                let d1 = d as! NSValue
                                let d2 = d1.cgPointValue
                                if d2.x == b3.x && d2.y == b3.y {
                                    turnPoint1 = b3
                                    turnPoint2 = b2
                                    print("横向水平04下右上折线成功")
                                    return true
                                }
                            }
                        }else{
                            break
                        }
                    }
                }
                
            }else{
                for b in Point2StartArrXLeft {  //点二在左下，第一段线从左侧拉出，则第二段走向必为上（为右原路折回），第三段向右
                    let b1 = b as! NSValue
                    let b2 = b1.cgPointValue  //取得拓展起点
                    for c in 1...11 - Point2y{
                        let b3 = CGPoint(x: b2.x, y: b2.y + CGFloat(c) * 31 )
                        if nodes(at: b3).count == 0 {
                            for d in Point1StartArrXLeft {
                                let d1 = d as! NSValue
                                let d2 = d1.cgPointValue
                                if d2.x == b3.x && d2.y == b3.y {
                                    turnPoint1 = b3
                                    turnPoint2 = b2
                                    print("纵向水平01左上右折线成功")
                                    return true
                                }
                            }
                        }else{
                            break  //拓展撞墙终止延伸
                        }
                    }
                }
                for b in Point2StartArrXLeft {  //点二在左上，第一段线从左侧拉出，则第二段走向必为下，第三段向右
                    let b1 = b as! NSValue
                    let b2 = b1.cgPointValue  //取得拓展起点
                    for c in 1...Point2y{
                        let b3 = CGPoint(x: b2.x, y: b2.y - CGFloat(c) * 31 )
                        if nodes(at: b3).count == 0 {
                            for d in Point1StartArrXLeft {
                                let d1 = d as! NSValue
                                let d2 = d1.cgPointValue
                                if d2.x == b3.x && d2.y == b3.y {
                                    turnPoint1 = b3
                                    turnPoint2 = b2
                                    print("纵向水平02左下右折线成功")
                                    return true
                                }
                            }
                        }else{
                            break
                        }
                    }
                }
                for b in Point2StartArrXRight {  //点二在右下，第一段线从右侧拉出，则第二段走向必为上，第三段向左
                    let b1 = b as! NSValue
                    let b2 = b1.cgPointValue  //取得拓展起点
                    for c in 1...11 - Point2y{
                        let b3 = CGPoint(x: b2.x, y: b2.y + CGFloat(c) * 31 )
                        if nodes(at: b3).count == 0 {
                            for d in Point1StartArrXRight {
                                let d1 = d as! NSValue
                                let d2 = d1.cgPointValue
                                if d2.x == b3.x && d2.y == b3.y {
                                    turnPoint1 = b3
                                    turnPoint2 = b2
                                    print("纵向水平03右上左折线成功")
                                    return true
                                }
                            }
                        }else{
                            break
                        }
                    }
                }
                for b in Point2StartArrXRight {  //点二在右上，第一段线从右侧拉出，则第二段走向必为下，第三段向左
                    let b1 = b as! NSValue
                    let b2 = b1.cgPointValue  //取得拓展起点
                    for c in 1...Point2y{
                        let b3 = CGPoint(x: b2.x, y: b2.y - CGFloat(c) * 31 )
                        if nodes(at: b3).count == 0 {
                            for d in Point1StartArrXRight {
                                let d1 = d as! NSValue
                                let d2 = d1.cgPointValue
                                if d2.x == b3.x && d2.y == b3.y {
                                    turnPoint1 = b3
                                    turnPoint2 = b2
                                    print("纵向水平04右下左折线成功")
                                    return true
                                }
                            }
                        }else{
                            break
                        }
                    }
                }

                
            }
        }else if (selected2?.position.x)! < (selected1?.position.x)! {
            if (selected2?.position.y)! < (selected1?.position.y)! { //点二在左下
                for b in Point2StartArrXLeft {  //点二在左下，第一段线从左侧拉出，则第二段走向必为上（为右原路折回），第三段向右
                    let b1 = b as! NSValue
                    let b2 = b1.cgPointValue  //取得拓展起点
                    for c in 1...11 - Point2y{
                        let b3 = CGPoint(x: b2.x, y: b2.y + CGFloat(c) * 31 )
                        if nodes(at: b3).count == 0 {
                            for d in Point1StartArrXLeft {
                                let d1 = d as! NSValue
                                let d2 = d1.cgPointValue
                                if d2.x == b3.x && d2.y == b3.y {
                                    turnPoint1 = b3
                                    turnPoint2 = b2
                                    print("01左上右折线成功")
                                    return true
                                }
                            }
                        }else{
                            break
                        }
                    }
                }
                for b in Point2StartArrYDown {  //点二在左下，第一段线从下侧拉出，则第二段走向必为右，第三段向上
                    let b1 = b as! NSValue
                    let b2 = b1.cgPointValue  //取得拓展起点
                    for c in 1...11 - Point2x{
                        let b3 = CGPoint(x: b2.x  + CGFloat(c) * 31, y: b2.y )
                        if nodes(at: b3).count == 0 {
                            for d in Point1StartArrYDown {
                                let d1 = d as! NSValue
                                let d2 = d1.cgPointValue
                                if d2.x == b3.x && d2.y == b3.y {
                                    turnPoint1 = b3
                                    turnPoint2 = b2
                                    print("02下右上折线成功")
                                    return true
                                }
                            }
                        }else{
                            break
                        }
                    }
                }
                for b in Point2StartArrXRight {  //点二在左下，第一段线从右侧拉出，则第二段走向必为上，第三段向右或者左
                    let b1 = b as! NSValue
                    let b2 = b1.cgPointValue  //取得拓展起点
                    for c in 1...11 - Point2y{
                        let b3 = CGPoint(x: b2.x, y: b2.y + CGFloat(c) * 31 )
                        if nodes(at: b3).count == 0 {
                            for d in Point1StartArrXLeft {
                                let d1 = d as! NSValue
                                let d2 = d1.cgPointValue
                                if d2.x == b3.x && d2.y == b3.y {
                                    turnPoint1 = b3
                                    turnPoint2 = b2
                                    print("03右上右折线成功")
                                    return true
                                }
                            }
                            for d in Point1StartArrXRight {
                                let d1 = d as! NSValue
                                let d2 = d1.cgPointValue
                                if d2.x == b3.x && d2.y == b3.y {
                                    turnPoint1 = b3
                                    turnPoint2 = b2
                                    print("03.1右上左折线成功")
                                    return true
                                }
                            }
                        }else{
                            break
                        }
                    }
                }
                for b in Point2StartArrYUp {  //点二在左下，第一段线从上侧拉出，则第二段走向必为右，第三段向上或者下
                    let b1 = b as! NSValue
                    let b2 = b1.cgPointValue  //取得拓展起点
                    for c in 1...11 - Point2x{
                        let b3 = CGPoint(x: b2.x + CGFloat(c) * 31, y: b2.y )
                        if nodes(at: b3).count == 0 {
                            for d in Point1StartArrYDown {
                                let d1 = d as! NSValue
                                let d2 = d1.cgPointValue
                                if d2.x == b3.x && d2.y == b3.y {
                                    turnPoint1 = b3
                                    turnPoint2 = b2
                                    print("04上右上折线成功")
                                    return true
                                }
                            }
                            for d in Point1StartArrYUp {
                                let d1 = d as! NSValue
                                let d2 = d1.cgPointValue
                                if d2.x == b3.x && d2.y == b3.y {
                                    turnPoint1 = b3
                                    turnPoint2 = b2
                                    print("04.1上右下折线成功")
                                    return true
                                }
                            }
                        }else{
                            break
                        }
                    }
                }
                
            }else{ //点二在左上
                for b in Point2StartArrXLeft {  //点二在左上，第一段线从左侧拉出，则第二段走向必为下，第三段向右
                    let b1 = b as! NSValue
                    let b2 = b1.cgPointValue  //取得拓展起点
                    for c in 1...Point2y{
                        let b3 = CGPoint(x: b2.x, y: b2.y - CGFloat(c) * 31 )
                        if nodes(at: b3).count == 0 {
                            for d in Point1StartArrXLeft {
                                let d1 = d as! NSValue
                                let d2 = d1.cgPointValue
                                if d2.x == b3.x && d2.y == b3.y {
                                    turnPoint1 = b3
                                    turnPoint2 = b2
                                    print("05左下右折线成功")
                                    return true
                                }
                            }
                        }else{
                            break
                        }
                    }
                }
                for b in Point2StartArrYDown {  //点二在左上，第一段线从下侧拉出，则第二段走向必为右，第三段向下或者上
                    let b1 = b as! NSValue
                    let b2 = b1.cgPointValue  //取得拓展起点
                    for c in 1...11 - Point2x{
                        let b3 = CGPoint(x: b2.x  + CGFloat(c) * 31, y: b2.y )
                        if nodes(at: b3).count == 0 {
                            for d in Point1StartArrYUp {
                                let d1 = d as! NSValue
                                let d2 = d1.cgPointValue
                                if d2.x == b3.x && d2.y == b3.y {
                                    turnPoint1 = b3
                                    turnPoint2 = b2
                                    print("06下右下折线成功")
                                    return true
                                }
                            }
                            for d in Point1StartArrYDown {
                                let d1 = d as! NSValue
                                let d2 = d1.cgPointValue
                                if d2.x == b3.x && d2.y == b3.y {
                                    turnPoint1 = b3
                                    turnPoint2 = b2
                                    print("06.1下右上折线成功")
                                    return true
                                }
                            }
                        }else{
                            break
                        }
                    }
                }
                for b in Point2StartArrXRight {  //点二在左上，第一段线从右侧拉出，则第二段走向必为下，第三段向右或者左
                    let b1 = b as! NSValue
                    let b2 = b1.cgPointValue  //取得拓展起点
                    for c in 1...Point2y{
                        let b3 = CGPoint(x: b2.x, y: b2.y - CGFloat(c) * 31 )
                        if nodes(at: b3).count == 0 {
                            for d in Point1StartArrXLeft {
                                let d1 = d as! NSValue
                                let d2 = d1.cgPointValue
                                if d2.x == b3.x && d2.y == b3.y {
                                    turnPoint1 = b3
                                    turnPoint2 = b2
                                    print("07右下右折线成功")
                                    return true
                                }
                            }
                            for d in Point1StartArrXRight {
                                let d1 = d as! NSValue
                                let d2 = d1.cgPointValue
                                if d2.x == b3.x && d2.y == b3.y {
                                    turnPoint1 = b3
                                    turnPoint2 = b2
                                    print("07.1右下左折线成功")
                                    return true
                                }
                            }
                        }else{
                            break
                        }
                    }
                }
                for b in Point2StartArrYUp {  //点二在左上，第一段线从上侧拉出，则第二段走向必为右，第三段向下
                    let b1 = b as! NSValue
                    let b2 = b1.cgPointValue  //取得拓展起点
                    for c in 1...11 - Point2x{
                        let b3 = CGPoint(x: b2.x + CGFloat(c) * 31, y: b2.y )
                        if nodes(at: b3).count == 0 {
                            for d in Point1StartArrYUp {
                                let d1 = d as! NSValue
                                let d2 = d1.cgPointValue
                                if d2.x == b3.x && d2.y == b3.y {
                                    turnPoint1 = b3
                                    turnPoint2 = b2
                                    print("08上右下折线成功")
                                    return true
                                }
                            }
                        }else{
                            break
                        }
                    }
                }
                
            }
        }else{
            if (selected2?.position.y)! < (selected1?.position.y)! { //点二在右下
                for b in Point2StartArrXLeft {  //点二在右下，第一段线从左侧拉出，则第二段走向必为上，第三段向左或者右
                    let b1 = b as! NSValue
                    let b2 = b1.cgPointValue  //取得拓展起点
                    for c in 1...11 - Point2y{
                        let b3 = CGPoint(x: b2.x, y: b2.y + CGFloat(c) * 31 )
                        if nodes(at: b3).count == 0 {
                            for d in Point1StartArrXRight {
                                let d1 = d as! NSValue
                                let d2 = d1.cgPointValue
                                if d2.x == b3.x && d2.y == b3.y {
                                    turnPoint1 = b3
                                    turnPoint2 = b2
                                    print("09左上左折线成功")
                                    return true
                                }
                            }
                            for d in Point1StartArrXLeft {
                                let d1 = d as! NSValue
                                let d2 = d1.cgPointValue
                                if d2.x == b3.x && d2.y == b3.y {
                                    turnPoint1 = b3
                                    turnPoint2 = b2
                                    print("09.1左上右折线成功")
                                    return true
                                }
                            }
                        }else{
                            break
                        }
                    }
                }
                for b in Point2StartArrYDown {  //点二在右下，第一段线从下侧拉出，则第二段走向必为左，第三段向上
                    let b1 = b as! NSValue
                    let b2 = b1.cgPointValue  //取得拓展起点
                    for c in 1...Point2x{
                        let b3 = CGPoint(x: b2.x  - CGFloat(c) * 31, y: b2.y )
                        if nodes(at: b3).count == 0 {
                            for d in Point1StartArrYDown {
                                let d1 = d as! NSValue
                                let d2 = d1.cgPointValue
                                if d2.x == b3.x && d2.y == b3.y {
                                    turnPoint1 = b3
                                    turnPoint2 = b2
                                    print("10下左上折线成功")
                                    return true
                                }
                            }
                        }else{
                            break
                        }
                    }
                }
                for b in Point2StartArrXRight {  //点二在右下，第一段线从右侧拉出，则第二段走向必为上，第三段向左
                    let b1 = b as! NSValue
                    let b2 = b1.cgPointValue  //取得拓展起点
                    for c in 1...11 - Point2y{
                        let b3 = CGPoint(x: b2.x, y: b2.y + CGFloat(c) * 31 )
                        if nodes(at: b3).count == 0 {
                            for d in Point1StartArrXRight {
                                let d1 = d as! NSValue
                                let d2 = d1.cgPointValue
                                if d2.x == b3.x && d2.y == b3.y {
                                    turnPoint1 = b3
                                    turnPoint2 = b2
                                    print("11右上左折线成功")
                                    return true
                                }
                            }
                        }else{
                            break
                        }
                    }
                }
                for b in Point2StartArrYUp {  //点二在右下，第一段线从上侧拉出，则第二段走向必为左，第三段向上或者下
                    let b1 = b as! NSValue
                    let b2 = b1.cgPointValue  //取得拓展起点
                    for c in 1...Point2x{
                        let b3 = CGPoint(x: b2.x - CGFloat(c) * 31, y: b2.y )
                        if nodes(at: b3).count == 0 {
                            for d in Point1StartArrYDown {
                                let d1 = d as! NSValue
                                let d2 = d1.cgPointValue
                                if d2.x == b3.x && d2.y == b3.y {
                                    turnPoint1 = b3
                                    turnPoint2 = b2
                                    print("12上左上折线成功")
                                    return true
                                }
                            }
                            for d in Point1StartArrYUp {
                                let d1 = d as! NSValue
                                let d2 = d1.cgPointValue
                                if d2.x == b3.x && d2.y == b3.y {
                                    turnPoint1 = b3
                                    turnPoint2 = b2
                                    print("12.1上左下折线成功")
                                    return true
                                }
                            }
                        }else{
                            break
                        }
                    }
                }
                
            }else{ //点二在右上
                for b in Point2StartArrXLeft {  //点二在右上，第一段线从左侧拉出，则第二段走向必为下，第三段向左或者右
                    let b1 = b as! NSValue
                    let b2 = b1.cgPointValue  //取得拓展起点
                    for c in 1...Point2y{
                        let b3 = CGPoint(x: b2.x, y: b2.y - CGFloat(c) * 31 )
                        if nodes(at: b3).count == 0 {
                            for d in Point1StartArrXRight {
                                let d1 = d as! NSValue
                                let d2 = d1.cgPointValue
                                if d2.x == b3.x && d2.y == b3.y {
                                    turnPoint1 = b3
                                    turnPoint2 = b2
                                    print("13左下左折线成功")
                                    return true
                                }
                            }
                            for d in Point1StartArrXLeft {
                                let d1 = d as! NSValue
                                let d2 = d1.cgPointValue
                                if d2.x == b3.x && d2.y == b3.y {
                                    turnPoint1 = b3
                                    turnPoint2 = b2
                                    print("13.1左下右折线成功")
                                    return true
                                }
                            }
                        }else{
                            break
                        }
                    }
                }
                for b in Point2StartArrYDown {  //点二在右上，第一段线从下侧拉出，则第二段走向必为左，第三段向上或者下
                    let b1 = b as! NSValue
                    let b2 = b1.cgPointValue  //取得拓展起点
                    for c in 1...Point2x{
                        let b3 = CGPoint(x: b2.x  - CGFloat(c) * 31, y: b2.y )
                        if nodes(at: b3).count == 0 {
                            for d in Point1StartArrYDown {
                                let d1 = d as! NSValue
                                let d2 = d1.cgPointValue
                                if d2.x == b3.x && d2.y == b3.y {
                                    turnPoint1 = b3
                                    turnPoint2 = b2
                                    print("14下左下折线成功")
                                    return true
                                }
                            }
                            for d in Point1StartArrYUp {
                                let d1 = d as! NSValue
                                let d2 = d1.cgPointValue
                                if d2.x == b3.x && d2.y == b3.y {
                                    turnPoint1 = b3
                                    turnPoint2 = b2
                                    print("14.1下左上折线成功")
                                    return true
                                }
                            }
                        }else{
                            break
                        }
                    }
                }
                for b in Point2StartArrXRight {  //点二在右上，第一段线从右侧拉出，则第二段走向必为下，第三段向左
                    let b1 = b as! NSValue
                    let b2 = b1.cgPointValue  //取得拓展起点
                    for c in 1...Point2y{
                        let b3 = CGPoint(x: b2.x, y: b2.y - CGFloat(c) * 31 )
                        if nodes(at: b3).count == 0 {
                            for d in Point1StartArrXRight {
                                let d1 = d as! NSValue
                                let d2 = d1.cgPointValue
                                if d2.x == b3.x && d2.y == b3.y {
                                    turnPoint1 = b3
                                    turnPoint2 = b2
                                    print("15右下左折线成功")
                                    return true
                                }
                            }
                        }else{
                            break
                        }
                    }
                }
                for b in Point2StartArrYUp {  //点二在右上，第一段线从上侧拉出，则第二段走向必为左，第三段向下
                    let b1 = b as! NSValue
                    let b2 = b1.cgPointValue  //取得拓展起点
                    for c in 1...Point2x{
                        let b3 = CGPoint(x: b2.x - CGFloat(c) * 31, y: b2.y )
                        if nodes(at: b3).count == 0 {
                            for d in Point1StartArrYUp {
                                let d1 = d as! NSValue
                                let d2 = d1.cgPointValue
                                if d2.x == b3.x && d2.y == b3.y {
                                    turnPoint1 = b3
                                    turnPoint2 = b2
                                    print("16上左下折线成功")
                                    return true
                                }
                            }
                        }else{
                            break
                        }
                    }
                }
                
            }
            
        }
        
        
        
        //全部方法配对失败，返回false
        return false
    }
    
}
