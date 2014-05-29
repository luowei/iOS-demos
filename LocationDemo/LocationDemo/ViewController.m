//
//  ViewController.m
//  LocationDemo
//
//  Created by luowei on 14-5-29.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController () <CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *latitude;
@property (weak, nonatomic) IBOutlet UILabel *longitude;
@property (weak, nonatomic) IBOutlet UILabel *address;
- (IBAction)buttonPressed:(id)sender;

@end

@implementation ViewController{
    CLLocationManager *manager;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    manager = [[CLLocationManager alloc]init];
    geocoder = [[CLGeocoder alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender {
    manager.delegate = self;
    manager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [manager startUpdatingLocation];
}

#pragma CLLocationManagerDelegate Methods
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"Error:%@",error);
    NSLog(@"Failed to get location! :(");
}

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    
    NSLog(@"Location:%@",newLocation);
    
    CLLocation *currentLocation = newLocation;
    if(currentLocation!=nil){
        self.latitude.text = [NSString stringWithFormat:@"%.8f",currentLocation.coordinate.latitude];
        self.longitude.text = [NSString stringWithFormat:@"%.8f",currentLocation.coordinate.longitude];
    }
    
    //    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
    //        if(error == nil && [placemarks  count] > 0){
    //            placemark = [placemarks lastObject];
    //
    //            self.address.text = [NSString stringWithFormat:@"%@\n %@\n %@ %@\n%@ %@",
    //                                 placemark.country,
    //                                 placemark.administrativeArea,
    //                                 placemark.locality,placemark.postalCode,
    //                                 placemark.thoroughfare,placemark.subThoroughfare];
    //        }else{
    //            NSLog(@"%@",error.debugDescription);
    //        }
    //    }];
    
    [geocoder geocodeAddressString:@"Palolem Beach, Goa, India" completionHandler:^(NSArray* placemarks, NSError* error){
        if (!error) {
            
            for (CLPlacemark* aPlacemark in placemarks)
            {
                NSLog(@"place--%@", [aPlacemark locality]);
                NSLog(@"lat--%f\nlong--%f",aPlacemark.location.coordinate.latitude,aPlacemark.location.coordinate.longitude);
            }
            placemark = [placemarks lastObject];
            
            self.address.text = [NSString stringWithFormat:@"%@\n %@\n %@\n %@\n %@",
                                 placemark.country,
                                 placemark.administrativeArea,
                                 placemark.locality,
                                 placemark.thoroughfare,
                                 placemark.subThoroughfare];
        }
        else{
            
            NSLog(@"error--%@",[error localizedDescription]);
        }
    }];
    
}


//-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
//
//}

@end
