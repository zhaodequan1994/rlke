//
//  PersonSubHeaderTableViewCell.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/10.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "PersonSubHeaderTableViewCell.h"

//Controllers
#import "MyBalanceViewController.h"


@implementation PersonSubHeaderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.horizlineView.backgroundColor = RGB(230, 230, 230);
    self.verticalLineView.backgroundColor = RGB(230, 230, 230);
    self.contentsView.layer.masksToBounds = NO;
    self.contentsView.layer.cornerRadius = 10.0f;
    self.contentsView.layer.shadowOpacity = 0.4;// 阴影透明度
    self.contentsView.layer.shadowColor = [UIColor grayColor].CGColor;// 阴影的颜色
    self.contentsView.layer.shadowRadius = 2;// 阴影扩散的范围控制
    self.contentsView.layer.shadowOffset = CGSizeMake(1, 1);// 阴影的范围

    self.contentsView1.layer.masksToBounds = YES;
    self.contentsView1.layer.cornerRadius = 10.0f;

    self.moneyNameLabel1.textColor = RGB(102, 102, 102);
    self.moneyNameLabel2.textColor = RGB(102, 102, 102);
    self.moneyNameLabel3.textColor = RGB(102, 102, 102);

    self.moeyLabel1.textColor = RGB(51, 51, 51);
    self.moneyLabel2.textColor = RGB(51, 51, 51);
    self.moneyLabel3.textColor = RGB(51, 51, 51);

    [self.moneyBtn setTitleColor:RGB(255, 84, 85) forState:UIControlStateNormal];
    [self.moneyBtn addTarget:self action:@selector(moneyBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.withDrawalBtn setTitleColor:RGB(255, 84, 85) forState:UIControlStateNormal];

    self.headerView.backgroundColor = RGB(255, 84, 85);
    
}

#pragma mark   ---------  event click  ------

-(void)moneyBtnClick{
    
    self.fatherController.hidesBottomBarWhenPushed = YES;
    
    MyBalanceViewController * mvc =[[MyBalanceViewController alloc] init];
    
    [self.fatherController.navigationController pushViewController:mvc animated:YES];
    
    self.fatherController.hidesBottomBarWhenPushed = NO;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
