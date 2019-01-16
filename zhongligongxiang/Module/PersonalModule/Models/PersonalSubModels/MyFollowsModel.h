//
//  MyFollowsModel.h
//  zhongligongxiang
//
//  Created by zhaodq on 2019/1/2.
//  Copyright © 2019 zhaodq. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyFollowsModel : NSObject

@property (nonatomic,copy) NSString * followId;
@property (nonatomic,copy) NSString * uid;
@property (nonatomic,copy) NSString * follow_id;
@property (nonatomic,copy) NSString * create_time;
@property (nonatomic,copy) NSString * account;
@property (nonatomic,copy) NSString * avatar;
@property (nonatomic,copy) NSString * name;
@property (nonatomic,copy) NSString * follow_count;

@end

NS_ASSUME_NONNULL_END
