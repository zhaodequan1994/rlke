//
//  IssueInputTableViewCell.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/26.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "IssueInputTableViewCell.h"

@implementation IssueInputTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;

    self.nameLabel.textColor = RGB(51, 51, 51);
    self.inputTextField.textColor = RGB(51, 51, 51);
    self.lineView.backgroundColor = RGB(230, 230, 230);

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
