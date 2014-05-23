//
//  ImagerFilterViewController.m
//  ImageFilter
//
//  Created by luowei on 14-5-23.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import "ImagerFilterViewController.h"

@interface ImagerFilterViewController ()

@end

@implementation ImagerFilterViewController

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


#pragma mark - Image Picker Delegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo{
    self.image.image = image;
    [picker dismissViewControllerAnimated:YES completion:nil];
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

//选择图片
- (IBAction)chooseImage:(id)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:nil];
}

//保存图片
- (IBAction)save:(id)sender {
    
    UIGraphicsBeginImageContextWithOptions(_image.bounds.size, NO, 0.0);
    [_image.image drawAsPatternInRect:CGRectMake(0, 0, _image.frame.size.width, _image.frame.size.height)];
    UIImage *saveImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageWriteToSavedPhotosAlbum(saveImage, self, @selector(image:didFinshSavingWithError:contexInfo:), nil);
}

//保存的消息提示
-(void)image:(UIImage *)image didFinshSavingWithError:(NSError *)error contexInfo:(void *)contexInfo{
    if(error != NULL){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"图片无法保存" delegate:self cancelButtonTitle:nil otherButtonTitles:@"close", nil];
        [alert show];
    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Success" message:@"图片保存成功" delegate:self cancelButtonTitle:nil otherButtonTitles:@"close", nil];
        [alert show];
    }
}

//应用filter image
- (IBAction)filter:(id)sender {
    
    CIImage *beginImage = [CIImage imageWithData:UIImageJPEGRepresentation(self.image.image,100)];
    CIContext *context = [CIContext contextWithOptions:nil];
    CIFilter *filter = [CIFilter filterWithName:@"CISepiaTone" keysAndValues:kCIInputImageKey,beginImage,@"inputIntensity",[NSNumber numberWithFloat:0.8], nil];
    CIImage *outputImage = [filter outputImage];
    
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
    self.image.image = [UIImage imageWithCGImage:cgimg];
    CGImageRelease(cgimg);
    
}
@end
