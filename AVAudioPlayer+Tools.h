//
//  AVAudioPlayer+Tools.h
//  04-播放音乐
//
//  Created by ZhuiYi on 14/12/3.
//  Copyright (c) 2014年 ZhuiYi. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>

@interface AVAudioPlayer (Tools)

/**
 *  播放指定名称的音效
 */
+ (void)playSystemSound:(NSString *)soundName;
/**
 *  销毁指定名称的音效(内存警告时使用)
 */
+ (void)disposeSystemSound:(NSString *)soundName;


/**
 *  播放指定名称的音乐
 */
+ (AVAudioPlayer *)playMusic:(NSString *)musicName;
/**
 *  暂停指定名称的音乐
 */
+ (void)pauseMusic:(NSString *)musicName;
/**
 *  停止指定名称的音乐
 */
+ (void)stopMusic:(NSString *)musicName;


@end
