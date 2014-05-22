//
//  AlertViewController.m
//  AlertDemo
//
//  Created by luowei on 14-5-22.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import "AlertViewController.h"

@interface AlertViewController ()

@end

@implementation AlertViewController

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
    
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"这是一个弹出窗"
                          message:@"祝你好运，这是弹出窗的消息"
                          delegate:self
                          cancelButtonTitle:@"ok"
                          otherButtonTitles:nil];
    
    [alert show];
}
@end
