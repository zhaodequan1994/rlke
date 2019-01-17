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

@property (nonatomic,strong) UIView * addressView;
@property (nonatomic,strong) UIImageView * addressImageView;
@property (nonatomic,strong) UILabel * addressLabel;
@property (nonatomic,strong) MAMapView * maMapView;

@property (nonatomic,assign) CGFloat  addressHeight;;

@end

@implementation SharePeopleViewController

-(CGFloat)addressHeight{
    
    return [PublicMethod getHeightLineWithString:[[PublicManager shareInstance].locationManager getLocationDetialAddress] withWidth:SCREEN_WIDTH withFont:[UIFont systemFontOfSize:14] withLineSpline:2 withHeadLine:0] > 20 ? ([PublicMethod getHeightLineWithString:[[PublicManager shareInstance].locationManager getLocationDetialAddress] withWidth:SCREEN_WIDTH withFont:[UIFont systemFontOfSize:14] withLineSpline:2 withHeadLine:0] + 30) : 50;
}

-(UIView *)addressView{
    
    if (!_addressView) {
        _addressView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.addressHeight)];
    }
    return _addressView;
}

-(UIImageView *)addressImageView{
    
    if (!_addressImageView) {
        _addressImageView = [[UIImageView alloc] initWithFrame:CGRectMake(14, self.addressView.frame.size.height/2 - 7.5, 15, 15)];
        _addressImageView.image = [UIImage imageNamed:@"sharepeople_address"];
    }
    return _addressImageView;
}

-(UILabel *)addressLabel{
    
    if (!_addressLabel) {
        _addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.addressImageView.frame.origin.x + self.addressImageView.frame.size.width + 9, 15, SCREEN_WIDTH - self.addressImageView.frame.origin.x - self.addressImageView.frame.size.width - 9 - 15, [PublicMethod getHeightLineWithString:[[PublicManager shareInstance].locationManager getLocationDetialAddress] withWidth:(SCREEN_WIDTH - self.addressImageView.frame.origin.x - self.addressImageView.frame.size.width - 9 - 15) withFont:[UIFont systemFontOfSize:14] withLineSpline:2 withHeadLine:0])];
        
        [_addressLabel SetLabelText:[[PublicManager shareInstance].locationManager getLocationDetialAddress] textColor:RGB(102, 102, 102) textFont:14 textAlignment:NSTextAlignmentLeft];
        _addressLabel.numberOfLines = 0;
    }
    return _addressLabel;
}

-(MAMapView *)maMapView{
    
    if (!_maMapView) {
        _maMapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, self.addressView.frame.size.height + self.addressImageView.frame.origin.y, SCREEN_WIDTH, SCREEN_HEIGHT - self.addressView.frame.size.height - self.addressImageView.frame.origin.y)];
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
    
    
    NSLog(@"$$$$%@",[[PublicManager shareInstance].locationManager getLocationDetialAddress]);
}

-(void)initializeAppearance{
    
    
//    [self.view addSubview:self.addressView];
//    [self.addressView addSubview:self.addressImageView];
//    [self.addressView addSubview:self.addressLabel];
    ///把地图添加至view
    [self.view addSubview:self.maMapView];

}

-(void)initializeDataSource{
    
    [[PublicManager shareInstance].locationManager startUpdateingLocation];
    
}

@end
