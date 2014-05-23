//
//  StreamingMusicViewController.h
//  StreamingMusic
//
//  Created by luowei on 14-5-23.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StreamingMusicViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *music;
- (IBAction)play:(id)sender;

@end
