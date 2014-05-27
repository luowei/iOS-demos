//
//  QuizViewController.m
//  Quiz Game
//
//  Created by luowei on 14-5-21.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController ()

@end

@implementation QuizViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    currentQuestion = 0;
    questions = [[NSMutableArray alloc]init];
    answers = [[NSMutableArray alloc]init];
    
    if([self.title isEqualToString:@"iOS"]){
        [questions addObject:@" Can the iPhone 4 use Sir?"];
        [answers addObject:@"No"];
    }else{
        [questions addObject:@"How many movies?"];
        [answers addObject:@"6"];
    }
    
    [_question setText:[questions objectAtIndex:currentQuestion]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}	

- (IBAction)keyboard:(id)sender {
    [sender resignFirstResponder];
}		

- (IBAction)checkAnswer:(id)sender {
    NSString *myGuess = [_answer text];
    if(currentQuestion <= [questions count] -1){
        if([myGuess isEqualToString:[answers objectAtIndex:currentQuestion]]){
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Correct" message:@"Good Job" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            [alert show];
        }else{
            UIAlertView *alert1 = [[UIAlertView alloc]initWithTitle:@"Wrong" message:@"Bad User" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            [alert1 show];
        }
    }
}



@end
