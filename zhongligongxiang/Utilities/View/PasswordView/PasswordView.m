//
//  PasswordView.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/16.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "PasswordView.h"

@interface PasswordView ()

@property (nonatomic,strong) UIView * backView;
@property (nonatomic,strong) UIButton * cannerBtn;
@property (nonatomic,strong) UILabel * titleLabel;
@property (nonatomic,strong) UILabel * moneyLabel;
@property (nonatomic,strong) UITextField * passwordTextfield;;
@property (nonatomic,strong) UIView * lineView;

@end

@implementation PasswordView

-(UIView *)backView{
    
    if (!_backView) {
        _backView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.127, SCREEN_HEIGHT * 0.346, SCREEN_WIDTH * 0.746, 0.254*SCREEN_HEIGHT)];
        _backView.layer.masksToBounds = YES;
        _backView.layer.cornerRadius = 5.0f;
        _backView.backgroundColor = RGB(255, 255, 255);
    }
    return _backView;
}

-(UIButton *)cannerBtn{
    
    if (!_cannerBtn) {
        _cannerBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 38, 44)];
        
        UIImageView * cannerImageView= [[UIImageView alloc] initWithFrame:CGRectMake(13, 20, 12, 12)];
        cannerImageView.image = [UIImage imageNamed:@"View_pay_canner"];
        [_cannerBtn addSubview:cannerImageView];
        [_cannerBtn addTarget:self action:@selector(cannerBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cannerBtn;
}

-(UILabel *)titleLabel{
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.cannerBtn.frame.origin.x + self.cannerBtn.frame.size.width, 18, self.backView.frame.size.width - self.cannerBtn.frame.size.width * 2, 16)];
        [_titleLabel SetLabelText:@"请输入支付密码" textColor:RGB(51, 51, 51) textFont:16 textAlignment:NSTextAlignmentCenter];
        
    }
    return _titleLabel;
}

-(UILabel *)moneyLabel{
    
    if (!_moneyLabel) {
        _moneyLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.cannerBtn.frame.origin.x + self.cannerBtn.frame.size.width, self.titleLabel.frame.origin.y + self.titleLabel.frame.size.height + 20, self.backView.frame.size.width - self.cannerBtn.frame.size.width * 2, 15)];
        [_moneyLabel SetLabelText:@"¥100" textColor:RGB(255, 84, 85) textFont:20 textAlignment:NSTextAlignmentCenter];
        
    }
    return _moneyLabel;
}

-(UITextField *)passwordTextfield{
    
    if (!_passwordTextfield) {
        _passwordTextfield = [[UITextField alloc] initWithFrame:CGRectMake(20, self.moneyLabel.frame.origin.y + self.moneyLabel.frame.size.height + 40, self.backView.frame.size.width - 40, 30)];
        _passwordTextfield.placeholder = @"请输入支付密码";
        _passwordTextfield.font = [UIFont systemFontOfSize:14];
        _passwordTextfield.secureTextEntry = YES;
        
    }
    
    return _passwordTextfield;
}

-(UIView *)lineView{
    
    if (!_lineView) {
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(20, self.passwordTextfield.frame.origin.y + self.passwordTextfield.frame.size.height + 5, self.backView.frame.size.width - 40, 1)];
        _lineView.backgroundColor = RGB(230, 230, 230);
        
    }
    return _lineView;
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        UIColor *color = [UIColor blackColor];
        self.backgroundColor = [color colorWithAlphaComponent:0.6];
    }
    
    return self;
}

-(void)passWordShow{
    
    [[PublicMethod getWindow] addSubview:self];
        
    [self addSubview:self.backView];
    [self.backView addSubview:self.cannerBtn];
    [self.backView addSubview:self.titleLabel];
    [self.backView addSubview:self.moneyLabel];
    [self.backView addSubview:self.passwordTextfield];    [self.backView addSubview:self.lineView];


}
#pragma mark   ----------  event  click ---------

-(void)cannerBtnClick{
    
    [self removeFromSuperview];
}

@end
