//
//  HomeOrderTableViewCell.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/18.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "HomeOrderTableViewCell.h"

@implementation HomeOrderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = RGB(247, 247, 247);
    self.subTitleLabel.textColor = RGB(255, 179, 25);
    self.moneyLabel.textColor = RGB(255, 84, 85);
    self.contentsView.layer.masksToBounds = NO;
    self.contentsView.layer.cornerRadius = 5.0f;
    self.contentsView.layer.shadowOpacity = 0.4;// 阴影透明度
    self.contentsView.layer.shadowColor = [UIColor grayColor].CGColor;// 阴影的颜色
    self.contentsView.layer.shadowRadius = 2;// 阴影扩散的范围控制
    self.contentsView.layer.shadowOffset = CGSizeMake(1, 1);// 阴影的范围
    
    self.contentsView1.layer.masksToBounds = YES;
    self.contentsView1.layer.cornerRadius = 5.0f;
    
    self.userImageView.layer.masksToBounds = YES;
    self.userImageView.layer.cornerRadius = self.userImageView.frame.size.height/2;
    
    self.userNameLabel.textColor = RGB(51, 51, 51);
    self.timeLabel.textColor = RGB(102, 102, 102);
    self.userNameLabel.textColor = RGB(255, 84, 85);
    self.peopleNumberLabel.textColor = RGB(102, 102, 102);
    self.addressLabel.textColor = RGB(102, 102, 102);
    self.detialLabel.textColor = RGB(102, 102, 102);
    self.lineView.backgroundColor = RGB(230, 230, 230);

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
