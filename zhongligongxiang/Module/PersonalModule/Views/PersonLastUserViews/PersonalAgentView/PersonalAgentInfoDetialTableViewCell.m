//
//  PersonalAgentInfoDetialTableViewCell.m
//  zhongligongxiang
//
//  Created by zhaodq on 2019/1/4.
//  Copyright © 2019 zhaodq. All rights reserved.
//

#import "PersonalAgentInfoDetialTableViewCell.h"

@implementation PersonalAgentInfoDetialTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.placeHolderLabel.textColor = RGB(179, 179, 179);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
