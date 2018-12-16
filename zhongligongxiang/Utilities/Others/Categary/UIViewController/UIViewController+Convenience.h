//
//  UIViewController+Convenience.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Convenience)

+ (id)instantiateViewControllerInStoryboard:(NSString *)storyboard withStoryboardID:(NSString *)storyboardID;

+ (UIViewController *)currentTopViewController;

@end

NS_ASSUME_NONNULL_END
