//
//  IssureTrendTipTableViewCell.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/26.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "IssureTrendTipTableViewCell.h"

@implementation IssureTrendTipTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;

    self.contentsView.backgroundColor = RGB(247, 247, 247);
    self.tipLabel.textColor = RGB(179, 179, 179);
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
