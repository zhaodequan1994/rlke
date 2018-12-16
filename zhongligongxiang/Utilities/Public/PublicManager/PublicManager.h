//
//  PublicManager.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class PublicManager;


@interface PublicManager : NSObject

#pragma mark  - Manager


#pragma mark - Init

+ (instancetype)shareInstance;

@end

NS_ASSUME_NONNULL_END
