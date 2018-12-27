//
//  IssureDetialTableViewCell.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/26.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "IssureDetialTableViewCell.h"

@implementation IssureDetialTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;

    self.headerView.backgroundColor = RGB(247, 247, 247);
    
    self.placeHolderLabel.textColor = RGB(179, 179, 179);
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
