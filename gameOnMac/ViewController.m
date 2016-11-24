//
//  ViewController.m
//  gameOnMac
//
//  Created by 胡杨林 on 16/11/18.
//  Copyright © 2016年 胡杨林. All rights reserved.
//

#import "ViewController.h"
#import "GameScene.h"
#import "HelloScene.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Load the SKScene from 'GameScene.sks'
//    GameScene *scene = (GameScene *)[SKScene nodeWithFileNamed:@"GameScene"];
    
    // Set the scale mode to scale to fit the window
//    scene.scaleMode = SKSceneScaleModeAspectFill;
    HelloScene *scene = [[HelloScene alloc]initWithSize:CGSizeMake(1024, 768)];
    scene.scaleMode = SKSceneScaleModeAspectFit;
    // Present the scene
    [self.skView presentScene:scene];
    self.skView.showsNodeCount = YES;
    self.skView.showsFPS = YES;
    self.skView.showsNodeCount = YES;
}
-(void)rightMouseDown:(NSEvent *)event{
    [self.skView.scene rightMouseDown:event];
}

@end
