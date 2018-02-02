//
//  MediaManager.m
//  AVPLAYER
//
//  Created by 胡杨林 on 2018/1/15.
//  Copyright © 2018年 胡杨林. All rights reserved.
//

#import "MediaManager.h"

@interface MediaManager()

@property(nonatomic, strong) AVPlayer *Mediaplayer;  //播放器本体
@property(nonatomic, strong) AVPlayerLayer *layer;   //播放器视图显示layer
@property(nonatomic, strong)NSTimer *MediaTimer;    //播放进度刷新timer
@property(nonatomic, strong)UISlider *slider;       //播放进度滑条
@property(nonatomic, assign) BOOL isplaying;        //播放状态

@end

@implementation MediaManager

+ (instancetype)shareInstance{
    static MediaManager
    *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [self new];
        _instance.Mediaplayer = [[AVPlayer alloc] init];
        _instance.isplaying = NO;
        _instance.Mediaplayer.volume = 0.6;
    });
    return _instance;
}

-(void)playlocalMediaFileWithPath:(NSString *)path{
    NSURL *url = [NSURL fileURLWithPath:path];
    AVPlayerItem *item = [[AVPlayerItem alloc] initWithURL:url];
    [self.Mediaplayer replaceCurrentItemWithPlayerItem:item];
    [self.Mediaplayer play];
    if (self.MediaTimer == nil) {
        self.MediaTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(refreshPlayTime) userInfo:nil repeats:YES];
    }
    
}


-(void)playOnlineMediaFileWithUrlStr:(NSString *)urlstr{
    NSURL *url = [NSURL URLWithString:urlstr];
    AVPlayerItem *item = [[AVPlayerItem alloc] initWithURL:url];
    [self.Mediaplayer replaceCurrentItemWithPlayerItem:item];
    [self.Mediaplayer play];
    if (self.MediaTimer == nil) {
        self.MediaTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(refreshPlayTime) userInfo:nil repeats:YES];
    }
}

-(void)refreshPlayTime{
    CGFloat rate = CMTimeGetSeconds(self.Mediaplayer.currentItem.currentTime) / CMTimeGetSeconds(self.Mediaplayer.currentItem.duration);
    if (self.slider) {
        self.slider.value = rate;
    }
    if (rate == 1.00) {
        [self.Mediaplayer pause];
        [self.Mediaplayer seekToTime:CMTimeMake(0, 1)];
        self.isplaying = NO;
        if (self.slider) {
            self.slider.value = 0.0;
        }
        //播放停止以后销毁计时器，节约资源
        [self.MediaTimer invalidate];
        self.MediaTimer = nil;
    }
}
-(void)play{
    if (self.isplaying) {
        return;
    }else{
        [self.Mediaplayer play];
        self.isplaying = YES;
    }
    if (self.MediaTimer == nil) {
        self.MediaTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(refreshPlayTime) userInfo:nil repeats:YES];
    }
}
-(void)pause{
    if (!self.isplaying) {
        return;
    }else{
        [self.Mediaplayer pause];
        self.isplaying = NO;
    }
}


-(void)setMediaViewWithSuperview:(UIView *)view
                  MediaViewFrame:(CGRect)frame{
    if (self.layer == nil) {
        self.layer = [AVPlayerLayer playerLayerWithPlayer:self.Mediaplayer];
    }
    self.layer.videoGravity = AVLayerVideoGravityResize;
    self.layer.frame = frame;
    self.layer.backgroundColor = [UIColor blackColor].CGColor;
    [view.layer addSublayer:self.layer];
}
-(void)removeMediaView{
    if (self.layer) {
        [self.layer removeFromSuperlayer];
        self.layer = nil;
    }
}

-(UISlider *)getSliderWithFrame:(CGRect)frame{
    if (self.slider == nil) {
        self.slider = [[UISlider alloc] init];
        self.slider.minimumValue = 0.0;
        self.slider.maximumValue = 1.0;
        self.slider.continuous = YES;
        self.slider.minimumTrackTintColor = [UIColor redColor];
        [self.slider setThumbImage:[UIImage imageNamed:@"home_voice_cursor@2x.png"] forState:UIControlStateNormal];
        [self.slider addTarget:self action:@selector(playProcessSliderDidmoved) forControlEvents:UIControlEventValueChanged];
    }
    [self.slider setFrame:frame];
    
    return self.slider;
}

-(void)playProcessSliderDidmoved{
    float time = self.slider.value * CMTimeGetSeconds(self.Mediaplayer.currentItem.duration);
    [self.Mediaplayer seekToTime:CMTimeMake(time, 1)];
}

-(NSString *)getNowPlayTime{
    CGFloat time =CMTimeGetSeconds(self.Mediaplayer.currentItem.currentTime);
    return [NSString stringWithFormat:@"%02d:%02d",((int)time / 60),((int)time % 60)];
}

-(NSString *)getTotalPlayTime{
    float time =CMTimeGetSeconds(self.Mediaplayer.currentItem.duration);
    return [NSString stringWithFormat:@"%02d:%02d",((int)time / 60),((int)time % 60)];
}

@end
