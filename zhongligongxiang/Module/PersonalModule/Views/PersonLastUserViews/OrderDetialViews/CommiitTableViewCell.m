//
//  CommiitTableViewCell.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/16.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "CommiitTableViewCell.h"

//View
#import "StarRatingBar.h"

@implementation CommiitTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = RGB(247, 247, 247);
    self.contentsView.layer.masksToBounds = NO;
    self.contentsView.layer.cornerRadius = 5.0f;
    self.contentsView.layer.shadowOpacity = 0.4;// 阴影透明度
    self.contentsView.layer.shadowColor = [UIColor grayColor].CGColor;// 阴影的颜色
    self.contentsView.layer.shadowRadius = 2;// 阴影扩散的范围控制
    self.contentsView.layer.shadowOffset = CGSizeMake(1, 1);// 阴影的范围
    
    self.contentsView1.layer.masksToBounds = YES;
    self.contentsView1.layer.cornerRadius = 5.0f;
    
    self.titleLabel.textColor = RGB(51, 51, 51);
    self.contentTextView.layer.masksToBounds = YES;
    self.contentTextView.layer.borderColor = RGB(230, 230, 230).CGColor;
    self.contentTextView.layer.borderWidth = 1.0f;
    
    self.placeLabel.textColor = RGB(179, 179, 179);
    
    StarRatingBar *starRateView = [[StarRatingBar alloc] initWithFrame:CGRectMake(20 , self.starView.frame.size.height/3, self.starView.frame.size.width - 40, self.starView.frame.size.height/3) finish:^(CGFloat currentScore) {
        
        
    }];
    [self.starView addSubview:starRateView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
