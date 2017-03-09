//
//  MagicBaseModel.swift
//  FightSceneDemo
//
//  Created by 胡杨林 on 17/3/7.
//  Copyright © 2017年 胡杨林. All rights reserved.
//

import Foundation

class MagicBaseModel: NSObject {
    public var MagicName:String? = nil
    public var MagicCategory:String? = nil  //单体/群体/辅助/dot/虚弱/加速等分类
    public var MagicTargets:[UnitNode]? = nil  //作用对象，可能为群体
    public var Buff1:String? = nil  //持续效果1
    public var Buff1KeepTime:NSInteger = 0  //buff1持续时间
    public var buff2:String? = nil
    public var buff2KeepTime:NSInteger = 0
    public var buff3:String? = nil
    public var buff3KeepTime:NSInteger = 0
    public var directEffectValue:NSInteger = 0   //翔舞首跳/直接效果
    public var indirectEffectValue:NSInteger = 0  //翔舞每一跳
    public var endEffectValue:NSInteger = 0 //上元结束跳
    
    init(Name:String) {
        super.init()
        self.MagicName = Name
    }
    
    
    
}
