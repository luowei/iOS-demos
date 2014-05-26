//
//  DictionaryViewController.m
//  NSDictionary
//
//  Created by luowei on 14-5-23.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import "DictionaryViewController.h"

@interface DictionaryViewController ()

@end

@implementation DictionaryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //创建Dictionary
    NSDictionary *fruit = [NSDictionary dictionaryWithObjectsAndKeys:
                           [NSNumber numberWithInt:1],@"苹果",
                           [NSNumber numberWithInt:2],@"香蕉",
                           [NSNumber numberWithInt:3],@"桔子", nil];
    NSLog(@"%@",fruit[@"苹果"]);
    NSLog(@"%@",[fruit objectForKey:@"桔子"]);
    
    
    NSArray *keys = [NSArray arrayWithObjects:@"兰博基尼",@"法拉帝",@"马萨拉帝", nil];
    NSArray *valus = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3],nil];
    
    NSDictionary *cars = [NSDictionary dictionaryWithObjects:valus forKeys:keys];
    
    if([fruit isEqualToDictionary:cars]){	
        NSLog(@"It's Not Works! :(");
    }else{
        NSLog(@"It's Works");
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
