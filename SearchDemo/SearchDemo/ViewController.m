//
//  ViewController.m
//  SearchDemo
//
//  Created by luowei on 14-5-30.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(strong,nonatomic)NSArray *array;
@property(strong,nonatomic)NSArray *searchResults;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	self.array = [[NSArray alloc]initWithObjects:@"rootls.com",@"luowei",@"维唯为为",@"linus",@"rowin",@"admin",@"test", nil];
    self.searchResults = [[NSArray alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Table View Method
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(tableView == self.searchDisplayController.searchResultsTableView){
        return [self.searchResults count];
    }else{
        return [self.array count];
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID =  @"CellID" ;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if(cell==nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    if(tableView == self.searchDisplayController.searchResultsTableView){
        cell.textLabel.text = [self.searchResults objectAtIndex:indexPath.row];
    }else{
        cell.textLabel.text = [self.array objectAtIndex:indexPath.row];
    }
    return cell;
}

#pragma Search Methods
-(void)filterContentForSearchText:(NSString *)searchText scope:(NSString *)scope{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF beginswith[c] %@",searchText];
    self.searchResults = [self.array filteredArrayUsingPredicate:predicate];
    
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{
    [self filterContentForSearchText:searchString scope:[[self.searchDisplayController.searchBar scopeButtonTitles]objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    return YES;
}


@end
