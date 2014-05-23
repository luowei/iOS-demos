//
//  ImagerFilterViewController.h
//  ImageFilter
//
//  Created by luowei on 14-5-23.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImagerFilterViewController : UIViewController<UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *image;
- (IBAction)chooseImage:(id)sender;
- (IBAction)save:(id)sender;
- (IBAction)filter:(id)sender;

@end
