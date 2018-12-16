//
//  BaseWebViewController.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "BaseTitleViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseWebViewController : BaseTitleViewController

@property (nonatomic,copy) NSString * UrlStr;

@property (nonatomic,copy) NSString * titleStr;

@end

NS_ASSUME_NONNULL_END
