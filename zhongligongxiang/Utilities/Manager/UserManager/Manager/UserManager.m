//
//  UserManager.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "UserManager.h"

@implementation UserManager

-(void)codeNSUserDefaultsUserInfo:(UserModel *)model{
    
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[model userInfoNSDictionary:model] forKey:K_USER_INFO];
    [defaults synchronize];
}

-(UserModel *)enCodeNSUserDefaultsUserInfo{
    
    UserModel * model = [[UserModel alloc] init];
    
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    
    return [model fillUserInfoWithNSDictionary: [defaults objectForKey:K_USER_INFO]];
    
}

#pragma mark - cleanSDImageCache

-(void)cleanSDImageCache{
    
    SDImageCache *imageCache = [SDImageCache sharedImageCache];
    [imageCache clearMemory];
}

@end
