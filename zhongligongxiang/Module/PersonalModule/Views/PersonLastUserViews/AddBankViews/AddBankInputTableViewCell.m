//
//  AddBankInputTableViewCell.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/16.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "AddBankInputTableViewCell.h"

@implementation AddBankInputTableViewCell

-(void)addindex:(NSInteger)index{
    
    if (index == 1) {
        
        self.nameLabel.text = @"持卡人";
        self.inputTextField.placeholder = @"请输入持卡人姓名";
        
    }else if (index == 2){
        
        self.nameLabel.text = @"卡   号";
        self.inputTextField.placeholder = @"请输银行卡号";

    }else if (index == 3){
        
        self.nameLabel.text = @"手机号";
        self.inputTextField.placeholder = @"请输银行预留手机号";

    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.lineView.backgroundColor = RGB(230, 230, 230);
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
