//
//  ViewController.m
//  NotifyDemo
//
//  Created by luowei on 14-5-27.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (IBAction)buttonPressed:(id)sender;
@end

@implementation ViewController

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

- (IBAction)buttonPressed:(id)sender {
    UILocalNotification *localNotification = [[UILocalNotification alloc]init];
    
    localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:10];
    localNotification.alertBody = @"号外！号外！新消息来了 --维唯为为";
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];	
}
@end
