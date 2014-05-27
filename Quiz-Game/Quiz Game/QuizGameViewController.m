//
//  QuizGameViewController.m
//  Quiz Game
//
//  Created by luowei on 14-5-21.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import "QuizGameViewController.h"
#import "QuizViewController.h"

@interface QuizGameViewController ()

@end

@implementation QuizGameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    quizzes = [[NSMutableArray alloc]init];
    
    [quizzes addObject:@"iOS"];
    [quizzes addObject:@"Star Wars"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [quizzes count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"MyCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [quizzes objectAtIndex:indexPath.row	];
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    QuizViewController *vc = [[QuizViewController alloc]initWithNibName:@"QuizViewController" bundle:nil];
    
    NSString *quizTitle =[quizzes objectAtIndex:indexPath.row];
    [vc setTitle:quizTitle];
    
    [self.navigationController pushViewController:vc animated:YES];
    
    
}

@end
