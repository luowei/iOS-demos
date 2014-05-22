//
//  EmailViewController.m
//  EmailDemo
//
//  Created by luowei on 14-5-22.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import "EmailViewController.h"

@interface EmailViewController ()

@end

@implementation EmailViewController

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

- (IBAction)buttonTapped:(id)sender {
    
    if([MFMailComposeViewController canSendMail]){
        MFMailComposeViewController *mail = [[MFMailComposeViewController alloc]init];
        mail.mailComposeDelegate = self;
        [mail setSubject:@"唯为论坛"];
      
        NSArray *toRecipients = [NSArray arrayWithObjects:@"745054025@qq.com",nil];
        [mail setToRecipients:toRecipients];
        
        NSString *emailBody = @"不要忘记对唯为社区的技术回访，你的观注与支持是我最大的动力";
        [mail setMessageBody:emailBody isHTML:YES];
        
        mail.modalPresentationStyle = UIModalPresentationPageSheet;
        
        [self presentViewController:mail animated:YES completion:nil];
        
    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Run Away !" message:@"Fix It !" delegate:self cancelButtonTitle:@"ok" otherButtonTitles: nil];
        [alert show];
    }
    
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    
    switch (result) {
        case MFMailComposeResultCancelled:
            NSLog(@"Cancelled !");
            break;
            
        case MFMailComposeResultFailed:
            NSLog(@"Failed !");
            break;
            
        case MFMailComposeResultSaved:
            NSLog(@"Saved !");
            break;
            
        case MFMailComposeResultSent:
            NSLog(@"Send !");
            break;
            
        default:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
