//
//  AVAudioPlayer+Tools.m
//  04-播放音乐
//
//  Created by ZhuiYi on 14/12/3.
//  Copyright (c) 2014年 ZhuiYi. All rights reserved.
//

#import "AVAudioPlayer+Tools.h"

static NSMutableDictionary *soundIDs;
static NSMutableDictionary *players;

@interface AVAudioPlayer ()
@end

@implementation AVAudioPlayer (Tools)
+(void)initialize
{
    soundIDs = [NSMutableDictionary dictionary];
    players = [NSMutableDictionary dictionary];
}

#pragma mark - 播放音效
+ (void)playSystemSound:(NSString *)soundName
{
    if (!soundName) {
        return;
    }
    SystemSoundID soundID = (SystemSoundID)soundIDs[soundName];
    if (!soundID) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:soundName withExtension:nil];
        if (!url) {
            return;
        }
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)(url), &soundID);
        soundIDs[soundName] = @(soundID);
    }
    AudioServicesPlayAlertSound(soundID);
}

#pragma mark - 销毁音效
+ (void)disposeSystemSound:(NSString *)soundName
{
    if (!soundName) {
        return;
    }
    SystemSoundID soundID = (SystemSoundID)soundIDs[soundName];
    if (soundID) {
        AudioServicesDisposeSystemSoundID(soundID);
        [soundIDs removeObjectForKey:soundName];
    }
}


#pragma mark - 播放音乐
+ (AVAudioPlayer *)playMusic:(NSString *)musicName
{
    if (!musicName) {
        return nil;
    }
    AVAudioPlayer *player = players[musicName];
    if (!player) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:musicName withExtension:nil];
        if (!url) {
            return nil;
        }
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        [player prepareToPlay];
        players[musicName] = player;
    }
    if (!player.playing) {
        [player play];
    }
    return player;
}

#pragma mark - 暂停播放音乐
+ (void)pauseMusic:(NSString *)musicName
{
    if (!musicName) {
        return;
    }
    AVAudioPlayer *player = players[musicName];
    if (player && player.playing) {
        [player pause];
    }
    else
    {
        NSLog(@"error");
    }
}

#pragma mark - 停止播放音乐
+ (void)stopMusic:(NSString *)musicName
{
    if (!musicName) {
        return;
    }
    AVAudioPlayer *player = players[musicName];
    if (player) {
        [player stop];
        [players removeObjectForKey:musicName];
        player = nil;
    }
    else
    {
        NSLog(@"error");
    }
}

@end
