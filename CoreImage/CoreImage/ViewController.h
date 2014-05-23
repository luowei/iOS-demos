//
//  ViewController.h
//  CoreImage
//
//  Created by  mac.
//  Copyright (c)  __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imgV;
@property (strong, nonatomic) IBOutlet UISlider *slider;
@property (strong, nonatomic) IBOutlet UISlider *slider2;
@property (strong, nonatomic) IBOutlet UISlider *slider3;

- (IBAction)changeValue:(id)sender;
- (IBAction)changeValue2:(id)sender;
- (IBAction)changeValue3:(id)sender;

- (IBAction)loadPhoto:(id)sender;
- (IBAction)savePhoto:(id)sender;
- (IBAction)resetImage:(id)sender;

@end
