//
//  SharedListTableViewCell.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/12.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "SharedListTableViewCell.h"

//Controllers
#import "OrderDetialViewController.h"

@implementation SharedListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.contentsView1.layer.masksToBounds = NO;
    self.contentsView1.layer.cornerRadius = 5.0f;
    self.contentsView1.layer.shadowOpacity = 0.4;// 阴影透明度
    self.contentsView1.layer.shadowColor = [UIColor grayColor].CGColor;// 阴影的颜色
    self.contentsView1.layer.shadowRadius = 2;// 阴影扩散的范围控制
    self.contentsView1.layer.shadowOffset = CGSizeMake(1, 1);// 阴影的范围
    
    self.contentsView.layer.masksToBounds = YES;
    self.contentsView.layer.cornerRadius = 5.0f;
    
    self.userNameLabel.textColor = RGB(51, 51, 51);
    self.timeLabel.textColor = RGB(102, 102, 102);
    self.userNameLabel.textColor = RGB(255, 84, 85);
    self.peopleNumberLabel.textColor = RGB(102, 102, 102);
    self.addressLabel.textColor = RGB(102, 102, 102);
    self.thingLabel.textColor = RGB(102, 102, 102);

    self.delectOrderBtn.layer.masksToBounds = YES;
    self.delectOrderBtn.layer.cornerRadius = self.delectOrderBtn.frame.size.height/2;
    self.delectOrderBtn.layer.borderColor = RGB(179, 179, 179).CGColor;
    self.delectOrderBtn.layer.borderWidth = 1.0f;
    [self.delectOrderBtn setTitleColor:RGB(102, 102, 102) forState:UIControlStateNormal];
    
    self.cannerOrderBtn.layer.masksToBounds = YES;
    self.cannerOrderBtn.layer.cornerRadius = self.cannerOrderBtn.frame.size.height/2;
    self.cannerOrderBtn.layer.borderColor = RGB(179, 179, 179).CGColor;
    self.cannerOrderBtn.layer.borderWidth = 1.0f;
    [self.cannerOrderBtn setTitleColor:RGB(102, 102, 102) forState:UIControlStateNormal];
    self.lineView.backgroundColor = RGB(230, 230, 230);

    self.navigationBtn.layer.masksToBounds = YES;
    self.navigationBtn.layer.cornerRadius = self.navigationBtn.frame.size.height/2;
    self.navigationBtn.layer.borderColor = RGB(179, 179, 179).CGColor;
    self.navigationBtn.layer.borderWidth = 1.0f;
    [self.navigationBtn setTitleColor:RGB(102, 102, 102) forState:UIControlStateNormal];

    self.detialBtn.layer.masksToBounds = YES;
    self.detialBtn.layer.cornerRadius = self.detialBtn.frame.size.height/2;
    self.detialBtn.layer.borderColor = RGB(255, 84, 85).CGColor;
    self.detialBtn.layer.borderWidth = 1.0f;
    [self.detialBtn setTitleColor:RGB(255, 255, 255) forState:UIControlStateNormal];
    self.detialBtn.backgroundColor = RGB(255, 84, 85);

    [self.detialBtn addTarget:self action:@selector(detialBtnClick) forControlEvents:UIControlEventTouchUpInside];

}

#pragma mark  ---------  event  click  --------

-(void)detialBtnClick{
    
    self.fatherController.hidesBottomBarWhenPushed = YES;
    
    OrderDetialViewController * odvc = [[OrderDetialViewController alloc] init];
    
    odvc.isDetial = NO;
    
    [self.fatherController.navigationController pushViewController:odvc animated:YES];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
