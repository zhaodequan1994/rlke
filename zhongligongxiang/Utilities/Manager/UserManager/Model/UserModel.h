//
//  UserModel.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserModel : NSObject

// Admin

@property (assign, nonatomic) BOOL isLogin;

//Normal moblie

@property (nonatomic,copy) NSString * account;//
@property (nonatomic,copy) NSString * age;//
@property (nonatomic,copy) NSString * avatar;//
@property (nonatomic,copy) NSString * balance;//
@property (nonatomic,copy) NSString * create_time;//
@property (nonatomic,copy) NSString * email;//
@property (nonatomic,copy) NSString * extend;//
@property (nonatomic,copy) NSString * userId;//
@property (nonatomic,copy) NSString * is_admin;//
@property (nonatomic,copy) NSString * is_delete;//
@property (nonatomic,copy) NSString * is_online;//
@property (nonatomic,copy) NSString * lat;//
@property (nonatomic,copy) NSString * lng;//
@property (nonatomic,copy) NSString * login_count;//
@property (nonatomic,copy) NSString * login_time;//
@property (nonatomic,copy) NSString * major;//
@property (nonatomic,copy) NSString * name;//
@property (nonatomic,copy) NSString * parent_id;//
@property (nonatomic,copy) NSString * password;//
@property (nonatomic,copy) NSString * phone;//
@property (nonatomic,copy) NSString * rate;//
@property (nonatomic,copy) NSString * rec_code;//
@property (nonatomic,copy) NSString * remark;//
@property (nonatomic,copy) NSString * role_id;//
@property (nonatomic,copy) NSString * score;//
@property (nonatomic,copy) NSString * sex;//
@property (nonatomic,copy) NSString * skill;//
@property (nonatomic,copy) NSString * territory;//
@property (nonatomic,copy) NSString * wages;//


//Login

@property (nonatomic,copy) NSString *login;


-(NSDictionary *)userInfoNSDictionary:(UserModel *)mode;

-(UserModel *)fillUserInfoWithNSDictionary:(NSDictionary *)dictionary;


@end

NS_ASSUME_NONNULL_END
