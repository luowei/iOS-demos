//
//  PListsViewController.m
//  PListsDemo
//
//  Created by luowei on 14-5-23.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import "PListsViewController.h"

@interface PListsViewController ()

@end

@implementation PListsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"Property List.plist"];
    
    if(![[NSFileManager defaultManager] fileExistsAtPath:plistPath]){
        plistPath = [[NSBundle mainBundle] pathForResource:@"Property List" ofType:@"plist"];
    }
    NSData *plistXML = [[NSFileManager defaultManager]contentsAtPath:plistPath];
    
    NSString *errorDesc = nil;
    NSPropertyListFormat format;
    
    NSDictionary *temp = (NSDictionary *)[NSPropertyListSerialization propertyListFromData:plistXML mutabilityOption:NSPropertyListMutableContainersAndLeaves format:&format errorDescription:&errorDesc];
    if(!temp){
        NSLog(@"Error Read plist:%@, format:%d",errorDesc,format);
    }
    
//    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Property List" ofType:@"plist"];
//    NSDictionary *temp = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    
    personName = [temp objectForKey:@"name"];
    phoneNumbers = [NSMutableArray arrayWithArray:[temp objectForKey:@"phone"]];
    
    _name.text = personName;
    _phone.text = [phoneNumbers objectAtIndex:0];
    
}

- (IBAction)save:(id)sender {
    personName = _name.text;
    phoneNumbers = [[NSMutableArray alloc]initWithCapacity:1];
    [phoneNumbers addObject:_phone.text];
    
    NSDictionary *plistDict = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:personName,phoneNumbers, nil] forKeys:[NSArray arrayWithObjects:@"name",@"phone", nil]];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"Property List.plist"];

    NSFileManager *fileManager = [NSFileManager defaultManager];
    if(![fileManager fileExistsAtPath:plistPath]){
        plistPath = [[NSBundle mainBundle] pathForResource:@"Property List" ofType:@"plist"];
    }

    NSString *error = nil;
    NSData *plistData = [NSPropertyListSerialization dataFromPropertyList:plistDict format:NSPropertyListXMLFormat_v1_0 errorDescription:&error];
    if(plistData && [fileManager isWritableFileAtPath:plistPath]){
        [plistData writeToFile:plistPath atomically:YES];
        
//        [fileManager changeFileAttributes:[NSDictionary dictionaryWithObject:[NSDate date] forKey:NSFileModificationDate] atPath:plistPath];
    }else{
        NSLog(@"Error in SaveData: %@",error);
    }
    
//    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Property List" ofType:@"plist"];
//    [plistDict writeToFile:plistPath atomically:YES];
    
}

- (IBAction)textFieldReturn:(id)sender {
    [sender resignFirstResponder];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}
@end
