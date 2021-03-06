//
//  LocationManager.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/25.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "LocationManager.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapLocationKit/AMapLocationKit.h>

@interface LocationManager ()<AMapLocationManagerDelegate>

@property (nonatomic,strong) AMapLocationManager * locationManager;

@property (nonatomic,copy) NSString * detialAddress;

@end

@implementation LocationManager

-(AMapLocationManager *)locationManager{
    
    if (!_locationManager) {
        _locationManager = [[AMapLocationManager alloc] init];
        _locationManager.delegate = self;
        _locationManager.distanceFilter = 200;
        _locationManager.locatingWithReGeocode = YES;
    }
    return _locationManager;
}

-(void)registerGaode{
    
    [AMapServices sharedServices].enableHTTPS = YES;
    [AMapServices sharedServices].apiKey = GAODE_APIKEY;

}

-(void)startUpdateingLocation{
    
    [self.locationManager startUpdatingLocation];
}

-(void)stopUpdateingLocation{
    
    [self.locationManager stopUpdatingHeading];
}

-(NSString *)getLocationDetialAddress{
    
    return self.detialAddress;
}

#pragma mark  ------ AMapLocationManagerDelegate  ----

- (void)amapLocationManager:(AMapLocationManager *)manager didUpdateLocation:(CLLocation *)location reGeocode:(AMapLocationReGeocode *)reGeocode
{
    NSLog(@"location:{lat:%f; lon:%f; accuracy:%f}", location.coordinate.latitude, location.coordinate.longitude, location.horizontalAccuracy);
    if (reGeocode)
    {
        NSLog(@"reGeocode:%@", reGeocode);
        
        self.detialAddress = reGeocode.formattedAddress;
    }
}

@end
