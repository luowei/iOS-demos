//
//  SectionsViewController.m
//  SectionsDemo
//
//  Created by luowei on 14-5-23.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import "SectionsViewController.h"

@interface SectionsViewController ()

@end

@implementation SectionsViewController

- (void)viewDidLoad{
    [super viewDidLoad];
	
    NSString *path = [[NSBundle mainBundle]pathForResource:@"names" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc]initWithContentsOfFile:path];
    
    self.names = dict;
    
    NSArray *array = [[_names allKeys] sortedArrayUsingSelector:@selector(compare:)];
    self.keys = array;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [_keys count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString *key = [_keys objectAtIndex:section];
    NSArray *names = [_names objectForKey:key];
    
    return [names count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *key = [_keys objectAtIndex:indexPath.section];
    NSArray *name = [_names objectForKey:key];
    
    static NSString *cellID = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if(cell==nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [name objectAtIndex:indexPath.row];
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *key = [_keys objectAtIndex:section];
    return key;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
