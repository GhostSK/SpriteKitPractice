//
//  GameViewController.swift
//  TileMap
//
//  Created by 胡杨林 on 17/3/20.
//  Copyright © 2017年 胡杨林. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {

                let scene = GameScene(size:CGSize(width: 22 * 32, height: 7 * 32))
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .resizeFill
                print("scene.width = \(scene.frame.width)   scene.height = \(scene.frame.height)")
                // Present the scene
                view.presentScene(scene)
            
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
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
