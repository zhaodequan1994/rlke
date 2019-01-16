//
//  PersonalAgentInfoDetialTableViewCell.h
//  zhongligongxiang
//
//  Created by zhaodq on 2019/1/4.
//  Copyright © 2019 zhaodq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PersonalAgentInfoDetialTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *contentsView;
@property (weak, nonatomic) IBOutlet UILabel *placeHolderLabel;
@property (weak, nonatomic) IBOutlet UITextView *contentTextField;

@end

NS_ASSUME_NONNULL_END
