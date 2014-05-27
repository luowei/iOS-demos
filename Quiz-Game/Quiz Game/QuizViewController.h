//
//  QuizViewController.h
//  Quiz Game
//
//  Created by luowei on 14-5-21.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuizViewController : UIViewController{
    NSMutableArray *questions;
    NSMutableArray *answers;
    NSInteger currentQuestion;
}

@property (strong, nonatomic) IBOutlet UILabel *question;
@property (strong, nonatomic) IBOutlet UITextField *answer;
- (IBAction)keyboard:(id)sender;
- (IBAction)checkAnswer:(id)sender;

@end
