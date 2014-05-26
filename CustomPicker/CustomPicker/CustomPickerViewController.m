//
//  CustomPickerViewController.m
//  CustomPicker
//
//  Created by luowei on 14-5-24.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import "CustomPickerViewController.h"

@interface CustomPickerViewController ()
@property(strong,nonatomic)NSArray *array;

@end

@implementation CustomPickerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSArray *data = [[NSArray alloc]initWithObjects:@"Apple",@"Samsung",@"HTC",@"LG",@"Google",@"Asus",@"Nokia",@"Sony", nil];
    self.array = data;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Picker Data Source Method
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [_array count];
}

#pragma Picker Delegate Method
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [_array objectAtIndex:row];
}

- (IBAction)buttonPressed:(id)sender {
    NSString *selector = [_array objectAtIndex:[_picker selectedRowInComponent:0]];
    NSString *title = [[NSString alloc]initWithFormat:@"你选择了: %@" ,selector];
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title message:@"YEAY !" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [alert show];
}
@end
