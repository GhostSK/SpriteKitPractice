//
//  FlyingBirds.m
//  gameOnMac
//
//  Created by 胡杨林 on 16/11/23.
//  Copyright © 2016年 胡杨林. All rights reserved.
//

#import "FlyingBirds.h"

@interface FlyingBirds()

@property(nonatomic,strong)SKAction *hindermove;
@property(nonatomic,strong)NSTimer *mapmoveTimer;
@property(nonatomic,strong)NSTimer *scoreTimer;
@property(nonatomic,strong)SKLabelNode *timeLabel;
@property(nonatomic,strong)SKLabelNode *scoreLabel;
@property BOOL isgameover;
@property NSInteger time;
@property NSInteger score;
@property CGFloat interval;

@end


@implementation FlyingBirds

-(instancetype)initWithSize:(CGSize)size{
    FlyingBirds *scene = [super initWithSize:size];
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:CGRectMake(self.frame.origin.x - 500, self.frame.origin.y, self.size.width + 500, self.size.height)];
    self.physicsWorld.gravity = CGVectorMake(0.0, -4.9);
    
    self.interval = 4.0;
    self.time = 0;
    SKSpriteNode *node = [[SKSpriteNode alloc]init];
    node.size = self.size;
    node.position = CGPointZero;  //设置自身锚点在父节点的坐标
    node.anchorPoint = CGPointZero;//设定自身锚点在自身的坐标，默认为正中心。
    //只设置父节点会导致子节点的正中心重合在父节点的左下方，使得只有第一象限的子节点能够出现在视图上
    node.zPosition = 0.0;
    node.name = @"background";
    [node setColor:[SKColor colorWithRed:96.0/255.0 green:151.0/255.0 blue:254.0/255.0 alpha:1.0]];
    [scene addChild:node];
    return scene;
}
-(void)buildTimeAndScore{
    self.score = 0;
    self.timeLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    self.timeLabel.text = [NSString stringWithFormat:@"TIME: %3ld",(long)self.time];
    self.timeLabel.fontSize = 40;
    self.timeLabel.position = CGPointMake(120, 50);
    self.timeLabel.fontColor = [SKColor blackColor];
    
    [self.scene addChild:self.timeLabel];
    
    self.scoreLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %7ld",(long)self.score];
    self.scoreLabel.fontSize = 40;
    self.scoreLabel.position = CGPointMake(850, 50);
    self.scoreLabel.fontColor = [SKColor blackColor];
    [self.scene addChild:self.scoreLabel];
    
    
}

-(void)didMoveToView:(SKView *)view{
    self.isgameover = NO;
    _mapmoveTimer = [NSTimer scheduledTimerWithTimeInterval:self.interval target:self selector:@selector(mapAction) userInfo:nil repeats:YES];
    [_mapmoveTimer fire];
    self.hindermove = [SKAction moveByX:-400 y:0 duration:self.interval];
    [self buildBird];
    _scoreTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(ChangeInterval) userInfo:nil repeats:YES];
    [_scoreTimer fire];
    [self buildTimeAndScore];
}
-(void)ChangeInterval{
    
    self.time += 1;
    self.score += 100;
    self.timeLabel.text = [NSString stringWithFormat:@"TIME: %3ld",(long)self.time];
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %7ld",(long)self.score];
    if (self.time > 200) {
        self.interval = 2.0;
    }else if (self.time > 100){
        self.interval = 2.8;
    }else if (self.time > 50){
        self.interval = 3.4;
    }else{
        self.interval = 4.0;
    }


}

-(void)mouseDown:(NSEvent *)event{
//    CGPoint point = [event locationInNode:[self childNodeWithName:@"background"]];
//    NSLog(@"x = %f y = %f",point.x, point.y);
    SKSpriteNode *bird = (SKSpriteNode *)[self childNodeWithName:@"bird"];
    if (bird) {
//        [bird.physicsBody applyForce:CGVectorMake(0.0, 490)];
//        [bird.physicsBody applyForce:CGVectorMake(0.0, 9.8) atPoint:CGPointMake(CGRectGetMidX(bird.frame), 768)];
        [bird.physicsBody applyImpulse:CGVectorMake(0.0, 200)];
    }
}
-(void)rightMouseDown:(NSEvent *)event{
    SKSpriteNode *bird = (SKSpriteNode *)[self childNodeWithName:@"bird"];
    if (bird) {
        [bird.physicsBody applyImpulse:CGVectorMake(40.0, 0.0)];
    }
}


