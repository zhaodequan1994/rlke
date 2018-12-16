//
//  UIImageView+Convenience.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "UIImageView+Convenience.h"

@implementation UIImageView (Convenience)

-(void)setImageWithImageName:(NSString *)imageName{
    
    [self setImageWithImageName:imageName placeholderImageName:nil];
}

- (void)setImageWithImageName:(NSString *)imageName placeholderImageName:(NSString *)placeholderImageName
{
    NSURL *URL = nil;
    UIImage *placeholderImage = nil;
    
    if (placeholderImageName.length > 0)
    {
        placeholderImage = [UIImage imageNamed:placeholderImageName];
    }
    
    if (imageName.length > 0)
    {
        if ([imageName hasPrefix:@"http"]) {
            
            
            NSString * url = [NSString stringWithFormat:@"%@",imageName];
            
            URL = [NSURL URLWithString:url];
            
        }else{
            
            NSString * url = [NSString stringWithFormat:@"%@",imageName];
            
            URL = [NSURL URLWithString:url];
            
        }
    }
    
    [self sd_setImageWithURL:URL placeholderImage:placeholderImage];
}


@end
