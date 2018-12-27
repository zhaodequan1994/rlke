//
//  BalanceConsumeTitleTableViewCell.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/11.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "BalanceConsumeTitleTableViewCell.h"

@implementation BalanceConsumeTitleTableViewCell

-(void)addTitleString:(BOOL)isCharge{
    
    if (isCharge) {
        
        self.titleLabel.text = @"充值记录";

    }else{
        
        self.titleLabel.text = @"消费记录";

    }
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
