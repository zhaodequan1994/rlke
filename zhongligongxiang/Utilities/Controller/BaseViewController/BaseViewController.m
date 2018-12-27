//
//  BaseViewController.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@property (nonatomic, strong)UIImageView *navigationLineImageView;


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

- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    //内省
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        
        return (UIImageView *)view;
    }
    
    for (UIView *subview in view.subviews) {
        
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}


-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    
    [self.navigationController.navigationBar setBarTintColor:RGB(255, 255, 255)];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];//导航栏标题字体颜色
    
    [self setNeedsStatusBarAppearanceUpdate];
    
    self.navigationLineImageView.hidden = YES;
    
    [self addAbsover];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    self.navigationLineImageView.hidden = NO;

}

-(void)addAbsover{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(coverWindowClick) name:@"click" object:nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializeBaseAppearance];
    
    [self initializeBaseDataSource];
    
    [self initNavigationBar];//导航栏底部黑线处理
}

-(void)initializeBaseAppearance{
    
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)initializeBaseDataSource{
    
    
}

-(void)initNavigationBar{
    
    _navigationLineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    
    // 系统默认YES 可能你得到的颜色与实际的不匹配  因为默认为YES是有透明度的
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
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

#pragma mark  ------- other   ---------

-(UserModel *)userModel{
    
    return [self.publicManager.userManager enCodeNSUserDefaultsUserInfo];
}

-(BOOL)isLogin
{
    
    return self.userModel.login.length > 0 ? YES : NO;
}



@end
