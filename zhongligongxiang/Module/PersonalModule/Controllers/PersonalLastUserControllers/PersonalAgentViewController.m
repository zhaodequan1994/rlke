//
//  PersonalAgentViewController.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/27.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "PersonalAgentViewController.h"

//Controllers
#import "PersonalAgentInfoViewController.h"

@interface PersonalAgentViewController ()

@property (nonatomic,strong) UIImageView * backImageView;
@property (nonatomic,strong) UIButton * aplyBtn;


@end

@implementation PersonalAgentViewController

-(UIImageView *)backImageView{
    
    if (!_backImageView) {
        _backImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
        _backImageView.image = [UIImage imageNamed:@"Personal_agent_aply"];
    }
    return _backImageView;
}

-(UIButton *)aplyBtn{
    
    if (!_aplyBtn) {
        _aplyBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, SCREEN_HEIGHT - 65 - 64, SCREEN_WIDTH - 30, 44)];
        _aplyBtn.layer.masksToBounds = YES;
        _aplyBtn.layer.cornerRadius = _aplyBtn.frame.size.height/2;
        _aplyBtn.backgroundColor = RGB(255, 84, 85);
        [_aplyBtn setTitleColor:RGB(255, 255, 255) forState:UIControlStateNormal];
        [_aplyBtn setTitle:@"立刻申请" forState:UIControlStateNormal];
        
        _aplyBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        [_aplyBtn setTitleColor:RGB(255, 255, 255) forState:UIControlStateNormal];
        [_aplyBtn addTarget:self action:@selector(aplyBtnClik) forControlEvents:UIControlEventTouchUpInside];
        
        CAGradientLayer *gl = [CAGradientLayer layer];
        
        gl.frame = CGRectMake(0,0,_aplyBtn.frame.size.width,_aplyBtn.frame.size.height);
        gl.startPoint = CGPointMake(0, 0);
        gl.endPoint = CGPointMake(1, 1);
        gl.colors = @[(__bridge id)RGB(255, 149, 127).CGColor,(__bridge id)RGB(255, 84, 85).CGColor];
        gl.locations = @[@(0.0),@(1.0)];
        
//        [_aplyBtn.layer addSublayer:gl];
    }
    return _aplyBtn;
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
    
    self.title = @"个人代理";
    
}

-(void)initializeAppearance{
    
    [self.view addSubview:self.backImageView];
    [self.view addSubview:self.aplyBtn];
}

-(void)initializeDataSource{
    
    
}


#pragma mark   --------  event  click  ------

-(void)aplyBtnClik{
    
    self.hidesBottomBarWhenPushed = YES;
    
    PersonalAgentInfoViewController * pavc = [[PersonalAgentInfoViewController alloc] init];
    
    [self.navigationController pushViewController:pavc animated:YES];
}
@end
