//
//  UserDataViewController.m
//  UserData
//
//  Created by luowei on 14-5-22.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import "UserDataViewController.h"

@interface UserDataViewController ()

@end

@implementation UserDataViewController

- (void)viewDidLoad{
    [super viewDidLoad];
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *name = [defaults objectForKey:@"name"];
    NSData *imageData = [defaults objectForKey:@"image"];
    
    UIImage *image = [UIImage imageWithData:imageData];
    self.name.text = name;
    self.image.image = image;
}

- (IBAction)save:(id)sender {
    [self.name resignFirstResponder];
    
    NSString *name = self.name.text;
    UIImage *image = self.image.image;
    NSData *imageData = UIImageJPEGRepresentation(image, 100);
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:name forKey:@"name"];
    [defaults setObject:imageData forKey:@"image"];
    
    [defaults synchronize];
}

- (IBAction)chooseImage:(id)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:nil];
}

#pragma mark - Image Picker Delegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo{
    self.image.image = image;
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

@end
