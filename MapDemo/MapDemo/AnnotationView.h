//
//  AnnotationVIew.h
//  MapDemo
//
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import <MapKit/MapKit.h>

typedef void(^Completion)(id result);

@interface AnnotationView : MKAnnotationView
@property (strong , nonatomic) UILabel *textLabel;
@end