-(void)mapAction{
    [self movehinder];
    [self buildHinder];
}
-(void)buildBird{
    SKSpriteNode *bird = [[SKSpriteNode alloc]initWithImageNamed:@"birds.png"];
    bird.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:bird.size];
    bird.physicsBody.dynamic = YES;
    bird.name = @"bird";
    bird.physicsBody.categoryBitMask = 1;
    bird.physicsBody.contactTestBitMask = 2;
    bird.anchorPoint = CGPointMake(0.5, 0.5);
    bird.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    bird.physicsBody.restitution = 0.8;
    [self addChild:bird];
    
}


-(void)buildHinder{
    CGFloat position = rand() * 0.8 / RAND_MAX;
//    NSLog(@"%f",position);
    SKSpriteNode *upHinder = [[SKSpriteNode alloc]initWithImageNamed:@"hinder-up.png"];
    upHinder.name = @"hinder";
    SKSpriteNode *downHinder = [[SKSpriteNode alloc]initWithImageNamed:@"hinder-down.png"];
    downHinder.name = @"hinder";
    upHinder.size = CGSizeMake(128, 768 * position);
    upHinder.anchorPoint = CGPointMake(0.0, 1.0);
    downHinder.size = CGSizeMake(128, 768 * (0.8 - position));
    downHinder.anchorPoint = CGPointMake(0.0, 0.0);
    upHinder.position = CGPointMake(1024, 768);
    downHinder.position = CGPointMake(1024, 0);
    upHinder.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:upHinder.size center:CGPointMake(upHinder.anchorPoint.x + upHinder.size.width / 2, upHinder.anchorPoint.y - upHinder.size.height / 2)];
    upHinder.physicsBody.dynamic = NO;
    upHinder.physicsBody.categoryBitMask = 2;
    upHinder.physicsBody.contactTestBitMask = 1;
    downHinder.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:downHinder.size center:CGPointMake(downHinder.anchorPoint.x + downHinder.size.width / 2, downHinder.anchorPoint.y + downHinder.size.height / 2)];
    downHinder.physicsBody.dynamic = NO;
    downHinder.physicsBody.categoryBitMask = 2;
    downHinder.physicsBody.contactTestBitMask = 1;
    [self addChild:upHinder];
    [self addChild:downHinder];
    if (self.timeLabel) {
        [self.timeLabel removeFromParent];
        [self.scene addChild:self.timeLabel];
    }
    if (self.scoreLabel) {
        [self.scoreLabel removeFromParent];
        [self addChild:self.scoreLabel];
    }
    
                                 
    
}
-(void)movehinder{
    [self enumerateChildNodesWithName:@"hinder" usingBlock:^(SKNode * _Nonnull node, BOOL * _Nonnull stop) {
        [node runAction:self.hindermove];
    }];
}

-(void)didSimulatePhysics{
    [self enumerateChildNodesWithName:@"hinder" usingBlock:^(SKNode * _Nonnull node, BOOL * _Nonnull stop) {
        if (node.position.x < -128) {
            [node removeFromParent];
        }
    }];
    //当障碍物向左移出屏幕时，移除节点节约性能
    SKSpriteNode *bird = (SKSpriteNode *)[self childNodeWithName:@"bird"];
    if (bird.position.x < -300 && !self.isgameover) {
        self.isgameover = YES;
        for (SKSpriteNode *node in self.children) {
            [node removeAllActions];
        }
        [self.mapmoveTimer invalidate];
        [_scoreTimer invalidate];
        SKLabelNode *gameover = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        gameover.text = @"GAME OVER!";
        gameover.fontSize = 55;
        gameover.position = CGPointMake(200, 600);
        gameover.fontColor = [SKColor blackColor];
        [self addChild:gameover];
    }
    
}

@end
