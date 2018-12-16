//
//  MyRecommendCodeTableViewCell.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/12.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "MyRecommendCodeTableViewCell.h"

@implementation MyRecommendCodeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.backgroundColor = RGB(255, 84, 85);

    self.contentsView.layer.masksToBounds = YES;
    self.contentsView.layer.cornerRadius = 10.0f;
    
    self.userNameLabel.textColor = RGB(51, 51, 51);
    self.codeLabel.textColor = RGB(102, 102, 102);

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
