//
//  SpaceShipScene.m
//  gameOnMac
//
//  Created by 胡杨林 on 16/11/18.
//  Copyright © 2016年 胡杨林. All rights reserved.
//

#import "SpaceShipScene.h"

@interface SpaceShipScene()<SKPhysicsContactDelegate>

@property BOOL contentCreated;

@end


@implementation SpaceShipScene



-(void)didMoveToView:(SKView *)view{
    if (!self.contentCreated) {
        [self createSceneContents];
        self.contentCreated = YES;
    }
    self.physicsWorld.gravity = CGVectorMake(0.0, -9.8);
    self.physicsWorld.contactDelegate = self;
    [self backgroundNode];
}
//设置背景坐标系
-(void)backgroundNode{
    SKSpriteNode *backgroundNode = [SKSpriteNode spriteNodeWithColor:[SKColor clearColor] size:self.size];
    backgroundNode.position = CGPointZero;
    backgroundNode.zPosition = 0.0;
    backgroundNode.anchorPoint = CGPointZero;
    backgroundNode.name = @"background";
    [self addChild:backgroundNode];
}
-(void)createSceneContents{
    self.backgroundColor = [SKColor blackColor];
    self.scaleMode = SKSceneScaleModeFill;
    self.size = CGSizeMake(1024, 768);
    SKSpriteNode *spaceship = [self newSpaceship];
    spaceship.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    spaceship.name = @"MySpace";
    spaceship.anchorPoint = CGPointMake(0.5, 0.5);
    spaceship.blendMode = SKBlendModeAdd;
    spaceship.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:spaceship.size center:CGPointMake(0.5, 0.5)];
    spaceship.physicsBody.dynamic = NO;
    spaceship.physicsBody.categoryBitMask = 1; //飞机的碰撞标识符为1
    spaceship.physicsBody.contactTestBitMask = 2; //可与2类物理体碰撞
    [self addChild:spaceship];
    
    //生成岩石
    SKAction *makeRocks = [SKAction sequence:@[[SKAction performSelector:@selector(addRock) onTarget:self],
                                               [SKAction waitForDuration:0.2 withRange:0.15]]];
    [self runAction:[SKAction repeatActionForever:makeRocks]];
    
}
-(SKSpriteNode *)newSpaceship{
    SKSpriteNode *spaceShip = [[SKSpriteNode alloc]initWithImageNamed:@"火箭32.png"];
//    SKSpriteNode *spaceShip = [[SKSpriteNode alloc]initWithColor:[SKColor whiteColor] size:CGSizeMake(32, 32)];
    
    SKSpriteNode *light1 = [self newLight];
    light1.position = CGPointMake(-24.0, 6.0);
    [spaceShip addChild:light1];
    SKSpriteNode *light2 = [self newLight];
    light2.position = CGPointMake(24.0, 6.0);
    [spaceShip addChild:light2];
    
    
    return spaceShip;
}
-(void)addRock{
    CGFloat a = rand() * 1.0 / RAND_MAX;
    SKSpriteNode *rock = [[SKSpriteNode alloc]initWithColor:[SKColor brownColor] size:CGSizeMake(12, 12)];
    rock.position = CGPointMake(a * self.size.width, self.size.height - 50);
    rock.name = @"rock";
    rock.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:rock.size center:CGPointMake(0.5, 0.5)];
    rock.physicsBody.dynamic = YES;
    rock.physicsBody.categoryBitMask = 2; //岩石的标识符为2
    rock.physicsBody.contactTestBitMask = 1; //可以与1类物理体碰撞
    [self addChild:rock];
}

-(SKSpriteNode *)newLight{
    SKSpriteNode *light = [[SKSpriteNode alloc]initWithColor:[SKColor yellowColor] size:CGSizeMake(2, 2)];
    SKAction *blink = [SKAction sequence:@[[SKAction fadeOutWithDuration:0.5],
                                           [SKAction fadeInWithDuration:0.5]]];
    SKAction *blinkForever = [SKAction repeatActionForever:blink];
    [light runAction:blinkForever];
    return light;
}
-(void)mouseDown:(NSEvent *)event{
    SKSpriteNode *node = (SKSpriteNode *)[self childNodeWithName:@"MySpace"];
    if (node != nil) {
        CGPoint point = [event locationInNode:[self childNodeWithName:@"background"]];
        NSPoint point2 = [event locationInWindow];
        NSLog(@"直接从背景上获取的点击坐标x = %f， y = %f",point2.x,point2.y);
    SKAction *move = [SKAction moveTo:point duration:0.2];
    [node runAction:move completion:^{
        NSLog(@"从背景Node上获取的点击坐标x = %f y = %f",point.x,point.y);
        NSLog(@"移动完成");
    }];
    }
}
-(void)mouseDragged:(NSEvent *)event{
    SKNode *node = [self childNodeWithName:@"MySpace"];
    if (node != nil) {
//        CGPoint point = [event locationInWindow];
       CGPoint point = [event locationInNode:[self childNodeWithName:@"background"]];
//        point = CGPointMake(point.x + 10, point.y );
        SKAction *move = [SKAction moveTo:point duration:0.05];
        [node runAction:move];
    }
}
-(void)didSimulatePhysics{
    [self enumerateChildNodesWithName:@"rock" usingBlock:^(SKNode * _Nonnull node, BOOL * _Nonnull stop) {
        if (node.position.y < 0) {
            [node removeFromParent];
        }
    }];
}
-(void)keyDown:(NSEvent *)event{
    SKSpriteNode *node = (SKSpriteNode *)[self childNodeWithName:@"MySpace"];
    CGPoint location = node.position;
    CGPoint point;
    switch (event.keyCode) {
        case 0x7B:
            NSLog(@"左");
            point = CGPointMake(location.x - 2, location.y);
            break;
        case 0x7C:
            NSLog(@"右");
            point = CGPointMake(location.x + 2, location.y);
            break;
        case 0x7D:
            NSLog(@"下");
            point = CGPointMake(location.x, location.y - 2);
            break;
        case 0x7E:
            NSLog(@"上");
            point = CGPointMake(location.x, location.y + 2);
            break;
            
        default:
            break;
    }
    SKAction *move = [SKAction moveTo:point duration:0.01];
    [node runAction:move];
}
#pragma mark 碰撞检测
-(void)didBeginContact:(SKPhysicsContact *)contact{
    SKSpriteNode *planeNode = (SKSpriteNode *)[contact.bodyA node];
    SKSpriteNode *rockNode = (SKSpriteNode *)[contact.bodyB node];
    if ([planeNode.name isEqualToString:@"rock"]) {
        planeNode = (SKSpriteNode *)[contact.bodyB node];
        rockNode = (SKSpriteNode *)[contact.bodyA node];
    }
    if (planeNode.physicsBody.categoryBitMask == 1 && rockNode.physicsBody.categoryBitMask == 2) {
//        [rockNode removeAllActions];
//        [rockNode removeFromParent];
//        [planeNode removeAllActions];
//        SKAction *fade = [SKAction fadeInWithDuration:1.0];
//        [planeNode runAction:fade];
//        [planeNode removeFromParent];
//        for (SKSpriteNode *node in self.children) {
//            [node removeAllActions];
//        }
//        SKLabelNode *gameover = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
//        gameover.text = @"GAME OVER!";
//        gameover.fontSize = 55;
//        gameover.position = CGPointMake(200, 600);
//        gameover.fontColor = [SKColor whiteColor];
//        [self removeAllActions];
//        [self addChild:gameover];
        
    }
}
@end
