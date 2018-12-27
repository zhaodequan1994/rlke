//
//  BalanceConsumeTitleTableViewCell.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/11.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BalanceConsumeTitleTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *contentBackView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


-(void)addTitleString:(BOOL)isCharge;

@end

NS_ASSUME_NONNULL_END
