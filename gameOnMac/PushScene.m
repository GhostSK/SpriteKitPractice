//
//  PushScene.m
//  gameOnMac
//
//  Created by 胡杨林 on 16/12/28.
//  Copyright © 2016年 胡杨林. All rights reserved.
//

#import "PushScene.h"

@interface PushScene()

@property NSTimer *timer;

@end


@implementation PushScene

-(instancetype)initWithSize:(CGSize)size{
    PushScene *scene = [super initWithSize:size];
    scene.backgroundColor = [SKColor whiteColor];
    scene.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.size.width, self.size.height)];
    scene.physicsWorld.gravity = CGVectorMake(0.0, 0.0);
    return scene;
}
-(void)didMoveToView:(SKView *)view{
    SKSpriteNode *node = [[SKSpriteNode alloc]initWithColor:[SKColor redColor] size:CGSizeMake(80, 80)];
    node.position = CGPointMake(600, 600);
    [node setPhysicsBody:[SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(80, 80)]];
    node.physicsBody.dynamic = YES;
    node.name = @"node";
    node.physicsBody.linearDamping = 1.0;
    node.physicsBody.angularDamping = 1.0;
    [self.scene addChild:node];
    
    
  
}
-(void)keyDown:(NSEvent *)event{
    NSLog(@"keyDown:'%@' keyCode: %02D", event.characters, event.keyCode);
    SKSpriteNode *node = (SKSpriteNode *)[self.scene childNodeWithName:@"node"];
    switch (event.keyCode) {
            
        case 0x7B:{
            NSLog(@"左");
            if (!self.timer) {
                self.timer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(MoveToLeft) userInfo:nil repeats:YES];
            }

            break;}
        case 0x7C:{
//            [node.physicsBody applyImpulse:CGVectorMake(1.0, 0.0)];
//            [node.physicsBody applyImpulse:CGVectorMake(10.0, 0.0)];
            [node.physicsBody applyForce:CGVectorMake(10.0, 0.0)];
            NSLog(@"右");
            break;
        }
        case 0x7D:{
            NSLog(@"下");
            [node.physicsBody applyTorque:1.0];
            break;}
        case 0x7E:{
            NSLog(@"上");
            [node.physicsBody applyAngularImpulse:1.0];
            break;}
    }
}
-(void)keyUp:(NSEvent *)event{
    switch (event.keyCode) {
            
        case 0x7B:{
            [self.timer invalidate];
            self.timer = nil;
            
            break;
        }
    }
}
-(void)mouseDragged:(NSEvent *)event{
    SKSpriteNode *node = (SKSpriteNode *)[self.scene childNodeWithName:@"node"];
//    [node.physicsBody applyForce:CGVectorMake(-10.0, 0.0) atPoint:CGPointMake(0, 0)];
//    [node.physicsBody applyForce:CGVectorMake(-10.0, 0.0)];
    [node.physicsBody applyImpulse:CGVectorMake(-2.0, 0.0)];
}
-(void)MoveToLeft{
    SKSpriteNode *node = (SKSpriteNode *)[self.scene childNodeWithName:@"node"];
    [node.physicsBody applyForce:CGVectorMake(-20.0, 0.0)];
}
@end
