//
//  EmailViewController.h
//  EmailDemo
//
//  Created by luowei on 14-5-22.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface EmailViewController : UIViewController<MFMailComposeViewControllerDelegate>
- (IBAction)buttonTapped:(id)sender;

@end
