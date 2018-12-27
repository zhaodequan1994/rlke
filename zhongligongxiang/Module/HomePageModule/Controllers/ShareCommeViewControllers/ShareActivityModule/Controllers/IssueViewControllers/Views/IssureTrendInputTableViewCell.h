//
//  IssureTrendInputTableViewCell.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/26.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IssureTrendInputTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *contentsView;
@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet UITextView *detialTextField;
@property (weak, nonatomic) IBOutlet UILabel *placeHolderLabel;

@end

NS_ASSUME_NONNULL_END
