//
//  OrderDetialTableViewCell.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/15.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "OrderDetialTableViewCell.h"

@implementation OrderDetialTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backView.backgroundColor = RGB(247, 247, 247);
    self.contentsView.layer.masksToBounds = NO;
    self.contentsView.layer.cornerRadius = 5.0f;
    self.contentsView.layer.shadowOpacity = 0.4;// 阴影透明度
    self.contentsView.layer.shadowColor = [UIColor grayColor].CGColor;// 阴影的颜色
    self.contentsView.layer.shadowRadius = 2;// 阴影扩散的范围控制
    self.contentsView.layer.shadowOffset = CGSizeMake(1, 1);// 阴影的范围
    
    self.contentsView1.layer.masksToBounds = YES;
    self.contentsView1.layer.cornerRadius = 5.0f;
    
    self.userNameLabel.textColor = RGB(51, 51, 51);
    self.timeLabel.textColor = RGB(102, 102, 102);
    self.userNameLabel.textColor = RGB(255, 84, 85);
    self.peopleNumberLabel.textColor = RGB(102, 102, 102);
    self.addressLabel.textColor = RGB(102, 102, 102);
    self.phoneLabel.textColor = RGB(102, 102, 102);
    self.lineView.backgroundColor = RGB(230, 230, 230);
    
    self.lineView.backgroundColor = RGB(230, 230, 230);

    CAShapeLayer *border = [CAShapeLayer layer];
    //  线条颜色
    border.strokeColor = [UIColor lightGrayColor].CGColor;
    
    border.fillColor = nil;
    
    
    UIBezierPath *pat = [UIBezierPath bezierPath];
    [pat moveToPoint:CGPointMake(0, 0)];
    if (CGRectGetWidth(self.lineView1.frame) > CGRectGetHeight(self.lineView1.frame)) {
        [pat addLineToPoint:CGPointMake(self.lineView1.bounds.size.width, 0)];
    }else{
        [pat addLineToPoint:CGPointMake(0, self.lineView1.bounds.size.height)];
    }
    border.path = pat.CGPath;
    
    border.frame = self.lineView1.bounds;
    
    // 不要设太大 不然看不出效果
    border.lineWidth = 0.5;
    border.lineCap = @"butt";
    
    //  第一个是 线条长度   第二个是间距    nil时为实线
    border.lineDashPattern = @[@6, @10];
    
    [self.lineView1.layer addSublayer:border];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
