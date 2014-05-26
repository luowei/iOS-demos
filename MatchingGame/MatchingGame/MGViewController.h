//
//  MGViewController.h
//  MatchingGame
//
//  Created by luowei on 14-5-24.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MGViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *buttonOneMoved;
@property (weak, nonatomic) IBOutlet UIButton *buttonTwoMoved;
@property (weak, nonatomic) IBOutlet UIButton *buttonThreeMoved;
@property (weak, nonatomic) IBOutlet UIButton *buttonFourMoved;
@property (weak, nonatomic) IBOutlet UIButton *buttonFiveMoved;

- (IBAction)buttonOne:(id)sender;
- (IBAction)buttonTwo:(id)sender;
- (IBAction)buttonThree:(id)sender;
- (IBAction)buttonFour:(id)sender;
- (IBAction)buttonFive:(id)sender;
@end
