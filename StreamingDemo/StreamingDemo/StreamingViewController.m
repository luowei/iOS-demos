//
//  StreamingViewController.m
//  StreamingDemo
//
//  Created by luowei on 14-5-22.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import "StreamingViewController.h"

@interface StreamingViewController ()

@end

@implementation StreamingViewController

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

- (IBAction)play:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://v.youku.com/v_show/id_XNzE0OTQ3OTky.html"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_video loadRequest:request];
}
@end
