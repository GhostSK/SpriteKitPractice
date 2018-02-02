//
//  ViewController.m
//  AVPLAYER
//
//  Created by 胡杨林 on 2018/1/15.
//  Copyright © 2018年 胡杨林. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "MediaManager.h"

@interface ViewController ()<AVAudioPlayerDelegate>

@property(nonatomic, strong)AVAudioPlayer *pl;
@property(nonatomic, strong)AVPlayer *pl2;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9])|(14[0,0-9])|(17[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    BOOL uy = [phoneTest evaluateWithObject: @"18955226633"];
    if (uy) {
        NSLog(@"444");
    }else{
        NSLog(@"555");
    }
    
    
    /*
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Music01.mp3" ofType:nil];
    NSURL *url = [NSURL fileURLWithPath:path];  //重点 本地连接加载方式，不要使用URLWithString
    self.pl = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    self.pl.delegate = self;
    self.pl.volume = 1.0;
    self.pl.currentTime = 0;
    self.pl.numberOfLoops = 10;
    [self.pl prepareToPlay];
    [self.pl play];
    //网络媒体要记得开启网络权限
    NSURL *url2 = [NSURL URLWithString:@"http://vfx.mtime.cn/Video/2015/07/04/mp4/150704102229172451_480.mp4"];
    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"05.mp4" ofType:nil];
    NSURL *url3 = [NSURL fileURLWithPath:path2];
    AVPlayerItem *item = [[AVPlayerItem alloc] initWithURL:url];
    self.pl2 = [[AVPlayer alloc] initWithPlayerItem:item];
    AVPlayerLayer *layer = [AVPlayerLayer playerLayerWithPlayer:self.pl2];
    layer.videoGravity = AVLayerVideoGravityResize;
    layer.frame = CGRectMake(0, 0, 200, 200);
    layer.backgroundColor = [UIColor blackColor].CGColor;
    [self.view.layer addSublayer:layer];
    [self.pl2 prepareForInterfaceBuilder];
    [self.pl2 play];
     */
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Music01.mp3" ofType:nil];
    [[MediaManager shareInstance] playlocalMediaFileWithPath:path];
//    [[MediaManager shareInstance] playOnlineMediaFileWithUrlStr:@"http://vfx.mtime.cn/Video/2015/07/04/mp4/150704102229172451_480.mp4"];
//    [[MediaManager shareInstance] playlocalMediaFileWithPath:path];
    [[MediaManager shareInstance] setMediaViewWithSuperview:self.view MediaViewFrame:CGRectMake(0, 0, 200, 200)];
    [self.view addSubview:[[MediaManager shareInstance] getSliderWithFrame:CGRectMake(20, 200, 150, 40)]];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [[MediaManager shareInstance] play];
//    [[MediaManager shareInstance] removeMediaView];
    [[MediaManager shareInstance] getTotalPlayTime];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
