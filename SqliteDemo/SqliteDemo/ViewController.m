//
//  ViewController.m
//  SqliteDemo
//
//  Created by luowei on 14-6-19.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import "ViewController.h"

#define DBNAME    @"personinfo.sqlite"
#define NAME      @"name"
#define AGE       @"age"
#define ADDRESS   @"address"
#define TABLENAME @"PERSONINFO"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
	
    //打开数据库,NSSearchPathForDirectoriesInDomains第三个参数设置为YES表示展开成完整的路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documents = [paths objectAtIndex:0];
    NSString *databasePath = [documents stringByAppendingPathComponent:DBNAME];
    if(sqlite3_open([databasePath UTF8String], &db)!= SQLITE_OK){
        sqlite3_close(db);
        NSLog(@"打开数据库失败");
    }
    NSLog(@"databasePath:%@",databasePath);
    
    //创建数据表PERSONINFO的语句
    NSString *sqlCreateTable = @"CREATE TABLE IF NOT EXISTS PERSONINFO
        (ID INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER, address TEXT)";
    [self execSql:sqlCreateTable];

    //插入数据
    NSString *sql1 = [NSString stringWithFormat:@"INSERT INTO '%@' ('%@', '%@', '%@') VALUES ('%@', '%@', '%@')",
                      TABLENAME, NAME, AGE, ADDRESS, @"某大哥", @"23", @"黄埔区"];
    NSString *sql2 = [NSString stringWithFormat:@"INSERT INTO '%@' ('%@', '%@', '%@') VALUES ('%@', '%@', '%@')",
                      TABLENAME, NAME, AGE, ADDRESS, @"某小弟", @"20", @"浦东新区"];
    [self execSql:sql1];
    [self execSql:sql2];
    
    //查询数据库并打印数据
    NSString *sqlQuery = @"SELECT * FROM PERSONINFO";
    sqlite3_stmt * statement;
    
    if (sqlite3_prepare_v2(db, [sqlQuery UTF8String], -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            char *name = (char*)sqlite3_column_text(statement, 1);
            NSString *nsNameStr = [[NSString alloc]initWithUTF8String:name];
            int age = sqlite3_column_int(statement, 2);
            char *address = (char*)sqlite3_column_text(statement, 3);
            NSString *nsAddressStr = [[NSString alloc]initWithUTF8String:address];
            NSLog(@"name:%@  age:%d  address:%@",nsNameStr,age, nsAddressStr);
        }
    }
    sqlite3_close(db);
}

//创建数据表
-(void)execSql:(NSString *)sql{
    char *err;
    if (sqlite3_exec(db, [sql UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSLog(@"数据库操作数据失败!");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
