//
//  BalanceListTableViewCell.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/11.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "BalanceListTableViewCell.h"

@implementation BalanceListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.lineView.backgroundColor = RGB(230, 230, 230);
    self.titleLabel.textColor = RGB(51, 51, 51);
    self.timeLabel.textColor = RGB(179, 179, 179);
    self.moneyLabel.textColor = RGB(255, 84, 85);

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
