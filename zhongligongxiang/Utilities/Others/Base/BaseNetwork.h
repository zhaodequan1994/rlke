//
//  BaseNetwork.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "AFHTTPSessionManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseNetwork : AFHTTPSessionManager

#pragma mark - Init

+ (instancetype)shareInstance;

#pragma mark - Public

+ (void)networkRequestWithPath:(NSString *)path parameters:(NSDictionary *)paramaters sender:(UIView *)sender begin:(void (^)())begin success:(void (^)(id object))success error:(void (^)(id object))error failure:(void (^)(id object))failure;

+ (void)networkGetRequestWithPath:(NSString *)path parameters:(NSDictionary *)paramaters sender:(UIView *)sender begin:(void (^)())begin success:(void (^)(id object))success error:(void (^)(id object))error failure:(void (^)(id object))failure;


+ (void)cancelLastTask;

@end

NS_ASSUME_NONNULL_END
