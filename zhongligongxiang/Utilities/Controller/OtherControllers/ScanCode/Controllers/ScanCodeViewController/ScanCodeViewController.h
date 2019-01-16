//
//  ScanCodeViewController.h
//  zhongligongxiang
//
//  Created by zhaodq on 2019/1/16.
//  Copyright © 2019 zhaodq. All rights reserved.
//

#import "BaseTitleViewController.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^ScanCodeResultBolck)(NSString *string);

@interface ScanCodeViewController : BaseTitleViewController

@property (nonatomic, copy) ScanCodeResultBolck resultBlock;

@end

NS_ASSUME_NONNULL_END
