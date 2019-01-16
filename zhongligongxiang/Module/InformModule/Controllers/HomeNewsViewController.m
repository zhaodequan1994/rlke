//
//  HomeNewsViewController.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/10.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "HomeNewsViewController.h"

@interface HomeNewsViewController ()

@end

@implementation HomeNewsViewController

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
    
    NSLog(@"%@,%@,%@",self.userModel.phone,self.userModel.password,self.userModel.account);
}

@end
