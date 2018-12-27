//
//  MyFollowTableViewCell.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/12.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "MyFollowTableViewCell.h"

@implementation MyFollowTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;

    self.titleLabel.textColor = RGB(51, 51, 51);
    self.subTitleLabel.textColor = RGB(179, 179, 179);
    self.userImageView.layer.masksToBounds = YES;
    self.userImageView.layer.cornerRadius = self.userImageView.frame.size.height/2;
    
    self.followBtn.layer.masksToBounds = YES;
    self.followBtn.layer.cornerRadius = self.followBtn.frame.size.height/2;
    self.followBtn.layer.borderColor = RGB(230, 230, 230).CGColor;
    self.followBtn.layer.borderWidth = 1.0f;
    
    self.lineView.backgroundColor = RGB(230, 230, 230);
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
