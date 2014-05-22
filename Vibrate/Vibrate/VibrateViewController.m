//
//  VibrateViewController.m
//  Vibrate
//
//  Created by luowei on 14-5-22.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import "VibrateViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@interface VibrateViewController ()

@end

@implementation VibrateViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTapped:(id)sender {
    //播放振动
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}
@end
