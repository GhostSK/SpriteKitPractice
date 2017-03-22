//
//  File.swift
//  TileMap
//
//  Created by 胡杨林 on 17/3/22.
//  Copyright © 2017年 胡杨林. All rights reserved.
//

import Foundation
import CoreGraphics
//加载来自图片的瓦片地图
func tileMapLayerFromFileNamed(fileName:String) ->TileMapLayer? {
    let path = Bundle.main.path(forResource: fileName, ofType: nil)
    if path == nil {
        return nil
    }
    let fileContents = try? String(contentsOfFile: path!)
    let lines = Array<String>(fileContents!.components(separatedBy: "\n"))
    let atlasName = lines[0]
    let tileSizeComps = lines[1].components(separatedBy: "x")
    let width = Int(tileSizeComps[0])
    let height = Int(tileSizeComps[1])
    if width != nil && height != nil {
        let tileSize = CGSize(width: width!, height: height!)
        let tileCodes = lines[2..<lines.endIndex]
        return TileMapLayer(atlasName: atlasName, tileSize: tileSize, tileCodes: Array(tileCodes))
    }
    return nil
}
