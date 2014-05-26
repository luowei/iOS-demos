//
//  CustomPickerViewController.h
//  CustomPicker
//
//  Created by luowei on 14-5-24.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomPickerViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *picker;

- (IBAction)buttonPressed:(id)sender;
@end
