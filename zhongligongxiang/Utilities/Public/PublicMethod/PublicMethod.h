//
//  PublicMethod.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PublicMethod : NSObject


+ (void)networkRequestWithPath:(NSString *)path Parameters:(NSDictionary *)parameters sender:(UIView *)sender
                         begin:(void (^)())begin success:(void (^)(id object))success error:(void (^)(id object))error failure:(void (^)(id object))failure;

+ (void)networkGetRequestWithPath:(NSString *)path Parameters:(NSDictionary *)parameters sender:(UIView *)sender
                            begin:(void (^)())begin success:(void (^)(id object))success error:(void (^)(id object))error failure:(void (^)(id object))failure;

#pragma mark  *********  NSString   **********

+ (NSMutableAttributedString *)attributeWithString:(NSString *)string withFont:(UIFont *)font withLineSpline:(CGFloat)spline withWidth:(CGFloat)width withHeadLine:(CGFloat)headLine withRange:(NSRange)range withColor:(UIColor *)rangeColor;

//获得 Window
+ (UIWindow *)getWindow;

@end

NS_ASSUME_NONNULL_END
