//
//  QuizGameViewController.h
//  Quiz Game
//
//  Created by luowei on 14-5-21.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuizGameViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>	{
    NSMutableArray *quizzes;
}

@end
