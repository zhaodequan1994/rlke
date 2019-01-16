//
//  AuthenInputTableViewCell.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/12.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "AuthenInputTableViewCell.h"

@interface AuthenInputTableViewCell()


@end

@implementation AuthenInputTableViewCell


-(void)addIndex:(NSInteger)index{
    
    if (index == 1) {
       
        self.inputTextField.placeholder = @"请输入真实姓名";
        self.nameLabel.text = @"真实姓名";
    
    }else if (index == 2){
        
        self.inputTextField.placeholder = @"请输入证件号码";
        self.nameLabel.text = @"身份证号";

    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
