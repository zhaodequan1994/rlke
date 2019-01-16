//
//  UserNickNameAlterViewController.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/27.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "BaseTitleViewController.h"

@protocol infoUpdateDelegate <NSObject>

-(void)infoUpdateDelegate;

@end


NS_ASSUME_NONNULL_BEGIN

@interface UserNickNameAlterViewController : BaseTitleViewController
@property (nonatomic,weak) id<infoUpdateDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
