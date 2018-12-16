//
//  AuthenSureTableViewCell.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/12.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "AuthenSureTableViewCell.h"

@implementation AuthenSureTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.authenBtn.layer.masksToBounds = YES;
    self.authenBtn.layer.cornerRadius = self.authenBtn.frame.size.height/2;
    self.authenBtn.backgroundColor = RGB(255, 84, 85);
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
