//
//  PublicManager.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "UserManager.h"
#import "UserObjectManager.h"
#import "LocationManager.h"

NS_ASSUME_NONNULL_BEGIN

@class PublicManager;


@interface PublicManager : NSObject

#pragma mark  - Manager

@property (nonatomic,strong) UserManager * userManager;
@property (nonatomic,strong) UserObjectManager * userObjectManager;
@property (nonatomic,strong) LocationManager * locationManager;

#pragma mark - Init

+ (instancetype)shareInstance;

@end

NS_ASSUME_NONNULL_END
