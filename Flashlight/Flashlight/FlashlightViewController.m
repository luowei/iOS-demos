//
//  FlashlightViewController.m
//  Flashlight
//
//  Created by luowei on 14-5-21.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import "FlashlightViewController.h"

@interface FlashlightViewController ()

@end

@implementation FlashlightViewController

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

- (IBAction)buttonClicked:(id)sender {
    
    UIButton *button=(UIButton *)sender;
    if(!_onOff){
        [self.view setBackgroundColor:[UIColor whiteColor]];
        [button setTitle:@"Off" forState:UIControlStateNormal];
    }else{
        [self.view setBackgroundColor:[UIColor blackColor]];
        [button setTitle:@"On" forState:UIControlStateNormal];
    }
    _onOff = !_onOff;
    
}
@end
