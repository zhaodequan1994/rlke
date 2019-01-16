//
//  AuthenSuccendViewController.m
//  zhongligongxiang
//
//  Created by zhaodq on 2019/1/4.
//  Copyright © 2019 zhaodq. All rights reserved.
//

#import "AuthenSuccendViewController.h"

@interface AuthenSuccendViewController ()

@property (nonatomic,strong) UIImageView * headerImageView;

@property (nonatomic,strong) UILabel * titleLabel;
@property (nonatomic,strong) UILabel * subTitleLabel;
@property (nonatomic,strong) UIButton * sureBtn;


@end

@implementation AuthenSuccendViewController

-(UIImageView *)headerImageView{
    
    if (!_headerImageView) {
        _headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 150)/2, 28, 150, 150)];
        if (self.authenType == AuthenTypeSuccess) {
            
            _headerImageView.image = [UIImage imageNamed:@"Personal_authensucces"];

        }else if (self.authenType == AuthenTypeFail){
            
            _headerImageView.image = [UIImage imageNamed:@"Personal_authenfail"];

        }
    }
    return _headerImageView;
}

-(UILabel *)titleLabel{
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, self.headerImageView.frame.origin.y + self.headerImageView.frame.size.height + 35, SCREEN_WIDTH - 20, 18)];
        if (self.authenType == AuthenTypeSuccess) {
            
            [_titleLabel SetLabelText:@"恭喜你认证成功" textColor:RGB(51, 51, 51) textFont:18 textAlignment:NSTextAlignmentCenter];

        }else if (self.authenType == AuthenTypeFail){
            
            [_titleLabel SetLabelText:@"认证未通过" textColor:RGB(51, 51, 51) textFont:18 textAlignment:NSTextAlignmentCenter];

        }

    }
    return _titleLabel;
}
-(UILabel *)subTitleLabel{
    
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, self.titleLabel.frame.origin.y + self.titleLabel.frame.size.height + 10, SCREEN_WIDTH - 20, 18)];
        
        if (self.authenType == AuthenTypeSuccess) {
            
            [_subTitleLabel SetLabelText:@"真实身份认证能有效保护你的资金安全" textColor:RGB(102, 102, 102) textFont:12 textAlignment:NSTextAlignmentCenter];

        }else if (self.authenType == AuthenTypeFail){
            
            [_subTitleLabel SetLabelText:@"请检查信息是否真实有效" textColor:RGB(102, 102, 102) textFont:12 textAlignment:NSTextAlignmentCenter];

        }
    }
    return _subTitleLabel;
}


-(UIButton *)sureBtn{
    
    if (!_sureBtn) {
        _sureBtn = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 160)/2, self.subTitleLabel.frame.origin.y + self.subTitleLabel.frame.size.height + 60, 160, 44)];
        _sureBtn.layer.masksToBounds = YES;
        _sureBtn.layer.cornerRadius = _sureBtn.frame.size.height/2;
        _sureBtn.backgroundColor = RGB(255, 84, 85);
        if (self.authenType == AuthenTypeSuccess) {
            
            [_sureBtn setTitle:@"我知道了" forState:UIControlStateNormal];

        }else if (self.authenType == AuthenTypeFail){
            
            [_sureBtn setTitle:@"重新认证" forState:UIControlStateNormal];

        }
        [_sureBtn setTitleColor:RGB(255, 255, 255) forState:UIControlStateNormal];
        _sureBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [_sureBtn addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureBtn;
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
    
    self.title = @"实名认证";
}

-(void)initializeAppearance{
    
    [self.view addSubview:self.headerImageView];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.subTitleLabel];
    [self.view addSubview:self.sureBtn];

}

-(void)initializeDataSource{
    
}

#pragma mark   --------  event click  --------

-(void)sureBtnClick{
    
    [self.navigationController popToRootViewControllerAnimated:YES];

}


#pragma mark   **********  left clcik ********

-(void)leftClick{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
