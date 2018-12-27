//
//  AgentView.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/18.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "AgentView.h"

@interface AgentView ()

@property (nonatomic,strong) UIView * backView;
@property (nonatomic,strong) UIImageView * headerImageView;
@property (nonatomic,strong) UILabel * titleLabel;
@property (nonatomic,strong) UILabel * subTitleLabel;

@property (nonatomic,strong) UIButton * cannerBtn;

@end

@implementation AgentView

-(UIView *)backView{
    
    if (!_backView) {
        _backView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.127, SCREEN_HEIGHT * 0.256, SCREEN_WIDTH * 0.746, 0.5*SCREEN_HEIGHT)];
        _backView.layer.masksToBounds = YES;
        _backView.layer.cornerRadius = 5.0f;
        _backView.backgroundColor = RGB(255, 255, 255);
    }
    return _backView;
}

-(UIImageView *)headerImageView{
    
    if (!_headerImageView) {
        _headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.backView.frame.size.width, self.backView.frame.size.height * 0.374)];
        _headerImageView.image = [UIImage imageNamed:@"View_agent_image"];
    }
    return _headerImageView;
}

-(UILabel *)titleLabel{
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, self.headerImageView.frame.origin.y + self.headerImageView.frame.size.height + self.backView.frame.size.height * 0.066, self.backView.frame.size.width - 20, 15)];
        [_titleLabel SetLabelText:@"想成为代理商？" textColor:RGB(51, 51, 51) textFont:16 textAlignment:NSTextAlignmentCenter];
    }
    return _titleLabel;
}

-(UILabel *)subTitleLabel{
    
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, self.titleLabel.frame.origin.y + self.titleLabel.frame.size.height + self.backView.frame.size.height * 0.03, self.backView.frame.size.width - 20, 14)];
        [_subTitleLabel SetLabelText:@"赶快去申请吧  下一个就是你" textColor:RGB(51, 51, 51) textFont:14 textAlignment:NSTextAlignmentCenter];
    }
    return _subTitleLabel;
}

-(UIButton *)personalBtn{
    
    if (!_personalBtn) {
        _personalBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.backView.frame.size.width * 0.089, self.subTitleLabel.frame.origin.y + self.subTitleLabel.frame.size.height + self.backView.frame.size.height * 0.1167, self.backView.frame.size.width * 0.8215, 40)];
        _personalBtn.backgroundColor = RGB(255, 84, 85);
        _personalBtn.layer.masksToBounds = YES;
        _personalBtn.layer.cornerRadius = _personalBtn.frame.size.height/2;
        [_personalBtn setTitle:@"个人代理" forState:UIControlStateNormal];
        [_personalBtn setTitleColor:RGB(255, 255, 255) forState:UIControlStateNormal];
        _personalBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    }
    return _personalBtn;
}

-(UIButton *)customBtn{
    
    if (!_customBtn) {
        _customBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.backView.frame.size.width * 0.089, self.personalBtn.frame.origin.y + self.personalBtn.frame.size.height + self.backView.frame.size.height * 0.03, self.backView.frame.size.width * 0.8215, 40)];
        _customBtn.backgroundColor = RGB(255, 255, 255);
        _customBtn.layer.masksToBounds = YES;
        _customBtn.layer.cornerRadius = _customBtn.frame.size.height/2;
        _customBtn.layer.borderColor = RGB(255, 84, 85).CGColor;
        _customBtn.layer.borderWidth = 1.0f;
        [_customBtn setTitle:@"用户代理" forState:UIControlStateNormal];
        [_customBtn setTitleColor:RGB(255, 84, 85) forState:UIControlStateNormal];
        _customBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    }
    return _customBtn;
}

-(UIButton *)cannerBtn{
    
    if (!_cannerBtn) {
        _cannerBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.backView.frame.origin.x + self.backView.frame.size.width/2 - 20, self.backView.frame.origin.y + self.backView.frame.size.height + SCREEN_HEIGHT * 0.015, 40, 40)];
        UIImageView * cannerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 30, 30)];
        cannerImageView.image = [UIImage imageNamed:@"View_agent_canner"];
        [_cannerBtn addSubview:cannerImageView];
        [_cannerBtn addTarget:self action:@selector(cannerBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cannerBtn;
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        UIColor *color = [UIColor blackColor];
        self.backgroundColor = [color colorWithAlphaComponent:0.6];
    }
    
    return self;
}

-(void)agentShow{
    
    [[PublicMethod getWindow] addSubview:self];
    
    [self addSubview:self.backView];
    [self.backView addSubview:self.headerImageView];
    [self.backView addSubview:self.titleLabel];
    [self.backView addSubview:self.subTitleLabel];
    [self.backView addSubview:self.personalBtn];
    [self.backView addSubview:self.customBtn];

    [self addSubview:self.cannerBtn];

}

-(void)agentDissmiss{
    
    [self removeFromSuperview];

}

#pragma mark  --------  event  click  -------

-(void)cannerBtnClick{
    
    [self removeFromSuperview];
}

@end
