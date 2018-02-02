//
//  MediaManager.h
//  AVPLAYER
//
//  Created by 胡杨林 on 2018/1/15.
//  Copyright © 2018年 胡杨林. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>
@interface MediaManager : NSObject

@property(nonatomic, strong) AVPlayerLayer *MediaView;

+(instancetype)shareInstance;
///播放本地媒体文件，path格式为[[NSBundle mainBundle] path
-(void)playlocalMediaFileWithPath:(NSString *)path;
///播放网络文件，参数为完整url字符串格式
-(void)playOnlineMediaFileWithUrlStr:(NSString *)urlstr;
///开始播放
-(void)play;
///暂停播放
-(void)pause;
///获取视频文件播放窗口
-(void)setMediaViewWithSuperview:(UIView *)view
                  MediaViewFrame:(CGRect)frame;
///移除视频文件播放窗口
-(void)removeMediaView;
///获取播放进度滑条，已加入拖动进度功能
-(UISlider *)getSliderWithFrame:(CGRect)frame;

-(NSString *)getNowPlayTime;
///获取总体播放时长
-(NSString *)getTotalPlayTime;

@end
