//
//  AppDelegate.h
//  CoreData
//
//  Created by luowei on 14-5-29.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property(readonly,strong,nonatomic) NSManagedObjectContext * managedObjectContext;
@property(readonly,strong,nonatomic) NSManagedObjectModel * managedObjectModel;
@property(readonly,strong,nonatomic) NSPersistentStoreCoordinator * persistentStoreCoordinator;

-(void)saveContext;
-(NSURL *)applicationDocumentsDirectory;

@end
