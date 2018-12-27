//
//  registerModel.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/21.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RegisterModel : NSObject

@property (nonatomic,copy) NSString * phone;
@property (nonatomic,copy) NSString * type;
@property (nonatomic,copy) NSString * code;
@property (nonatomic,copy) NSString * rec_code;
@property (nonatomic,copy) NSString * password;

@end

NS_ASSUME_NONNULL_END
