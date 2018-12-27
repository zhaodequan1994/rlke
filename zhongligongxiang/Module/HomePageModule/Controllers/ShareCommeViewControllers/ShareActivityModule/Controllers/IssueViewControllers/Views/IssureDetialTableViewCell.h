//
//  IssureDetialTableViewCell.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/26.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IssureDetialTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *contentsView;
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UIView *detialView;
@property (weak, nonatomic) IBOutlet UITextView *inputTextView;
@property (weak, nonatomic) IBOutlet UILabel *placeHolderLabel;

@end

NS_ASSUME_NONNULL_END
