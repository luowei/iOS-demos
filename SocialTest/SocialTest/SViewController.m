//
//  SViewController.m
//  SocialTest
//
//  Created by luowei on 14-5-21.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import "SViewController.h"
#import <Social/Social.h>

@interface SViewController ()

@end

@implementation SViewController

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

- (IBAction)social:(id)sender {
    
    UIActionSheet *share = [[UIActionSheet alloc]initWithTitle:@"分享好内容" delegate:self cancelButtonTitle:@"" destructiveButtonTitle:@"ok" otherButtonTitles:@"Tweet It!",@"Facebook It!", nil];
    [share showInView:self.view];
    
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if(buttonIndex==1){
        if([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]){
            SLComposeViewController *tweetSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
            [tweetSheet setInitialText:@"维唯为为在IOS 6上集成tweet social"];
            [self presentViewController:tweetSheet animated:YES completion:Nil];
        }else{
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"对不起" message:@"你现在无法使用Tweet,请确定你的设备上已经设置了Tweet的帐户" delegate:self cancelButtonTitle:@"ok" otherButtonTitles: nil];
            [alertView show];
        }
        
    }else if(buttonIndex==2){
        if([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]){
            SLComposeViewController *tweetSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
            [tweetSheet setInitialText:@"维唯为为在IOS 6上集成facebook social"];
            [self presentViewController:tweetSheet animated:YES completion:Nil];
        }else{
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"对不起" message:@"你现在无法使用facebook,请确定你的设备上已经设置了facebook的帐户" delegate:self cancelButtonTitle:@"ok" otherButtonTitles: nil];
            [alertView show];
        }
    }
    
}
@end
