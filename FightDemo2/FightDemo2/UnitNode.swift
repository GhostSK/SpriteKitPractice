//
//  UnitNode.swift
//  FightDemo2
//
//  Created by 胡杨林 on 2017/12/27.
//  Copyright © 2017年 胡杨林. All rights reserved.
//

import Foundation
import SpriteKit

class baseUnitNode: SKSpriteNode {
    public var MaxHealth:Int = 100
    public var Picture:SKTexture? = nil
    private var mainTexture: SKTexture? = nil
    private var backHPbarNode:SKShapeNode? = nil
    private var HPBarNode:SKShapeNode? = nil
    
    
    init(Maxhealth:Int, Size:CGSize) {
        super.init(texture: nil, color: SKColor.clear, size:Size)
        self.MaxHealth = Maxhealth
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
