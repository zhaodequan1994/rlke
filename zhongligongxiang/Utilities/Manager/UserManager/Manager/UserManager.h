//
//  UserManager.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "UserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserManager : NSObject

/**
 *
 *   个人信息的储存
 *
 *   @para   model是个人信息model
 */

-(void)codeNSUserDefaultsUserInfo:(UserModel *)model;

/**
 *
 *   个人信息的读取
 *
 */

-(UserModel *)enCodeNSUserDefaultsUserInfo;

/**
 *
 *    清除个人所有信息
 *
 */

-(void)clearNSUserDefaultUSerInfo;


/**
 *
 *    清理图片缓存
 *
 */

-(void)cleanSDImageCache;


@end

NS_ASSUME_NONNULL_END
