//
//  ResertSureTableViewCell.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "ResertSureTableViewCell.h"

@implementation ResertSureTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.sureBtn.layer.masksToBounds = YES;
    self.sureBtn.backgroundColor = RGB(255, 84, 85);
    self.sureBtn.layer.cornerRadius = self.sureBtn.frame.size.height/2;
    [self.sureBtn addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];

}

#pragma mark   -------  event  click  -----

-(void)sureBtnClick{
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
