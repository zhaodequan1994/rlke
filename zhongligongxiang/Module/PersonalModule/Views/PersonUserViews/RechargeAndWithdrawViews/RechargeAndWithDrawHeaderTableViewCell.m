//
//  RechargeAndWithDrawHeaderTableViewCell.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/14.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "RechargeAndWithDrawHeaderTableViewCell.h"

//view
#import "PayTypeView.h"
#import "PasswordView.h"
#import "PasswordOtherView.h"

@interface RechargeAndWithDrawHeaderTableViewCell ()

@end

@implementation RechargeAndWithDrawHeaderTableViewCell

-(void)addContntModel:(BOOL)isRechagre{
    
    if (isRechagre) {
        
        self.moneyTitleTypeLabel.text = @"充值金额";
        [self.rechargeAndDrawBtn setTitle:@"充值余额" forState:UIControlStateNormal];
        self.tipsLabel.text = @"温馨提示: 您充值的金额可用于支付发布的求助订单，也可随时提现使用！";
        
    }else{
        
        self.moneyTitleTypeLabel.text = @"提现金额";
        [self.rechargeAndDrawBtn setTitle:@"立即提现" forState:UIControlStateNormal];
    }
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.titleBackView.layer.masksToBounds = YES;
    self.titleBackView.layer.cornerRadius = 10.0f;
    [self.moneyTextField setValue:[UIFont systemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
    self.moneyTextField.placeholder = @"充值金额不能小于1元";
    self.middleLineView.backgroundColor = RGB(230, 230, 230);
    self.bottomLineView.backgroundColor = RGB(247, 247, 247);
    self.tipsLabel.textColor = RGB(179, 179, 179);
    self.moneyTypeLabel.textColor = RGB(102, 102, 102);
    
    self.rechargeAndDrawBtn.layer.masksToBounds = YES;
    self.rechargeAndDrawBtn.layer.cornerRadius = self.rechargeAndDrawBtn.frame.size.height/2;

    [self.moneyTypeBtn addTarget:self action:@selector(moneyTypeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.rechargeAndDrawBtn addTarget:self action:@selector(rechargeAndDrawBtnClick) forControlEvents:UIControlEventTouchUpInside];

}

#pragma mark  ---------  event  click  -------

-(void)moneyTypeBtnClick{
    
    PayTypeView * payTypeView = [[PayTypeView alloc] initWithFrame:SCREEN_RECT];
    if (self.isRechagre) {
        
        payTypeView.title = @"选择充值方式";
    }else{
        payTypeView.title = @"选择提现方式";
    }
    payTypeView.fatherController = self.fatheController;
    
    [payTypeView PayTypeShow];
}

-(void)rechargeAndDrawBtnClick{
    
    PasswordView *  passwordView = [[PasswordView alloc] initWithFrame:SCREEN_RECT];
    [passwordView passWordShow];
    
//    PasswordOtherView *  passwordView = [[PasswordOtherView alloc] initWithFrame:SCREEN_RECT];
//
//    [passwordView passWordOtherShow];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
