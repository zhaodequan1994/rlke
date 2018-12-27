//
//  BillListTableViewCell.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/12.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "BillListTableViewCell.h"

//Controllers
#import "OrderDetialViewController.h"
#import "DetialCommitViewController.h"

@implementation BillListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.contentsView.layer.masksToBounds = NO;
    self.contentsView.layer.cornerRadius = 5.0f;
    self.contentsView.layer.shadowOpacity = 0.4;// 阴影透明度
    self.contentsView.layer.shadowColor = [UIColor grayColor].CGColor;// 阴影的颜色
    self.contentsView.layer.shadowRadius = 2;// 阴影扩散的范围控制
    self.contentsView.layer.shadowOffset = CGSizeMake(1, 1);// 阴影的范围
    
    self.contentsView1.layer.masksToBounds = YES;
    self.contentsView1.layer.cornerRadius = 5.0f;
    
    self.userImageView.layer.masksToBounds = YES;
    self.userImageView.layer.cornerRadius = self.userImageView.frame.size.height/2;
    
    self.userNameLabel.textColor = RGB(51, 51, 51);
    self.timeLabel.textColor = RGB(102, 102, 102);
    self.userNameLabel.textColor = RGB(255, 84, 85);
    self.peopleNumberLabel.textColor = RGB(102, 102, 102);
    self.addressLabel.textColor = RGB(102, 102, 102);
    self.thingLabel.textColor = RGB(102, 102, 102);
    self.lineView.backgroundColor = RGB(230, 230, 230);
    
    self.hideBtn.hidden = YES;
    
    self.delectBtn.layer.masksToBounds = YES;
    self.delectBtn.layer.cornerRadius = self.delectBtn.frame.size.height/2;
    self.delectBtn.layer.borderColor = RGB(179, 179, 179).CGColor;
    self.delectBtn.layer.borderWidth = 1.0f;
    [self.delectBtn setTitleColor:RGB(102, 102, 102) forState:UIControlStateNormal];
    
    self.cannerBtn.layer.masksToBounds = YES;
    self.cannerBtn.layer.cornerRadius = self.cannerBtn.frame.size.height/2;
    self.cannerBtn.layer.borderColor = RGB(179, 179, 179).CGColor;
    self.cannerBtn.layer.borderWidth = 1.0f;
    [self.cannerBtn setTitleColor:RGB(102, 102, 102) forState:UIControlStateNormal];

    self.detialBtn.layer.masksToBounds = YES;
    self.detialBtn.layer.cornerRadius = self.detialBtn.frame.size.height/2;
    self.detialBtn.layer.borderColor = RGB(255, 84, 85).CGColor;
    self.detialBtn.layer.borderWidth = 1.0f;
    [self.detialBtn setTitleColor:RGB(255, 255, 255) forState:UIControlStateNormal];
    self.detialBtn.backgroundColor = RGB(255, 84, 85);

    [self.detialBtn addTarget:self action:@selector(detialBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.cannerBtn addTarget:self action:@selector(cannerBtnClick) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark  ---------  event  click  --------

-(void)detialBtnClick{
    
    self.fatherController.hidesBottomBarWhenPushed = YES;
    
    OrderDetialViewController * odvc = [[OrderDetialViewController alloc] init];
    
    odvc.isDetial = YES;
    
    [self.fatherController.navigationController pushViewController:odvc animated:YES];
    
}

-(void)cannerBtnClick{
    
    self.fatherController.hidesBottomBarWhenPushed = YES;
    
    DetialCommitViewController * dcvc = [[DetialCommitViewController alloc] init];
    
    [self.fatherController.navigationController pushViewController:dcvc animated:YES];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
