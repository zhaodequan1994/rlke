//
//  HomePageViewController.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/10.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "HomePageViewController.h"

//Controllers
#import "LoginViewController.h"

@interface HomePageViewController ()

@end

@implementation HomePageViewController

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    if (self.tabBarController.tabBar.hidden) {
        self.tabBarController.tabBar.hidden = NO;
    }
    
    self.navigationController.navigationBar.hidden = YES;
    
}
-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBar.hidden = NO;
    
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
    
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)initializeDataSource{
    
}

-(void)btnClick{
    
    self.hidesBottomBarWhenPushed = YES;
    
    LoginViewController * lvc = [[LoginViewController alloc] init];
    
    [self.navigationController pushViewController:lvc animated:YES];
    
    self.hidesBottomBarWhenPushed = NO;

}
@end
