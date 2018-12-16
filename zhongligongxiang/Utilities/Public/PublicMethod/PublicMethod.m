//
//  PublicMethod.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "PublicMethod.h"

@implementation PublicMethod

#pragma  ******   Network  **********


+ (void)networkRequestWithPath:(NSString *)path Parameters:(NSDictionary *)parameters sender:(UIView *)sender begin:(void (^)())begin success:(void (^)(id))success error:(void (^)(id))error failure:(void (^)(id))failure{
    
    [BaseNetwork networkRequestWithPath:path parameters:parameters sender:sender begin:begin success:success error:error failure:failure];
    
}

+ (void)networkGetRequestWithPath:(NSString *)path Parameters:(NSDictionary *)parameters sender:(UIView *)sender begin:(void (^)())begin success:(void (^)(id))success error:(void (^)(id))error failure:(void (^)(id))failure{
    
    [BaseNetwork networkGetRequestWithPath:path parameters:parameters sender:sender begin:begin success:success error:error failure:failure];
    
}

+ (NSMutableAttributedString *)attributeWithString:(NSString *)string withFont:(UIFont *)font withLineSpline:(CGFloat)spline withWidth:(CGFloat)width withHeadLine:(CGFloat)headLine withRange:(NSRange)range withColor:(UIColor *)rangeColor{
    
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc]initWithString:string];
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    
    if (headLine > 0) {
        
        style.firstLineHeadIndent = headLine;
    }
    
    style.alignment = NSTextAlignmentJustified;//设置两端对齐
    
    style.lineBreakMode = NSLineBreakByTruncatingTail;
    
    if ([attributeString.string isMoreThanOneLineWithSize:CGSizeMake(width, MAXFLOAT) font:font lineSpaceing:spline]) {
        style.lineSpacing = spline;
    }
    
    [attributeString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, string.length)];
    
    [attributeString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, string.length)];
    
    [attributeString addAttribute:NSForegroundColorAttributeName value:rangeColor range:range];
    
    return attributeString;
}

+ (UIWindow *)getWindow{
    
    return [ [ UIApplication  sharedApplication ]  keyWindow ];
}

@end
