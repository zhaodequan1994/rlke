//
//  AddBankInputTableViewCell.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/16.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AddBankInputTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@property (weak, nonatomic) IBOutlet UIView *lineView;

-(void)addindex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
