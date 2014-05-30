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
    [manager GET:@"https://raw.githubusercontent.com/luowei/iOS-demos/master/JsonDemo/doc/example.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
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
