//
//  ViewController.m
//  PlaySound
//
//  Created by luowei on 14-6-13.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController (){
//    SystemSoundID soundNotifyID;
    SystemSoundID soundLogonID;
}

@end

@implementation ViewController
- (IBAction)playNotify:(id)sender {
//    AudioServicesPlaySystemSound(soundNotifyID);
    
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"iphone" ofType:@"mp3"];
    SystemSoundID soundID;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath: soundPath], &soundID);
    AudioServicesPlaySystemSound (soundID);
}
- (IBAction)playLogon:(id)sender {
    AudioServicesPlaySystemSound(soundLogonID);
    
//    AVAudioPlayer *audioPlayer;
//    NSString *audioPath = [[NSBundle mainBundle] pathForResource:@"Logon" ofType:@"mp3"];
//    NSURL *audioURL = [NSURL fileURLWithPath:audioPath];
//    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioURL error:nil];
//    [audioPlayer play];
//    sleep(15);
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
//    NSURL *notifyURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Notify" ofType:@"mp3"]];
//    AudioServicesCreateSystemSoundID((__bridge CFURLRef)notifyURL, &soundNotifyID);
    
    NSURL *logonURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Logon" ofType:@"mp3"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)logonURL, &soundLogonID);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
