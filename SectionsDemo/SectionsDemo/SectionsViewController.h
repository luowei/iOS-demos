//
//  SectionsViewController.h
//  SectionsDemo
//
//  Created by luowei on 14-5-23.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SectionsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(strong,nonatomic)NSDictionary *names;
@property(strong,nonatomic)NSArray *keys;

@end
