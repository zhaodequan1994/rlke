//
//  AssistView.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/13.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "AssistView.h"

@interface AssistView ()

@property (nonatomic,strong) UIView * backView;
@property (nonatomic,strong) UIImageView * assistImageView;
@property (nonatomic,strong) UILabel * userNameLabel;
@property (nonatomic,strong) UILabel * assistNumberLabel;
@property (nonatomic,strong) UIButton * sureBtn;


@end

@implementation AssistView

-(UIView *)backView{
    
    if (!_backView) {
        _backView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.127, SCREEN_HEIGHT * 0.3, SCREEN_WIDTH * 0.746, 0.397*SCREEN_HEIGHT)];
        _backView.layer.masksToBounds = YES;
        _backView.layer.cornerRadius = 5.0f;
        _backView.backgroundColor = RGB(255, 255, 255);
    }
    return _backView;
}

-(UIImageView *)assistImageView{
    
    if (!_assistImageView) {
        _assistImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.backView.frame.size.width * 0.325, self.backView.frame.size.height*0.094, self.backView.frame.size.width * 0.35, self.backView.frame.size.height * 0.358)];
        _assistImageView.image = [UIImage imageNamed:@"View_assist"];
    }
    return _assistImageView;
}

-(UILabel *)userNameLabel{
    
    if (!_userNameLabel) {
        _userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, self.assistImageView.frame.origin.y + self.assistImageView.frame.size.height + 22, self.backView.frame.size.width - 20, 15)];
        [_userNameLabel SetLabelText:@"slinay koo" textColor:RGB(51, 51, 51) textFont:16 textAlignment:NSTextAlignmentCenter];
    }
    return _userNameLabel;
}
-(UILabel *)assistNumberLabel{
    
    if (!_assistNumberLabel) {
        _assistNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, self.userNameLabel.frame.origin.y + self.userNameLabel.frame.size.height + 9, self.backView.frame.size.width - 20, 15)];
        [_assistNumberLabel SetLabelText:@"共获得128个赞" textColor:RGB(51, 51, 51) textFont:14 textAlignment:NSTextAlignmentCenter];
    }
    return _assistNumberLabel;
}

-(UIButton *)sureBtn{
    
    if (!_sureBtn) {
        _sureBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.backView.frame.size.width * 0.09, self.assistNumberLabel.frame.origin.y + self.assistNumberLabel.frame.size.height + self.backView.frame.size.height * 0.109, self.backView.frame.size.width * 0.82, self.backView.frame.size.height * 0.15)];
        _sureBtn.layer.masksToBounds = YES;
        _sureBtn.layer.cornerRadius = _sureBtn.frame.size.height/2;
        _sureBtn.backgroundColor = RGB(255, 84, 85);
        [_sureBtn setTitle:@"好的" forState:UIControlStateNormal];
        _sureBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [_sureBtn addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureBtn;
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        UIColor *color = [UIColor blackColor];
        self.backgroundColor = [color colorWithAlphaComponent:0.6];
    }
    
    return self;
}

-(void)assistShow{
    
    [[PublicMethod getWindow] addSubview:self];
    
    [self addSubview:self.backView];
    [self.backView addSubview:self.assistImageView];
    [self.backView addSubview:self.userNameLabel];
    [self.backView addSubview:self.assistNumberLabel];
    [self.backView addSubview:self.sureBtn];
    

}

#pragma mark  --------- event  click  -------

-(void)sureBtnClick{
    
    [self removeFromSuperview];

}

@end
