	//
//  WVViewController.h
//  WebView
//
//  Created by luowei on 14-5-21.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WVViewController : UIViewController<UIWebViewDelegate>{
    
}
@property (strong, nonatomic) IBOutlet UILabel *labelLoading;
@property (strong, nonatomic) IBOutlet UIWebView *viewWeb;



@end
