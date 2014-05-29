//
//  ViewController.m
//  CoreData
//
//  Created by luowei on 14-5-29.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(strong,nonatomic)NSMutableArray *name;
@property(strong,nonatomic)NSMutableArray *phone;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.name = [[NSMutableArray alloc]init];
    self.phone = [[NSMutableArray alloc]init];
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Contact" inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:entityDesc];
    
    NSManagedObject *matchs = nil;
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    
    if([objects count] == 0){
        NSLog(@"没有找到匹配记录");
    }else{
        for(int i=0;i<[objects count];i++){
            matchs = objects[i];
            [self.name addObject:[matchs valueForKey:@"name"]];
            [self.phone addObject:[matchs valueForKey:@"phone"]];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)add:(id)sender {
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSManagedObject *newContact = [NSEntityDescription insertNewObjectForEntityForName:@"Contact" inManagedObjectContext:context];
    [newContact setValue:@"维唯为为" forKey:@"name"];
    [self.name addObject:@"维唯为为"];
    [newContact setValue:@"15821422479" forKey:@"phone"];
    [self.phone addObject:@"15821422479"];
    
    NSError *error;
    [context save:&error];
    [self.tableView reloadData];
}

#pragma mark - Table View Methods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.name.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID =  @"CellID" ;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if(cell==nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [self.name objectAtIndex:indexPath.row];
return cell;
}






@end
