//
//  CameraViewController.m
//  CameraFlash
//
//  Created by luowei on 14-5-22.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import "CameraViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface CameraViewController ()

@end

@implementation CameraViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    _onOff = NO;
    UIButton *button = [[UIButton alloc]init];
    [self buttonPressed:button];
}

- (IBAction)buttonPressed:(id)sender {
    
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if(device != nil){
        if(!_onOff){
            
            if([device hasTorch] && [device hasFlash]){
                [device lockForConfiguration:nil];
                
                [device setTorchMode:AVCaptureTorchModeOn];
                [device setFlashMode:AVCaptureFlashModeOn];
                
                [device unlockForConfiguration];
                
                [sender setTitle:@"Turn Off" forState:UIControlStateNormal];
            }
            
        }else{	
            
            if([device hasTorch] && [device hasFlash]){
                [device lockForConfiguration:nil];
                
                [device setTorchMode:AVCaptureTorchModeOff];
                [device setFlashMode:AVCaptureFlashModeOff];
                
                [device unlockForConfiguration];
                
                [sender setTitle:@"Turn On" forState:UIControlStateNormal];
            }
            
        }
    }
    _onOff = !_onOff;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
