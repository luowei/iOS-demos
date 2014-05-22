//
//  DPViewController.m
//  DatePickDemo
//
//  Created by luowei on 14-5-22.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import "DPViewController.h"

@interface DPViewController ()

@end

@implementation DPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [_datePicker setDate:[NSDate date] animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender {
    NSDate *selected = [_datePicker date];
    NSString *message = [[NSString alloc]initWithFormat:@"选择的日期时间是：%@",selected];
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"日期时间	" message:message delegate:self cancelButtonTitle:@"ok" otherButtonTitles: nil];
    [alert show];
    
}
@end
