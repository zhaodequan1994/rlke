//
//  UserObjectManager.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/24.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "UserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserObjectManager : NSObject
/*
 *
 *  object  为字典类型
 *
 *
 */

-(void)encodeUserModelObject:(id)object superUserModel:(UserModel *)userObjectModel;


@end

NS_ASSUME_NONNULL_END
