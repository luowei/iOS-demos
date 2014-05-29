//
//  ViewController.m
//  CompassDemo
//
//  Created by luowei on 14-5-29.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *headingLabel;
@property(retain,nonatomic)CLLocationManager *locationManager;
@property(retain,nonatomic)CLHeading *currentHeading;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.currentHeading = [[CLHeading alloc]init];
    self.locationManager = [[CLLocationManager alloc]init];
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.headingFilter = 1;
    self.locationManager.delegate = self;
    [self.locationManager startUpdatingHeading];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Location Manager Method

-(void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading{
    self.currentHeading = newHeading;
    self.headingLabel.text = [NSString stringWithFormat:@"%d",(int)newHeading.magneticHeading];
}

-(BOOL)locationManagerShouldDisplayHeadingCalibration:(CLLocationManager *)manager{
    if(self.currentHeading == nil){
        return YES;
    }else{
        return NO;
    }
}

@end
