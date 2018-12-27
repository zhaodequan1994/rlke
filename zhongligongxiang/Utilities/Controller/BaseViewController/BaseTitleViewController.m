//
//  BaseTitleViewController.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "BaseTitleViewController.h"

@interface BaseTitleViewController ()

@end

@implementation BaseTitleViewController

-(UIButton *)leftButton{
    
    if (!_leftButton) {
        _leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        [_leftButton addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
        [_leftButton setImage:[UIImage imageNamed:@"Base_left_back"] forState:UIControlStateNormal];
        _leftButton.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    }
    
    return _leftButton;
}

-(UIButton *)rightBtn{
    if (!_rightBtn) {
        _rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        [_rightBtn addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
        _rightBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [_rightBtn setTitleColor:RGB(51, 51, 51) forState:UIControlStateNormal];
        _rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        _rightBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        
    }
    
    return _rightBtn;
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden = YES;
    
    [self initNavigationBarIteam];
}
-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializeMainAppearance];
    
    [self initializeMainDataSource];
    
}

-(void)initializeMainAppearance{
    
   
}
-(void)initializeMainDataSource{
    
}

-(void)initNavigationBarIteam{
    
    UIBarButtonItem * leftBtnItem = [[UIBarButtonItem alloc] initWithCustomView:self.leftButton];
    self.navigationItem.leftBarButtonItem = leftBtnItem;
    
    UIBarButtonItem * rightBtnItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightBtn];
    self.navigationItem.rightBarButtonItem = rightBtnItem;
    
}

#pragma mark   **********  event clcik ********

-(void)leftClick{
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)rightBtnClick{
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
