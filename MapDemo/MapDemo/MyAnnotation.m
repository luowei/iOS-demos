//
//  MyAnnotation.m
//  MapDemo
//
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "MyAnnotation.h"

@implementation MyAnnotation 


- (id)initWithLati:(CGFloat)lati andLongi:(CGFloat)longi
{
    self = [super init];
    if (self)
    {
        _coordinate = CLLocationCoordinate2DMake(lati, longi);
    }
    return self;
}

@end
