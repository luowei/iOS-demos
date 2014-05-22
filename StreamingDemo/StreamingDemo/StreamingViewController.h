//
//  StreamingViewController.h
//  StreamingDemo
//
//  Created by luowei on 14-5-22.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StreamingViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *video;

- (IBAction)play:(id)sender;

@end
