//
//  UserModel.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserModel : NSObject

-(NSDictionary *)userInfoNSDictionary:(UserModel *)mode;

-(UserModel *)fillUserInfoWithNSDictionary:(NSDictionary *)dictionary;


@end

NS_ASSUME_NONNULL_END
