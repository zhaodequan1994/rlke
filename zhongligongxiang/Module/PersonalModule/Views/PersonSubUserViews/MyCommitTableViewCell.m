//
//  MyCommitTableViewCell.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/18.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "MyCommitTableViewCell.h"

@implementation MyCommitTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;

    self.lineView.backgroundColor = RGB(230, 230, 230);

    self.userImageView.layer.masksToBounds = YES;
    self.userImageView.layer.cornerRadius = self.userImageView.frame.size.height/2;
    
    self.contentImageView.layer.masksToBounds = YES;
    self.contentImageView.layer.cornerRadius = 2.0f;
    
    self.titleLabel.textColor = RGB(51, 51, 51);
    self.subtitleLabel.textColor = RGB(51, 51, 51);
    self.timeLabel.textColor = RGB(179, 179, 179);

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
