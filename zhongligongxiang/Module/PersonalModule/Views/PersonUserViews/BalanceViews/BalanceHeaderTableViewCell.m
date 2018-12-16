//
//  BalanceHeaderTableViewCell.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/11.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "BalanceHeaderTableViewCell.h"

//Controllers
#import "RechargeBalanceViewController.h"

//Model
#import "RechargeAndDrawTypeModel.h"

@interface BalanceHeaderTableViewCell ()

@property (nonatomic,strong) RechargeAndDrawTypeModel
* model;

@end

@implementation BalanceHeaderTableViewCell

-(RechargeAndDrawTypeModel *)model{
    
    if (!_model) {
        _model = [[RechargeAndDrawTypeModel
                   alloc] init];
    }
    return _model;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.moneyLabel.textColor = RGB(255, 255, 255);
    self.moneyNameLabel.textColor = RGB(255, 255, 255);

    self.rechargeBtn.layer.masksToBounds = YES;
    self.rechargeBtn.layer.cornerRadius = self.rechargeBtn.frame.size.height/2;
    self.rechargeBtn.layer.borderColor = RGB(255, 255, 255).CGColor;
    self.rechargeBtn.layer.borderWidth = 1.0f;
    self.rechargeBtn.backgroundColor = RGB(255, 84, 85);
    [self.rechargeBtn setTitleColor:RGB(255, 255, 255) forState:UIControlStateNormal];

    self.withDrawalBtn.layer.masksToBounds = YES;
    self.withDrawalBtn.layer.cornerRadius = self.withDrawalBtn.frame.size.height/2;
    self.withDrawalBtn.backgroundColor = RGB(255, 243, 241);
    [self.withDrawalBtn setTitleColor:RGB(255, 84, 85) forState:UIControlStateNormal];

    self.lineView.backgroundColor = RGB(230, 230, 230);
        
    self.btnsBackView.backgroundColor = [UIColor clearColor];
    self.rechageView.backgroundColor = [UIColor clearColor];
    self.drawalView.backgroundColor = [UIColor clearColor];
    
    [self.rechargeBtn addTarget:self action:@selector(rechargeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.withDrawalBtn addTarget:self action:@selector(withDrawalBtnClick) forControlEvents:UIControlEventTouchUpInside];

}

#pragma mark  --------  event  click  -------
-(void)rechargeBtnClick{
    
    self.fatherController.hidesBottomBarWhenPushed = YES;
    
    RechargeBalanceViewController * rbvc = [[RechargeBalanceViewController alloc] init];
    
    self.model.title = @"充值余额";
    self.model.moneyTitleType = @"充值金额";
    self.model.tipsText = @"温馨提示: 您充值的金额可用于支付发布的求助订单，也可随时提现使用！";
    self.model.moneyListType = @"充值记录";
    self.model.isCharge = YES;

    rbvc.rechargeModel = self.model;

    [self.fatherController.navigationController pushViewController:rbvc animated:YES];
    
}
-(void)withDrawalBtnClick{
    
    self.fatherController.hidesBottomBarWhenPushed = YES;
    
    RechargeBalanceViewController * rbvc = [[RechargeBalanceViewController alloc] init];
    
    self.model.title = @"立即提现";
    self.model.moneyTitleType = @"提现金额";
    self.model.tipsText = @"";
    self.model.moneyListType = @"充值记录";
    self.model.isCharge = NO;
    rbvc.rechargeModel = self.model;

    [self.fatherController.navigationController pushViewController:rbvc animated:YES];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
