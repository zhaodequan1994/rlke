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

-(void)clearNSUserDefaultUSerInfo{
    
    UserModel * model = [[UserModel alloc] init];
    
    model.account = @"";
    model.age = @"";
    model.avatar = @"";
    model.balance = @"";
    model.create_time = @"";
    model.email = @"";
    model.extend = @"";
    model.userId = @"";
    model.is_admin = @"";
    model.is_delete = @"";
    model.is_online = @"";
    model.is_real = @"";
    model.lat = @"";
    model.lng = @"";
    model.login_count = @"";
    model.login_time = @"";
    model.major = @"";
    model.name = @"";
    model.parent_id = @"";
    model.password = @"";
    
    model.phone = @"";
    model.rate = @"";
    model.rec_code = @"";
    model.remark = @"";
    model.role_id = @"";
    model.score = @"";
    model.sex = @"";
    model.skill = @"";
    model.territory = @"";
    model.wages = @"";
    
    [[PublicManager shareInstance].userManager codeNSUserDefaultsUserInfo:model];
    
}


#pragma mark - cleanSDImageCache

-(void)cleanSDImageCache{
    
    SDImageCache *imageCache = [SDImageCache sharedImageCache];
    [imageCache clearMemory];
}

@end
