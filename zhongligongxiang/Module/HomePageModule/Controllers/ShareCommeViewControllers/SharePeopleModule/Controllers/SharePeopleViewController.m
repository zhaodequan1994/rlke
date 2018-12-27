//
//  SharePeopleViewController.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/25.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "SharePeopleViewController.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>


@interface SharePeopleViewController ()<MAMapViewDelegate>

@property (nonatomic,strong) MAMapView * maMapView;

@end

@implementation SharePeopleViewController

-(MAMapView *)maMapView{
    
    if (!_maMapView) {
        _maMapView = [[MAMapView alloc] initWithFrame:SCREEN_RECT];
        _maMapView.delegate = self;
        _maMapView.showsUserLocation = YES;
        _maMapView.zoomLevel = 15;
        _maMapView.userTrackingMode = MAUserTrackingModeFollow;

    }
    return _maMapView;
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    
}
-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializeBaseNavigationAppearance];
    [self initializeAppearance];
    [self initializeDataSource];
    
}

-(void)initializeBaseNavigationAppearance{
    
    
}

-(void)initializeAppearance{
    
    
    ///地图需要v4.5.0及以上版本才必须要打开此选项（v4.5.0以下版本，需要手动配置info.plist）
    [AMapServices sharedServices].enableHTTPS = YES;
    [AMapServices sharedServices].apiKey = GAODE_APIKEY;
    
    ///把地图添加至view
    [self.view addSubview:self.maMapView];

}

-(void)initializeDataSource{
    
    
    [[PublicManager shareInstance].locationManager startUpdateingLocation];
}

@end
