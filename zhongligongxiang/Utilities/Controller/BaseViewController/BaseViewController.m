//
//  BaseViewController.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

-(UIActivityIndicatorView *)activityView{
    
    if (!_activityView) {
        _activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _activityView.backgroundColor = [UIColor clearColor];
        CGAffineTransform transform = CGAffineTransformMakeScale(2, 2);
        _activityView.transform = transform;
        _activityView.frame = CGRectMake(SCREEN_WIDTH/2 - 40, self.superHeight/2 - 40, 80, 80);
    }
    return _activityView;
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    
    [self.navigationController.navigationBar setBarTintColor:RGB(255, 255, 255)];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];//导航栏标题字体颜色
    
    [self setNeedsStatusBarAppearanceUpdate];
    
    [self addAbsover];
    
}

-(void)addAbsover{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(coverWindowClick) name:@"click" object:nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializeBaseAppearance];
    
    [self initializeBaseDataSource];
}

-(void)initializeBaseAppearance{
    
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)initializeBaseDataSource{
    
    
}

#pragma mark - **********  Activity   *********

-(void)startActivityView{
    
    [self.view addSubview:self.activityView];
    
    [self.activityView startAnimating];
}

-(void)stopActivityView{
    
    [self.activityView stopAnimating];
    
    [self.activityView removeFromSuperview];
    
}
#pragma mark - ********** Setter / Getter **********

- (PublicManager *)publicManager
{
    if (!_publicManager)
    {
        _publicManager = [PublicManager shareInstance];
    }
    
    return _publicManager;
}



-(void)coverWindowClick{
    
    
}


@end
