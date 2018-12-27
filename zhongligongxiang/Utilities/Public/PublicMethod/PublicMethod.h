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

/**
 *  获取当前系统版本
 */
+ (NSString *)getCurrentVersion;


#pragma mark  ********   call phone  ***********

+ (void)callPhone:(UIViewController *)controller phone:(NSString *)phone;


#pragma mark  *********  OR code  ***********

/**
 *  QRurl :头像的链接
 *  messages: 二维码里面存放的信息
 */

+ (UIImage *)QRurl:(NSString *)url messages:(NSString *)message;

#pragma mark *******  get date time  *******
/**
 *
 *  messages: 获取当前时间戳
 */
+(NSString*)getCurrentTimestamp;

#pragma mark  ******   alert  View  *********

+ (void)alertControllerViewWithTitle:(NSString *)title sender:(UIViewController *)sender;


@end

NS_ASSUME_NONNULL_END
