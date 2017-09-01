//
//  GameViewController.swift
//  billiards
//
//  Created by 胡杨林 on 2017/8/2.
//  Copyright © 2017年 胡杨林. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            let scene = GameScene(size: self.view.frame.size)
            scene.scaleMode = .aspectFill
            view.presentScene(scene)
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
        /*
         let a4 = sqrt(1 / (touchpoint.x * touchpoint.x + touchpoint.y * touchpoint.y))
         let PointBaseBall = CGPoint(x: 150 * touchpoint.x * a4, y: 150 * touchpoint.y * a4)
         let truePoint = CGPoint(x: PointBaseBall.x + ballPoint.x, y: PointBaseBall.y + ballPoint.y)
         self.cue?.position = truePoint
         */
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .portrait
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
