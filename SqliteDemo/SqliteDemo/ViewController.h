//
//  ViewController.h
//  SqliteDemo
//
//  Created by luowei on 14-6-19.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface ViewController : UIViewController{
    sqlite3 * db;
}

@end
