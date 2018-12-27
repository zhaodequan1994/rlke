//
//  PersonalHeaderTableViewCell.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/10.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "PersonalHeaderTableViewCell.h"

//Controllers
#import "AuthenViewController.h"
#import "UserInfoViewController.h"

@implementation PersonalHeaderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.backgroundColor = RGB(255, 84, 85);
    self.userImageView.layer.masksToBounds = YES;
    self.userImageView.layer.cornerRadius = self.userImageView.frame.size.height/2;
    self.subTitleLabel.layer.masksToBounds = YES;
    self.subTitleLabel.layer.cornerRadius = 12.0f;
    self.subTitleLabel.backgroundColor = RGB(255, 179, 25);
    self.headerBackView.backgroundColor = RGB(255, 84, 85);
    
    [self.applyBtn addTarget:self action:@selector(applyBtnClick) forControlEvents:UIControlEventTouchUpInside];

    [self.userInfoBtn addTarget:self action:@selector(userInfoBtnClick) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark  ---------  event  click  --------

-(void)applyBtnClick{
    
    self.fatherController.hidesBottomBarWhenPushed = YES;
    
    AuthenViewController * atvc  = [[AuthenViewController alloc] init];
    
    [self.fatherController.navigationController pushViewController:atvc animated:YES];
    
    self.fatherController.hidesBottomBarWhenPushed = NO;
    
}

-(void)userInfoBtnClick{
    
    self.fatherController.hidesBottomBarWhenPushed = YES;
    
    UserInfoViewController * ufvc  = [[UserInfoViewController alloc] init];
    
    [self.fatherController.navigationController pushViewController:ufvc animated:YES];
    
    self.fatherController.hidesBottomBarWhenPushed = NO;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
