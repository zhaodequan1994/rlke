//
//  PhoneCodeTableViewCell.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "PhoneCodeTableViewCell.h"

@implementation PhoneCodeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.lineView.backgroundColor = RGB(230, 230, 230);
    [self.codeBtn setTitleColor:RGB(255, 84, 85) forState:UIControlStateNormal];
    
    [self.codeBtn addTarget:self action:@selector(codeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.inputTextField.keyboardType = UIKeyboardTypeNamePhonePad;
    self.inputImageView.image = [UIImage imageNamed:@"login_comfire_code"];
    self.inputTextField.placeholder = @"请输入验证码";
    [self.inputTextField addTarget:self action:@selector(codeTextFieldDidChange:) forControlEvents:UIControlEventEditingChanged];

    
}

#pragma mark  ----------  event  click  --------

-(void)codeBtnClick{
    
    
}

#pragma mark   **********  UITextfield  delegate  ********

- (void)codeTextFieldDidChange:(id)sender{
    
    UITextField * textfield = (UITextField *)sender;
    
    if (textfield.text.length > 6) {
        
        textfield.text = [textfield.text substringToIndex:6];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
