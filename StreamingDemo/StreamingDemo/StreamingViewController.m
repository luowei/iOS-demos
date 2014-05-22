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
    NSURL *url = [NSURL URLWithString:@"http://movies.apple.com/media/us/html5/showcase/2011/demos/apple-html5-demo-tron-us_848x352.m4v"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_video loadRequest:request];
}
@end
