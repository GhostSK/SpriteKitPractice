//
//  HelloScene.m
//  gameOnMac
//
//  Created by 胡杨林 on 16/11/18.
//  Copyright © 2016年 胡杨林. All rights reserved.
//

#import "HelloScene.h"
#import "SpaceShipScene.h"
#import "FlyingBirds.h"
@interface HelloScene()

@property BOOL contentCreated;

@end


@implementation HelloScene

-(void)didMoveToView:(SKView *)view{
    if (!self.contentCreated) {
        [self createSceneContents];
        self.contentCreated = YES;
    }
}

-(void)createSceneContents{
    self.backgroundColor = [SKColor blueColor];
    self.scaleMode = SKSceneScaleModeFill;
    [self addChild:[self newHelloNode]];
}

-(SKLabelNode *)newHelloNode{
    SKLabelNode *helloNode = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    helloNode.text = @"Hello, Game!";
    helloNode.fontSize = 42;
    helloNode.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    helloNode.name = @"helloNode";
    return helloNode;
}

-(void)mouseDown:(NSEvent *)event{
//    NSLog(@"你是智障么");
    SKNode *node = [self childNodeWithName:@"helloNode"];
    if (node != nil) {
        node.name = nil;
        SKAction *moveup = [SKAction moveByX:100 y:0 duration:1.0];
        SKAction *wait = [SKAction waitForDuration:0.5];
        SKAction *zoom = [SKAction scaleTo:2.0 duration:1.0];
        SKAction *fadeAway = [SKAction fadeInWithDuration:1.0];
        SKAction *remove = [SKAction removeFromParent];
        SKAction *requence = [SKAction sequence:@[moveup,wait,zoom,fadeAway,remove]];
        [node runAction:requence completion:^{
            SpaceShipScene *scene = [[SpaceShipScene alloc ]initWithSize:self.size];
            SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration:1.0];
            [self.view presentScene:scene transition:doors];
        }];
        [node runAction:requence withKey:@"SSS"];
    }
}
-(void)mouseDragged:(NSEvent *)event{
//    NSLog(@"鼠标拖拽中");
//    NSLog(@"鼠标经由坐标点 x = %f y = %f",    event.locationInWindow.x,     event.locationInWindow.y);
}

//helloWorld 键盘输入检测
-(void)keyDown:(NSEvent *)event{
//    NSLog(@"keyDown:'%@' keyCode: 0x%02X", event.characters, event.keyCode);
    switch (event.keyCode) {
        
        case 0x7B:
            NSLog(@"左");
            break;
        case 0x7C:
            NSLog(@"右");
            break;
        case 0x7D:
            NSLog(@"下");
            break;
        case 0x7E:
            NSLog(@"上");
            break;
        case 0x03:
        {
            FlyingBirds *scene = [[FlyingBirds alloc]initWithSize:self.size];
            SKTransition *transition = [SKTransition doorsCloseVerticalWithDuration:1.0];
            [self.view presentScene:scene transition:transition];
            break;
        }
        default:
            break;
    }
}

@end
