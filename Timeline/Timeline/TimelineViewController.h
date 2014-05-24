//
//  TimelineViewController.h
//  Timeline
//
//  Created by luowei on 14-5-24.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimelineViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

//@property (weak, nonatomic) IBOutlet UITextView *content;
//@property (weak, nonatomic) IBOutlet UIImageView *imageData;

- (IBAction)sendWeibo:(id)sender;

@end
