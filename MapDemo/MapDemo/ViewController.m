//
//  ViewController.m
//  MapDemo
//
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

#import "ViewController.h"
#import "AnnotationVIew.h"
#import "MyAnnotation.h"
@interface ViewController ()<CLLocationManagerDelegate,MKMapViewDelegate>
{
    IBOutlet MKMapView *myMapView;
    IBOutlet UILabel *label;
    CLLocation *currentLocation;
    CLLocation *destLocation;
}
- (IBAction)calculateDistance:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //构建一个位置管理器
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    [locationManager setDelegate:self];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyNearestTenMeters];
    [locationManager setDistanceFilter:5];
    [locationManager startUpdatingLocation];
    
    //获得经纬度
    CGFloat lati = locationManager.location.coordinate.latitude;
    CGFloat longi = locationManager.location.coordinate.longitude;
    //NSLog(@"lati = %f longi = %f",lati,longi);
    label.text = [NSString stringWithFormat:@"经度:%.2f纬度:%.2f",lati,longi];
    myMapView.showsUserLocation = YES;
    myMapView.delegate = self;
    currentLocation = [[CLLocation alloc] initWithLatitude:lati longitude:longi];
    
    //构建我的覆盖物(注释)
    MyAnnotation *annotation = [[MyAnnotation alloc] initWithLati:29.55987 andLongi:106.586609];
    //把注释添加到地图上
    [myMapView addAnnotation:annotation];
    
    //通过geocode获得地名
    CLGeocoder *geocode = [[CLGeocoder alloc] init];
    [geocode reverseGeocodeLocation:locationManager.location completionHandler:^(NSArray *placemarks, NSError *error) {
        NSLog(@"error = %@",error.description);
        NSLog(@"placemarks = %@",placemarks[0]);
        //label.text = placemarks[0];
        CLPlacemark *placeMark = placemarks[0];
        NSLog(@"placeMark = %@",[placeMark.addressDictionary objectForKey:@"State"]);
        label.text = placeMark.name;
    }];
    
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    
    if ([annotation isKindOfClass:[MKUserLocation class]])
    {
        return nil;
    }
    
    AnnotationView *annotationView = (AnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"identidier"];
    if (annotationView == nil)
    {
        annotationView = [[AnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"identidier"];
    }
    annotationView.textLabel.text = @"解放碑";
    return annotationView;
}


- (IBAction)calculateDistance:(id)sender
{
   
    CLLocation *dest = [[CLLocation alloc] initWithLatitude:29.559721 longitude:106.583176];
    
    CLLocationDistance distance = [currentLocation distanceFromLocation:dest];
    label.text = [NSString stringWithFormat:@"两点之间的距离为:%.2f km",distance/1000];//@"两点之间的距离为:%.2fkm";
}

/*
*   函数名:distanceFromOnePlace:toOtherPlace:
*   参数名:currentPlace(当前位置),destiPlace(目标位置)
*   参数类型:CLLocation对象
*   返回值:两点之间的直线距离(CLLocationDistance类型数据)
*
*/

- (CLLocationDistance)distanceFromCurrentPlace:(CLLocation *)currentPlace toDestiPlace:(CLLocation *)destiPlace
{
    return [currentPlace distanceFromLocation:destiPlace];
}

/*
 *   函数名:getPlaceInfomationFromLocation:result:
 *   参数名:location(位置),info(位置信息)
 *   参数类型:CLLocation对象,CLGeocodeCompletionHandler block对象
 *   返回值:无
 *
 */

- (void)getPlaceInfomationFromLocation:(CLLocation *)location result:(CLGeocodeCompletionHandler)info
{
    CLGeocoder *geocode = [[CLGeocoder alloc] init];
    [geocode reverseGeocodeLocation:location completionHandler:info];
}


/*
 *   函数名:getCurrentLocation
 *   参数名:无
 *   参数类型:无
 *   返回值:返回当前的位置信息
 *
 */

- (CLLocation*)getCurrentLocation
{
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyNearestTenMeters];
    [locationManager setDistanceFilter:5];
    [locationManager startUpdatingLocation];
    return locationManager.location;
}

/*
 *   函数名:isLocationServiceAvailable
 *   参数名:无
 *   参数类型:无
 *   返回值:BOOL类型,判断当前定位服务是否可用
 *
 */

- (BOOL)isLocationServiceAvailable
{
    return [CLLocationManager locationServicesEnabled];
}

/*
 *   函数名:addAnnotation: toMapView:
 *   参数名:annotation(标注),mapView(地图)
 *   参数类型:MKAnnotation对象,MKMapView对象
 *   返回值:无
 *
 */

- (void)addAnnotation:(id <MKAnnotation>)annotation toMapView:(MKMapView *)mapView
{
    [mapView addAnnotation:annotation];
}

/*
 *   函数名:loadDataWithURL: params: completion:
 *   参数名:url(后端服务器接口地址),params(客户端向服务端传递的参数,比如经纬度,职位搜索关键词等)
 *   参数类型:MKAnnotation对象,MKMapView对象
 *   返回值:从后端服务器获得的数据(json格式)
 *
 */


- (void)loadDataWithURL:(NSString *)url params:(NSDictionary *)params completion:(Completion)result
{
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
