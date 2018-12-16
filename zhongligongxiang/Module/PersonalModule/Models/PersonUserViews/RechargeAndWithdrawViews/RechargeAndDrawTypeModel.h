//
//  RechargeAndDrawTypeModel.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/14.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RechargeAndDrawTypeModel : NSObject

@property (nonatomic,copy) NSString * title;
@property (nonatomic,copy) NSString * moneyTitleType;
@property (nonatomic,copy) NSString * moneyListType;
@property (nonatomic,copy) NSString * tipsText;
@property (nonatomic,assign) BOOL  isCharge;

@end

NS_ASSUME_NONNULL_END
