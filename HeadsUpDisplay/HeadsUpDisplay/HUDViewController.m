//
//  HUDViewController.m
//  HeadsUpDisplay
//
//  Created by luowei on 14-5-24.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import "HUDViewController.h"
#import "HUDView.h"

@interface HUDViewController ()
- (IBAction)buttonPressed:(id)sender;

@end

@implementation HUDViewController

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
    HUDView *hudView = [HUDView hudInView:self.view];
    
    hudView.text = @"YAY!";
}
@end
