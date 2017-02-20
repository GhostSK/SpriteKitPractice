//
//  FlyingBirds.m
//  gameOnMac
//
//  Created by 胡杨林 on 16/11/23.
//  Copyright © 2016年 胡杨林. All rights reserved.
//

#import "FlyingBirds.h"
#import "flyingbirdSuccessScene.h"
@interface FlyingBirds()<SKPhysicsContactDelegate>

@property(nonatomic,strong)SKAction *hindermove;
@property(nonatomic,strong)NSTimer *mapmoveTimer;
@property(nonatomic,strong)NSTimer *scoreTimer;
@property(nonatomic,strong)SKLabelNode *timeLabel;
@property(nonatomic,strong)SKLabelNode *scoreLabel;
@property(nonatomic,strong)SKLabelNode *clickLabel;
@property NSInteger click;
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
    self.click = 0;
    self.interval = 4.0;
    self.time = 0;
    self.score = 0;
    self.physicsWorld.contactDelegate = self;
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

    self.timeLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    self.timeLabel.text = [NSString stringWithFormat:@"TIME: %3ld",(long)self.time];
    self.timeLabel.fontSize = 40;
    self.timeLabel.position = CGPointMake(120, 50);
    self.timeLabel.fontColor = [SKColor blackColor];
    self.timeLabel.zPosition = 1.0;
    [self.scene addChild:self.timeLabel];
    
    self.clickLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    self.clickLabel.text = [NSString stringWithFormat:@"click: %4ld",(long)self.click];
    self.clickLabel.fontSize = 40;
    self.clickLabel.position = CGPointMake(460, 50);
    self.clickLabel.fontColor = [SKColor blackColor];
    self.clickLabel.zPosition = 1.0;
    [self.scene addChild:self.clickLabel];
    
    self.scoreLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %7ld",(long)self.score];
    self.scoreLabel.fontSize = 40;
    self.scoreLabel.position = CGPointMake(850, 50);
    self.scoreLabel.fontColor = [SKColor blackColor];
    self.scoreLabel.zPosition = 1.0;
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
    if (self.time >= 300) {
        _score +=200;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %7ld",(long)self.score];
        [self success];
        
        return;
    }
    self.score += 100;
    self.timeLabel.text = [NSString stringWithFormat:@"TIME: %3ld",(long)self.time];
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %7ld",(long)self.score];
    SKSpriteNode *bird = (SKSpriteNode *)[self.scene childNodeWithName:@"bird"];
    if (self.time > 200) {
        self.interval = 2.0;
        self.score += 100;
         bird.physicsBody.restitution = 0.9;
    }else if (self.time > 100){
        self.interval = 2.8;
        self.score += 50;
        bird.physicsBody.restitution = 0.8;
    }else if (self.time > 50){
        self.interval = 3.4;
        self.score += 20;
         bird.physicsBody.restitution = 0.7;
    }else{
        self.interval = 4.0;
    }
    if (bird.position.x < -200 && !self.isgameover) {
        [self gameover];
    }
    

}
-(void)success{
    for (SKSpriteNode *node in self.children) {
        [node removeAllActions];
    }
    flyingbirdSuccessScene *scene = [[flyingbirdSuccessScene alloc]initWithSize:CGSizeMake(1024, 768)];
    scene.position = CGPointZero;
    scene.anchorPoint = CGPointZero;
    SKTransition *trans = [SKTransition doorwayWithDuration:1.0];
    [self.view presentScene:scene transition:trans];
}
-(void)mouseDown:(NSEvent *)event{
    if (!_isgameover) {
        self.click += 1;
        self.score -= 5;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %7ld",(long)self.score];
        self.clickLabel.text = [NSString stringWithFormat:@"click:%4ld",self.click];
        SKSpriteNode *bird = (SKSpriteNode *)[self childNodeWithName:@"bird"];
        if (bird) {
            [bird.physicsBody applyImpulse:CGVectorMake(0.0, 200)];
        }
    }
}
-(void)rightMouseDown:(NSEvent *)event{
    if (!_isgameover) {
        self.click += 1;
        self.score -= 5;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %7ld",(long)self.score];
        self.clickLabel.text = [NSString stringWithFormat:@"click:%4ld",self.click];
        SKSpriteNode *bird = (SKSpriteNode *)[self childNodeWithName:@"bird"];
        if (bird) {
            [bird.physicsBody applyImpulse:CGVectorMake(40.0, 0.0)];
        }
    }
}
-(void)otherMouseDown:(NSEvent *)event{
    NSLog(@"AAAAA");
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
    bird.physicsBody.restitution = 0.6;
    [self addChild:bird];
    
}


-(void)buildHinder{
    CGFloat position = arc4random()%100 / 100.0 * 0.8;
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
    upHinder.physicsBody.contactTestBitMask = 3;
    downHinder.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:downHinder.size center:CGPointMake(downHinder.anchorPoint.x + downHinder.size.width / 2, downHinder.anchorPoint.y + downHinder.size.height / 2)];
    downHinder.physicsBody.dynamic = NO;
    downHinder.physicsBody.categoryBitMask = 2;
    downHinder.physicsBody.contactTestBitMask = 1;
    [self addChild:upHinder];
    [self addChild:downHinder];
    
                                 
    
}
-(void)movehinder{
    [self enumerateChildNodesWithName:@"hinder" usingBlock:^(SKNode * _Nonnull node, BOOL * _Nonnull stop) {
        [node runAction:self.hindermove];
    }];
}

-(void)didSimulatePhysics{
    [self enumerateChildNodesWithName:@"hinder" usingBlock:^(SKNode * _Nonnull node, BOOL * _Nonnull stop) {
        if (node.position.x < -300) {
            [node removeFromParent];
        }
    }];
    //当障碍物向左移出屏幕时，移除节点节约性能
    SKSpriteNode *bird = (SKSpriteNode *)[self childNodeWithName:@"bird"];
    if (bird.position.x < -200 && !self.isgameover) {
    [self gameover];
    }
    
}
-(void)gameover{

        self.isgameover = YES;
        for (SKSpriteNode *node in self.children) {
            [node removeAllActions];
        }
        self.physicsWorld.contactDelegate = nil;
        [self.mapmoveTimer invalidate];
        [_scoreTimer invalidate];
        SKLabelNode *gameover = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        gameover.text = @"GAME OVER!";
        gameover.fontSize = 55;
        gameover.position = CGPointMake(200, 600);
        gameover.fontColor = [SKColor blackColor];
        [self addChild:gameover];
  
}

-(void)didBeginContact:(SKPhysicsContact *)contact{
    
    SKSpriteNode *planeNode = (SKSpriteNode *)[contact.bodyA node];
    SKSpriteNode *rockNode = (SKSpriteNode *)[contact.bodyB node];
    if (planeNode.physicsBody.categoryBitMask == 1 && rockNode.physicsBody.categoryBitMask == 2) {
        self.score -= 10;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %7ld",(long)self.score];
    }
    
}


@end
