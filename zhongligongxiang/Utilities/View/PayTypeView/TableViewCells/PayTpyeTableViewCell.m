//
//  PayTpyeTableViewCell.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/16.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "PayTpyeTableViewCell.h"

@implementation PayTpyeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.lineView.backgroundColor = RGB(230, 230, 230);
    self.payNameLabel.textColor = RGB(51, 51, 51);
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
