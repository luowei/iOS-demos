//
//  ViewController.m
//  StopWatch
//
//  Created by luowei on 14-5-26.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *display;
- (IBAction)buttonPressed:(id)sender;

@end

@implementation ViewController{
    bool start;
    NSTimeInterval time;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.display.text = @"0:00";
    start = false;
}

-(void)update{
    if(start == false){
        return;
    }
    NSTimeInterval currentTime = [NSDate timeIntervalSinceReferenceDate];
    
    NSTimeInterval elapsedTime = currentTime - time;
    int minutes = (int)(elapsedTime / 60.0);
    int secends = (int)(elapsedTime = elapsedTime - (minutes	 * 60));
    self.display.text = [NSString stringWithFormat:@"%u:%02u",minutes,secends];
    
    //每0.1秒执行一次update
    [self performSelector:@selector(update) withObject:self afterDelay:0.1];
    
}

- (IBAction)buttonPressed:(id)sender {
    if(start == false){
        start = true;
        time = [NSDate timeIntervalSinceReferenceDate];
        [sender setTitle:@"Stop" forState:UIControlStateNormal];
        
        [self update];
    }else{
        start = false;
        [sender setTitle:@"Start" forState:UIControlStateNormal];
    }
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
