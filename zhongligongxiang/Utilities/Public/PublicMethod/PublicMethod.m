//
//  PublicMethod.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "PublicMethod.h"

#import "UIImage+MultiFormat.h"
#import <CoreImage/CoreImage.h>

#import "KeyChainStore.h"
#import <AdSupport/AdSupport.h>


//Controller
#import "LoginViewController.h"

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

+ (void)callPhone:(UIViewController *)controller phone:(NSString *)phone{
    
    UIWebView*callWebview =[[UIWebView alloc] init];
    
    NSURL *telURL =[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",phone]];
    [callWebview loadRequest:[NSURLRequest requestWithURL:telURL]];
    //记得添加到view上
    [controller.view addSubview:callWebview];
    
}

+ (UIImage *)QRurl:(NSString *)url messages:(NSString *)message{
    
    UIImage *icon_image;
    NSData *data;
    
    // 1、创建滤镜对象
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    // 恢复滤镜的默认属性
    [filter setDefaults];
    
    // 2、设置数据
    NSString *string_data = message;
    // 将字符串转换成 NSdata (虽然二维码本质上是字符串, 但是这里需要转换, 不转换就崩溃)
    NSData *qrImageData = [string_data dataUsingEncoding:NSUTF8StringEncoding];
    
    // 设置过滤器的输入值, KVC赋值
    [filter setValue:qrImageData forKey:@"inputMessage"];
    
    // 3、获得滤镜输出的图像
    CIImage *outputImage = [filter outputImage];
    
    // 图片小于(27,27),我们需要放大
    outputImage = [outputImage imageByApplyingTransform:CGAffineTransformMakeScale(20, 20)];
    
    // 4、将CIImage类型转成UIImage类型
    UIImage *start_image = [UIImage imageWithCIImage:outputImage];
    
    // - - - - - - - - - - - - - - - - 添加中间小图标 - - - - - - - - - - - - - - - -
    // 5、开启绘图, 获取图形上下文 (上下文的大小, 就是二维码的大小)
    UIGraphicsBeginImageContext(start_image.size);
    
    // 把二维码图片画上去 (这里是以图形上下文, 左上角为(0,0)点
    [start_image drawInRect:CGRectMake(0, 0, start_image.size.width, start_image.size.height)];
    
    // 再把小图片画上去
    if (url==nil) {
        
        icon_image = [UIImage imageNamed:@"personal_default"];
        
    }else
    {
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        icon_image = [UIImage sd_imageWithData:data];
    }
    
    CGFloat icon_imageW = 200;
    CGFloat icon_imageH = icon_imageW;
    CGFloat icon_imageX = (start_image.size.width - icon_imageW) * 0.5;
    CGFloat icon_imageY = (start_image.size.height - icon_imageH) * 0.5;
    
    
    
    [icon_image drawInRect:CGRectMake(icon_imageX, icon_imageY, icon_imageW, icon_imageH)];
    
    // 6、获取当前画得的这张图片
    UIImage *final_image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 7、关闭图形上下文
    UIGraphicsEndImageContext();
    
    // 8、将最终合得的图片显示在UIImageView上
    
    return final_image;
    
}

+(NSString *)getCurrentTimestamp{
    
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval time =[dat timeIntervalSince1970];
    NSString*timeString = [NSString stringWithFormat:@"%0.f", time];//转为字符型
    return timeString;
    
}

+ (void)alertControllerViewWithTitle:(NSString *)title sender:(UIViewController *)sender{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示"message:title preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
    }]];
    
    [sender presentViewController:alert animated:YES completion:nil];
    
}

+ (NSString *)getCurrentVersion{
    
    return [UIDevice currentDevice].systemVersion;
}


+ (void)PushToLoginViewController:(UIViewController *)parentController{
    
    LoginViewController * livc = [[LoginViewController alloc] init];
    
    UINavigationController* navi = [[UINavigationController alloc] initWithRootViewController:livc];
    
    

    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;

    [delegate.window.rootViewController presentViewController:navi animated:YES completion:nil];
    
}


+ (NSString *)getDeviceUUID{
    
    NSString*strUUID = (NSString*)[KeyChainStore load:K_ONLY_UUID];
    //首次执行该方法时，uuid为空
    if([strUUID isEqualToString:@""]|| !strUUID)
    {
        // 获取UUID 这个是要引入<AdSupport/AdSupport.h>的
        strUUID = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
        
        if(strUUID.length ==0 || [strUUID isEqualToString:@"00000000-0000-0000-0000-000000000000"])
        {
            //生成一个uuid的方法
            CFUUIDRef uuidRef= CFUUIDCreate(kCFAllocatorDefault);
            strUUID = (NSString*)CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault,uuidRef));
            CFRelease(uuidRef);
        }
        
        //将该uuid保存到keychain
        [KeyChainStore save:K_ONLY_UUID data:strUUID];
    }
    
    return strUUID;
}

+ (void)postNotificationName:(NSString *)aName object:(nullable id)anObject{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:aName object:anObject];

}

+ (void)removeObserver:(id)observer name:(NSString *)aName object:(nullable id)anObject{
    
    [[NSNotificationCenter defaultCenter] removeObserver:observer name:aName object:anObject];

}

+ (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSString *)aName object:(nullable id)anObject{
    
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:(SEL)aSelector name:aName object:anObject];

}

+ (void)removeAllObserver:(id)observer{
    
    [[NSNotificationCenter defaultCenter] removeObserver:observer];
}

#pragma mark - 根据字符串计算label高度
+ (CGFloat)getHeightLineWithString:(NSString *)string withWidth:(CGFloat)width withFont:(UIFont *)font withLineSpline:(CGFloat)spline withHeadLine:(CGFloat)headLine{
    
    if (string.length > 0) {
       
        NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc]initWithString:string];
        
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        
        if (headLine > 0) {
            
            style.firstLineHeadIndent = headLine;
        }
        
        style.alignment = NSTextAlignmentJustified;//设置两端对齐
        
        if ([attributeString.string isMoreThanOneLineWithSize:CGSizeMake(width, MAXFLOAT) font:font lineSpaceing:spline]) {
            style.lineSpacing = spline;
            
        }
        [attributeString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, string.length)];
        
        [attributeString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, string.length)];
        
        return [attributeString.string boundingRectWithSize:CGSizeMake(width, MAXFLOAT) font:font lineSpacing:spline].height ;
    }
    
    return 0;
}

@end
