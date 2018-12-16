//
//  RegisterTableViewCell.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "RegisterTableViewCell.h"

@implementation RegisterTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.registerBtn.layer.masksToBounds = YES;
    self.registerBtn.layer.cornerRadius = self.registerBtn.frame.size.height/2;
    self.registerBtn.backgroundColor = RGB(255, 84, 85);
    [self.registerBtn addTarget:self action:@selector(registerBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.agreeBtn addTarget:self action:@selector(agreeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.protocalBtn addTarget:self action:@selector(protocalBtnClick) forControlEvents:UIControlEventTouchUpInside];

    self.agreeTextLabel.textColor = RGB(153, 153, 153);
    
    NSString * contextString = @"我已阅读并同意《用户服务协议》";
    
    NSRange blueColorRange = [contextString rangeOfString:@"用户服务协议"];
    
    self.agreeTextLabel.attributedText = [PublicMethod attributeWithString:contextString withFont:[UIFont systemFontOfSize:12] withLineSpline:3 withWidth:self.agreeTextLabel.frame.size.width withHeadLine:0 withRange:blueColorRange withColor:RGB(255, 84, 85)];

}

#pragma mark  --------  event  click   ------

-(void)agreeBtnClick{
    
    
}
-(void)registerBtnClick{
    
    
}
-(void)protocalBtnClick{
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
