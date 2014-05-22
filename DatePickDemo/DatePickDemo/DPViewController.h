//
//  DPViewController.h
//  DatePickDemo
//
//  Created by luowei on 14-5-22.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DPViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
- (IBAction)buttonPressed:(id)sender;

@end
