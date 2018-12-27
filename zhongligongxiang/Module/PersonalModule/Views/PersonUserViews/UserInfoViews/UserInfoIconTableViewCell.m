//
//  UserInfoIconTableViewCell.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/27.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "UserInfoIconTableViewCell.h"

@implementation UserInfoIconTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.lineView.backgroundColor = RGB(230, 230, 230);
    self.nameLabel.textColor = RGB(51, 51, 51);

    self.userImageView.layer.masksToBounds = YES;
    self.userImageView.layer.cornerRadius = self.userImageView.frame.size.height/2;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
