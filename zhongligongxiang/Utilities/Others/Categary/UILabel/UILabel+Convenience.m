//
//  UILabel+Convenience.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "UILabel+Convenience.h"

@implementation UILabel (Convenience)

-(void)SetLabelText:(NSString *)context textColor:(UIColor *)textColor textFont:(NSInteger)textFont textAlignment:(NSTextAlignment)textAlignment{
    
    if (context.length>0) {
        
        self.text = context;
        
    }
    
    if (textColor) {
        
        self.textColor = textColor;
    }
    
    if (textFont) {
        
        self.font = [UIFont systemFontOfSize:textFont];
    }
    
    if (textAlignment) {
        
        self.textAlignment = textAlignment;
    }
    
}

- (CGSize)szieAdaptiveWithText:(NSString *)text andTextFont:(UIFont *)font andTextMaxSzie:(CGSize )size{
    
    self.text = text;
    self.font = font;
    
    //可变的属性文本
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc]initWithString:self.text];
    
    //设置段落样式 使用NSMutableParagraphStyle类
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    paragraphStyle.alignment = NSTextAlignmentLeft;//文本对齐方式
    paragraphStyle.maximumLineHeight = 60;  //最大的行高
    paragraphStyle.lineSpacing = 8;  //行自定义行高度
    
    //  给可变的属性字符串 添加段落格式
    [attributedText addAttribute: NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.text length])];
    
    //将带有段落格式的可变的属性字符串给label.attributedText
    self.attributedText = attributedText;
    
    self.lineBreakMode = NSLineBreakByTruncatingTail;//label的换行模式
    self.numberOfLines = 0;// 设置行数，0表示没有限制
    
    CGSize maxSzie = size;//设置label的最大SIZE
    
    [self sizeToFit];
    CGSize labelSize = [self sizeThatFits:maxSzie];//最终自适应得到的label的尺寸。
    
    return labelSize;
}


@end
