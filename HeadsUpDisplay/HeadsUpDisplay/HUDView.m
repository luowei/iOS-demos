//
//  HUDView.m
//  HeadsUpDisplay
//
//  Created by luowei on 14-5-24.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import "HUDView.h"

@implementation HUDView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+(HUDView *)hudInView:(UIView *) view{
    
    HUDView *hudView = [[HUDView alloc]initWithFrame:view.bounds];
    //不透明
    hudView.opaque = NO;
    
    [view addSubview:hudView];
    view.userInteractionEnabled = NO;
    
    return hudView;
}

-(void)drawRect:(CGRect)rect{
    const CGFloat boxWidth = 96.0f;
    const CGFloat boxHeight = 96.0f;
    
    CGRect boxRect = CGRectMake(roundf(self.bounds.size.width - boxWidth)/2.0f, roundf(self.bounds.size.height - boxHeight)/2.0f, boxWidth, boxHeight);
    
    UIBezierPath *roundRect = [UIBezierPath bezierPathWithRoundedRect:boxRect cornerRadius:10.0f];
    [[UIColor colorWithWhite:0.0f alpha:0.75f] setFill];
    [roundRect fill];
    
    [[UIColor whiteColor] set];
    
    UIFont *font = [UIFont boldSystemFontOfSize:16.0f];
    CGSize textSize = [self.text sizeWithFont:font];
    CGPoint textPoint = CGPointMake(self.center.x - roundf(textSize.width/2.0f), self.center.y-roundf(textSize.height/2.0f)+boxHeight/4.0f);
    [self.text drawAtPoint:textPoint withFont:font];
}

//显示动画
-(void)showAnimated{
    self.alpha = 0.0f;
    self.transform = CGAffineTransformMakeScale(1.3f, 1.3f);
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3f];
    
    self.alpha = 1.0f;
    self.transform = CGAffineTransformIdentity;
    
    [UIView commitAnimations];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
