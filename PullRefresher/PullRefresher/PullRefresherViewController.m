//
//  PullRefresherViewController.m
//  PullRefresher
//
//  Created by luowei on 14-5-23.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import "PullRefresherViewController.h"

@interface PullRefresherViewController ()

@end

@implementation PullRefresherViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSMutableArray *names = [[NSMutableArray alloc]initWithObjects:@"维唯为为",@"唯为社区",@"linus", nil];
    self.array = names;
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc]init];
    [refreshControl addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
    
    self.refreshControl = refreshControl;
}

-(void)refresh{
    [self.array addObject:@"我是新加载的，Year !	"];
    [self.tableView reloadData];
    
    [self.refreshControl endRefreshing];
}

#pragma mark - Table View Datasource Method
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.array count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID =  @"cellID" ;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if(cell==nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [self.array objectAtIndex:indexPath.row];
    return cell;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
