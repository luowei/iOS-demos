//
//  HUDView.h
//  HeadsUpDisplay
//
//  Created by luowei on 14-5-24.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HUDView : UIView
@property(strong,nonatomic)NSString *text;

+(HUDView *)hudInView:(UIView *) view;
@end
