//
//  MyAnnotation.h
//  MapDemo
//
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyAnnotation : NSObject<MKAnnotation>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

- (id)initWithLati:(CGFloat)lati andLongi:(CGFloat)longi;

@end
