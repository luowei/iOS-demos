//
//  TimelineViewController.m
//  Timeline
//
//  Created by luowei on 14-5-24.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import "TimelineViewController.h"
#import <Accounts/Accounts.h>
#import <Social/Social.h>

@interface TimelineViewController ()
@property(strong,nonatomic)NSArray *array;
@end

@implementation TimelineViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [self weiboTimeline];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Table View Data Source Methods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_array count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    NSDictionary *weibo = _array[indexPath.row];
    cell.textLabel.text = weibo[@"text"];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)weiboTimeline{
    ACAccountStore *account = [[ACAccountStore alloc]init];
    
    ACAccountType *accountType = [account accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTencentWeibo];
    NSLog(@"=======accountType:%@",accountType);
    
    [account requestAccessToAccountsWithType:accountType options:@{ACTencentWeiboAppIdKey:@"801509936"} completion:^(BOOL granted,NSError *error){
        if(granted == YES){
            NSArray *arrayAccount = [account accountsWithAccountType:accountType];
            if([arrayAccount count] > 0){
                ACAccount *tencentAccount = [arrayAccount lastObject];
                
                NSURL *requestURL = [NSURL URLWithString:@"https://open.t.qq.com/api/statuses/user_timeline"];
                
                NSMutableDictionary *parameters = [[NSMutableDictionary alloc]init];
                [parameters setObject:@"json" forKey:@"format"];
                [parameters setObject:@"10" forKey:@"reqnum"];
                [parameters setObject:@"0" forKey:@"pageflag"];
                [parameters setObject:@"0" forKey:@"pagetime"];
                [parameters setObject:@"0" forKey:@"lastid"];
                [parameters setObject:@"0" forKey:@"type"];
                [parameters setObject:@"0" forKey:@"contenttype"];
                
                SLRequest *post = [SLRequest requestForServiceType:SLServiceTypeTencentWeibo requestMethod:SLRequestMethodGET URL:requestURL parameters:parameters];
                post.account = tencentAccount;
                
                
                [post performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
                    id jsonObj = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingAllowFragments error:&error];
                    NSLog(@"jsonObj:%@",jsonObj);
//                    id jsonObj2 = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableLeaves error:&error];
//                    NSLog(@"jsonObj2:%@",jsonObj2);
                    
                    
                    self.array = jsonObj[@"data"][@"info"];
                    if(self.array.count != 0){
                        dispatch_async(dispatch_get_main_queue(), ^{
                            [self.tableView reloadData];
                        });
                    }
                }];
                
            }
        }else{
            NSLog(@"---error:%@",[error localizedDescription]);
        }
        
    }];
    
}


//-(void)tencentWeibo{
//    
//    ACAccountStore *account=[[ACAccountStore alloc] init];  //本机账户数据库, 储存weibo,facebook等各种账户
//    ACAccountType *accountType=[account accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTencentWeibo];
//    NSLog(@"accountType:%@",accountType);
//    
//    
//    [account requestAccessToAccountsWithType:accountType options:@{ACTencentWeiboAppIdKey:@"801410926"} completion:^(BOOL granted, NSError *error) {
//        if (granted) {
//            NSLog(@"认证通过");
//            
//            if (!self.content.text) {
//                
//                UIAlertView *a=[[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入要发分享的内容" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//                [a show];
//                return ;
//                
//            }
//            NSArray *arrayAccounts=[account accountsWithAccountType:accountType];
//            NSLog(@"arrayAccounts:%@",arrayAccounts);
//            if ([arrayAccounts count]>0) {
//                //                NSLog(@"认证通过");
//                SLRequest *request = [SLRequest  requestForServiceType:SLServiceTypeTencentWeibo
//                                      
//                                                         requestMethod:SLRequestMethodPOST
//                                      
//                                                                   URL:[NSURL URLWithString:@"https://open.t.qq.com/api/t/add_pic"]
//                                      
//                                                            parameters:@{@"content": self.content.text}];
//                NSLog(@"account:%@",[[arrayAccounts objectAtIndex:0] class]);
//                request.account=[arrayAccounts objectAtIndex:0] ;
//                
////                [request addMultipartData:self.imageData withName:@"pic" type:@"multipart/form-data" filename:@"a.png"];
//                [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
//                    id jsonObj = [NSJSONSerialization JSONObjectWithData:responseData
//                                  
//                                                                 options:NSJSONReadingAllowFragments error:&error];
//                    NSLog(@"jsonObj:%@",jsonObj);
//                    if (!error) {
//                        
//                        NSLog(@"%@",[jsonObj objectForKey:@"statuses"])  ;  //key更具api json决定
//                        UIAlertView *a=[[UIAlertView alloc] initWithTitle:@"提示" message:@"分享成功" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//                        [a show];
//                        
//                    }
//                    
//                }];
//                
//            }else{
//                
//                UIAlertView *a=[[UIAlertView alloc] initWithTitle:@"提示" message:@"无效账户,请到设置界面设置账号信息" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//                [a show];
//            }
//            
//            
//        }
//    }];
//    
//}


//-(void)sinaWeibo{
//    ACAccountStore *account=[[ACAccountStore alloc] init];  //本机账户数据库, 储存weibo,facebook等各种账户
//    ACAccountType *accountType=[account accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierSinaWeibo];
//    NSLog(@"accountType:%@",accountType);
//    [account requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *error) {
//        if (granted) {
//            NSLog(@"认证通过");
//            
//            if (!self.content.text) {
//                
//                UIAlertView *a=[[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入要发分享的内容" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//                [a show];
//                
//                return ;
//            }
//            NSArray *arrayAccounts=[account accountsWithAccountType:accountType];
//            NSLog(@"arrayAccounts:%@",arrayAccounts);
//            if ([arrayAccounts count]>0) {
//                //                NSLog(@"认证通过");
//                SLRequest *request = [SLRequest  requestForServiceType:SLServiceTypeSinaWeibo
//                                      
//                                                         requestMethod:SLRequestMethodPOST
//                                      
//                                                                   URL:[NSURL URLWithString:@"https://upload.api.weibo.com/2/statuses/upload.json"]
//                                      
//                                                            parameters:@{@"status": self.content.text}];
//                NSLog(@"account:%@",[[arrayAccounts objectAtIndex:0] class]);
//                request.account=[arrayAccounts objectAtIndex:0] ;
//                
////                [request addMultipartData:self.imageData withName:@"pic" type:@"multipart/form-data" filename:@"a.png"];
//                [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
//                    id jsonObj = [NSJSONSerialization JSONObjectWithData:responseData
//                                  
//                                                                 options:NSJSONReadingAllowFragments error:&error];
//                    NSLog(@"jsonObj:%@",jsonObj);
//                    if (!error) {
//                        
//                        NSLog(@"%@",[jsonObj objectForKey:@"statuses"])  ;  //key更具api json决定
//                        UIAlertView *a=[[UIAlertView alloc] initWithTitle:@"提示" message:@"分享成功" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//                        [a show];
//                        
//                    }
//                    
//                }];
//                
//            }else{
//                
//                UIAlertView *a=[[UIAlertView alloc] initWithTitle:@"提示" message:@"无效账户,请到设置界面设置账号信息" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//                [a show];
//            }
//            
//        }
//    }];
//    
//}


- (IBAction)sendWeibo:(id)sender {
}
@end
