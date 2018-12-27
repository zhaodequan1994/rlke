//
//  UserInfoIconTableViewCell.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/27.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserInfoIconTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *contentsView;
@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

NS_ASSUME_NONNULL_END
