//
//  BalanceConsumeTitleTableViewCell.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/11.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "BalanceConsumeTitleTableViewCell.h"

@implementation BalanceConsumeTitleTableViewCell

-(void)addTitleString:(NSString *)title{
    
    self.titleLabel.text = title;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
