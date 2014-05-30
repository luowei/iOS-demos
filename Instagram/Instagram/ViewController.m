//
//  ViewController.m
//  Instagram
//
//  Created by luowei on 14-5-30.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property(retain,nonatomic)UIDocumentInteractionController *dic;

@end

@implementation ViewController

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

- (IBAction)cameraAction:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    [picker setDelegate:self];
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    picker.allowsEditing = YES;
    [picker presentViewController:picker animated:YES completion:nil];
    
}

- (IBAction)cameraRollAction:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    [picker setDelegate:self];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.allowsEditing = YES;
    [picker presentViewController:picker animated:YES completion:nil];
}


#pragma mark - Image Picker Controller Methods
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage *chosenImage = info[UIImagePickerControllerOriginalImage];
    [self.imageView setImage:chosenImage];
    [picker dismissViewControllerAnimated:YES completion:nil];
    [self performSelector:@selector(shareInstagram) withObject:self afterDelay:1.0f];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void)shareInstagram{
    UIImage *screenShot = self.imageView.image;
    NSString *savePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/Test.lg"];
    [UIImagePNGRepresentation(screenShot) writeToFile:savePath atomically:YES];
    
    CGRect rect = CGRectMake(0, 0, 0, 0);
    NSString *jpgPath =[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/Test.lg"];
    NSURL *igImageHookFile = [[NSURL alloc]initWithString:[[NSString alloc]initWithFormat:@"file://%@",jpgPath]];
    self.dic.UTI = @"com.instagram.photo";
    self.dic = [UIDocumentInteractionController interactionControllerWithURL:igImageHookFile];
    [self.dic presentOpenInMenuFromRect:rect inView:self.view animated:YES];
    NSURL *instagramURL = [NSURL URLWithString:@"instagram://media?id=MEDIA_ID"];
    if([[UIApplication sharedApplication]canOpenURL:instagramURL]){
        [self.dic presentOpenInMenuFromRect:rect inView:self.view animated:YES];
    }else{
        NSLog(@"No Instagram Found ...");
    }
    
}

-(UIDocumentInteractionController *) setUpControllerWithUrl:(NSURL *)fileUrl usingDelegate:(id<UIDocumentInteractionControllerDelegate>)interactionDelegate{
    UIDocumentInteractionController *interactionController = [UIDocumentInteractionController interactionControllerWithURL:fileUrl];
    interactionController.delegate = interactionDelegate;
    return interactionController;
}

@end
