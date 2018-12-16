//
//  BaseTitleViewController.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "BaseTitleViewController.h"

@interface BaseTitleViewController ()

@property (nonatomic, strong)UIImageView *navigationLineImageView;

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
    
    self.tabBarController.tabBar.hidden = YES;
    
    self.navigationLineImageView.hidden = YES;

    [self initNavigationBarIteam];
}
-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    self.navigationLineImageView.hidden = NO;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializeMainAppearance];
    
    [self initializeMainDataSource];
    
    [self initNavigationBar];//导航栏底部黑线处理
}

-(void)initializeMainAppearance{
    
   
}

-(void)initNavigationBar{
    
    _navigationLineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    
    // 系统默认YES 可能你得到的颜色与实际的不匹配  因为默认为YES是有透明度的
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
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
