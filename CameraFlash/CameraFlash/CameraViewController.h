//
//  CameraViewController.h
//  CameraFlash
//
//  Created by luowei on 14-5-22.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CameraViewController : UIViewController
@property(readwrite) BOOL onOff;

- (IBAction)buttonPressed:(id)sender;

@end
