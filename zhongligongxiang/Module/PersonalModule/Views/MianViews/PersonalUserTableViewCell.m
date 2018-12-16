//
//  PersonalUserTableViewCell.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/10.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "PersonalUserTableViewCell.h"

//Controllers
#import "MyFollowViewController.h"
#import "MyFansViewController.h"

@implementation PersonalUserTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;

    self.fansSubTitleLabel.textColor = RGB(102, 102, 102);
    self.followSubTitleLabel.textColor = RGB(102, 102, 102);
    self.zanSubTitleLabel.textColor = RGB(102, 102, 102);
    self.zanedSubtitleLabel.textColor = RGB(102, 102, 102);
    self.myVideoLabel.textColor = RGB(102, 102, 102);
    self.myCollectionLabel.textColor = RGB(102, 102, 102);
    self.myCommitLabel.textColor = RGB(102, 102, 102);
    self.myBrowseLabel.textColor = RGB(102, 102, 102);

    [self.followBtn addTarget:self action:@selector(followBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.fansBtn addTarget:self action:@selector(fansBtnClick) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark --------  event click  -------

-(void)followBtnClick{
    
    self.fatherController.hidesBottomBarWhenPushed = YES;
    
    MyFollowViewController * mfvc =[[MyFollowViewController alloc] init];
    
    [self.fatherController.navigationController pushViewController:mfvc animated:YES];
    
    self.fatherController.hidesBottomBarWhenPushed = NO;
}

-(void)fansBtnClick{
    
    self.fatherController.hidesBottomBarWhenPushed = YES;
    
    MyFansViewController * mfvc =[[MyFansViewController alloc] init];
    
    [self.fatherController.navigationController pushViewController:mfvc animated:YES];
    
    self.fatherController.hidesBottomBarWhenPushed = NO;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
