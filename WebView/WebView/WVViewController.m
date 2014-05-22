//
//  WVViewController.m
//  WebView
//
//  Created by luowei on 14-5-21.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import "WVViewController.h"

@interface WVViewController ()

@end

@implementation WVViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [_viewWeb setDelegate:self];
    
    NSString *fullUrl = @"http://www.baidu.com";
    NSURL *url = [NSURL URLWithString:fullUrl];
    
    NSURLRequest *requestOjb = [NSURLRequest requestWithURL:url];
    [_viewWeb loadRequest:requestOjb];	
    
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    [_labelLoading setHidden:NO];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [_labelLoading setHidden:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    
}

@end
