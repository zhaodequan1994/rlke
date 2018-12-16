//
//  PayTpyeTableViewCell.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/16.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PayTpyeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet UIImageView *payImageView;
@property (weak, nonatomic) IBOutlet UIImageView *selectState;
@property (weak, nonatomic) IBOutlet UILabel *payNameLabel;

@end

NS_ASSUME_NONNULL_END
