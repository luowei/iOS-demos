//
//  PListsViewController.h
//  PListsDemo
//
//  Created by luowei on 14-5-23.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PListsViewController : UIViewController{
    NSString *personName;
    NSMutableArray *phoneNumbers;
}
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *phone;
- (IBAction)save:(id)sender;
- (IBAction)textFieldReturn:(id)sender;

@end
