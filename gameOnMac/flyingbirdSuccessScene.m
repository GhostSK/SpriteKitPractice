//
//  flyingbirdSuccessScene.m
//  gameOnMac
//
//  Created by 胡杨林 on 16/11/25.
//  Copyright © 2016年 胡杨林. All rights reserved.
//

#import "flyingbirdSuccessScene.h"

@implementation flyingbirdSuccessScene

-(void)didMoveToView:(SKView *)view{
    SKLabelNode *gameover = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    gameover.text = @"YOU WIN!";
    gameover.fontSize = 55;
    gameover.position = CGPointMake(200, 600);
    gameover.fontColor = [SKColor whiteColor];
    [self addChild:gameover];
}

@end
