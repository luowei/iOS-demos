//
//  PDViewController.m
//  PassingData
//
//  Created by luowei on 14-5-26.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import "PDViewController.h"
#import "NewViewController.h"

@interface PDViewController ()
- (IBAction)chooseImage:(id)sender;

@end

@implementation PDViewController{
    UIImage *newImage;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)chooseImage:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"NewViewController"]){
        NewViewController *destViewController = segue.destinationViewController;
        destViewController.theNewImage = newImage;
    }	
}

#pragma Image piker Delegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo{
    newImage = image;
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}



@end


