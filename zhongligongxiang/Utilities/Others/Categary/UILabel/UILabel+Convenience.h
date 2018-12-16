//
//  UILabel+Convenience.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Convenience)

-(void)SetLabelText:(NSString *)context textColor:(UIColor *)textColor textFont:(NSInteger)textFont  textAlignment:(NSTextAlignment)textAlignment;
/**
 *  自适应宽高同时调整行距
 *
 *  @param text label.text
 *  @param font label.font
 *  @param size label的最大尺寸
 *
 *  @return 自适应后的到的size
 */
- (CGSize)szieAdaptiveWithText:(NSString *)text andTextFont:(UIFont *)font andTextMaxSzie:(CGSize )size;


@end

NS_ASSUME_NONNULL_END
