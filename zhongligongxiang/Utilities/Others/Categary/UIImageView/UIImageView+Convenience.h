//
//  UIImageView+Convenience.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (Convenience)

- (void)setImageWithImageName:(NSString *)imageName;

- (void)setImageWithImageName:(NSString *)imageName placeholderImageName:(NSString *)placeholderImageName;


@end

NS_ASSUME_NONNULL_END
