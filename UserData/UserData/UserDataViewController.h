//
//  UserDataViewController.h
//  UserData
//
//  Created by luowei on 14-5-22.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserDataViewController : UIViewController<UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UIImageView *image;
- (IBAction)save:(id)sender;
- (IBAction)chooseImage:(id)sender;

@end
