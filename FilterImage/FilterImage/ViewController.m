//
//  ViewController.m
//  FilterImage
//
//  Created by luowei on 14-5-30.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

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

- (IBAction)filter:(UISlider *)sender {
    CIImage *beginImage = [CIImage imageWithData:UIImagePNGRepresentation(self.imageView.image)];
    CIContext *context = [CIContext contextWithOptions:nil];
    
    CIFilter *filter = [CIFilter filterWithName:@"CISepiaTone" keysAndValues:kCIInputImageKey,beginImage,@"inputIntensity", [NSNumber numberWithFloat:sender.value],nil];
    CIImage *outputImage = [filter outputImage];
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
    self.imageView.image = [UIImage imageWithCGImage:cgimg];
    
    CGImageRelease(cgimg);
    if(sender.value==0){
        self.imageView.image = [UIImage imageNamed:@"me.png"];
    }
}
@end
