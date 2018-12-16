//
//  LoginInputTableViewCell.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "LoginInputTableViewCell.h"

@interface LoginInputTableViewCell ()<UITextFieldDelegate>


@end

@implementation LoginInputTableViewCell

-(void)addIndex:(NSInteger)index{
    
    if (index == 1) {
        
        self.inputImageView.image = [UIImage imageNamed:@"login_phone"];
        self.inputTextField.placeholder = @"请输入手机号";
        self.inputTextField.keyboardType = UIKeyboardTypeNumberPad;
        [self.inputTextField addTarget:self action:@selector(phoneTextFieldDidChange:) forControlEvents:UIControlEventEditingChanged];

    }else if (index == 2){
        
        self.inputImageView.image = [UIImage imageNamed:@"login_secrect"];
        self.inputTextField.placeholder = @"请输入密码";
        self.inputTextField.secureTextEntry = YES;
        self.inputTextField.keyboardType = UIKeyboardTypeNamePhonePad;
        [self.inputTextField addTarget:self action:@selector(passwordTextFieldDidChange:) forControlEvents:UIControlEventEditingChanged];

    }
}

-(void)addRegisterIndex:(NSInteger)index{
    
    if (index == 1) {
        
        self.inputImageView.image = [UIImage imageNamed:@"login_phone"];
        self.inputTextField.placeholder = @"请输入手机号";
        self.inputTextField.keyboardType = UIKeyboardTypeNumberPad;
        [self.inputTextField addTarget:self action:@selector(phoneTextFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        
    }else if (index == 3){
        
        self.inputImageView.image = [UIImage imageNamed:@"login_secrect"];
        self.inputTextField.placeholder = @"请输入密码";
        self.inputTextField.secureTextEntry = YES;
        self.inputTextField.keyboardType = UIKeyboardTypeNamePhonePad;
        [self.inputTextField addTarget:self action:@selector(passwordTextFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        
    }else if (index == 4){
        
        self.inputImageView.image = [UIImage imageNamed:@"login_recommend_code"];
        self.inputTextField.placeholder = @"邀请码";
        self.inputTextField.keyboardType = UIKeyboardTypeNamePhonePad;
        [self.inputTextField addTarget:self action:@selector(recommendCodeTextFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        
    }
    
}

-(void)addResertIndex:(NSInteger)index{
    
    if (index == 1) {
        
        self.inputImageView.image = [UIImage imageNamed:@"login_phone"];
        self.inputTextField.placeholder = @"请输入手机号";
        self.inputTextField.keyboardType = UIKeyboardTypeNumberPad;
        [self.inputTextField addTarget:self action:@selector(phoneTextFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        
    }else if (index == 3){
        
        self.inputImageView.image = [UIImage imageNamed:@"login_secrect"];
        self.inputTextField.placeholder = @"请输入密码";
        self.inputTextField.secureTextEntry = YES;
        self.inputTextField.keyboardType = UIKeyboardTypeNamePhonePad;
        [self.inputTextField addTarget:self action:@selector(passwordTextFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        
    }

}

#pragma mark   **********  UITextfield  delegate  ********

- (void)phoneTextFieldDidChange:(id)sender{
    
    UITextField * textfield = (UITextField *)sender;
    
    if (textfield.text.length > 11) {
        
        textfield.text = [textfield.text substringToIndex:11];
    }
}

- (void)passwordTextFieldDidChange:(id)sender{
    
    UITextField * textfield = (UITextField *)sender;
    
    if (textfield.text.length > 20) {
        
        textfield.text = [textfield.text substringToIndex:20];
    }
}

-(void)recommendCodeTextFieldDidChange:(id)sender{
    
    UITextField * textfield = (UITextField *)sender;
    
    if (textfield.text.length > 10) {
        
        textfield.text = [textfield.text substringToIndex:10];
    }
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.inputTextField.delegate = self;
    
    self.lineView.backgroundColor = RGB(230, 230, 230);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
