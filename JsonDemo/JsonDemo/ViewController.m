//
//  ViewController.m
//  JsonDemo
//
//  Created by luowei on 14-5-30.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()

@property(strong,nonatomic)NSDictionary *posts;
@property(strong,nonatomic)NSMutableArray *post;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //Get Request
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://note.youdao.com/yws/public/note/c316d3c1acc0452d8cd6d5d599824e13?keyfrom=public" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.posts = (NSDictionary *)responseObject;
        self.post = self.posts[@"content"];
        NSLog(@"JSON: %@", self.post);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
