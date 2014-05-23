//
//  StreamingMusicViewController.m
//  StreamingMusic
//
//  Created by luowei on 14-5-23.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import "StreamingMusicViewController.h"

@interface StreamingMusicViewController ()

@end

@implementation StreamingMusicViewController

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
    NSURL *url = [NSURL URLWithString:@"http://kolber.github.io/audiojs/demos/mp3/juicy.mp3"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [_music loadRequest:request];
}
@end
