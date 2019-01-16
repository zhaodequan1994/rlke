//
//  UserModel.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "UserModel.h"

#define K_ACCOUNT               @"K_ACCOUNT"
#define K_AGE                   @"K_AGE"
#define K_AVATAR                @"K_AVATAR"
#define K_BALANCE               @"K_BALANCE"
#define K_CREATTIME             @"K_CREATTIME"
#define K_EMAIL                 @"K_EMAIL"
#define K_EXTEND                @"K_EXTEND"
#define K_USERID                @"K_USERID"
#define K_ISADMIN               @"K_ISADMIN"
#define K_ISDELETE              @"K_ISDELETE"
#define K_ISONLINE              @"K_ISONLINE"
#define K_LAT                   @"K_LAT"
#define K_LNG                   @"K_LNG"
#define K_LOGINCOUNT            @"K_LOGINCOUNT"
#define K_LOGINTIME             @"K_LOGINTIME"
#define K_MAJOR                 @"K_MAJOR"
#define K_NAME                  @"K_NAME"
#define K_PARENTID              @"K_PARENTID"
#define K_PASSWORD              @"K_PASSWORD"
#define K_PHONE                 @"K_PHONE"
#define K_RATE                  @"K_RATE"
#define K_RECCODE               @"K_RECCODE"
#define K_REMARK                @"K_REMARK"
#define K_ROLEID                @"K_ROLEID"
#define K_SCORE                 @"K_SCORE"
#define K_SEX                   @"K_SEX"
#define K_SKILL                 @"K_SKILL"
#define K_TERRITORY             @"K_TERRITORY"
#define K_WAGES                 @"K_WAGES"
#define K_ONLINEDEVICE          @"K_ONLINEDEVICE"
#define K_IS_LOGIN              @"K_IS_LOGIN"
#define K_IS_REAL               @"K_IS_REAL"


@implementation UserModel

-(NSDictionary *)userInfoNSDictionary:(UserModel *)model{

    if (model.userId.length > 0) {
        
        model.login = @"islogin";
        
    }else{
        model.login = @"";
    }

    return  @{K_ACCOUNT:model.account,
              K_AGE:model.age,
              K_AVATAR:model.avatar,
              K_BALANCE:model.balance,
              K_CREATTIME:model.create_time,
              K_EMAIL:model.email,
              K_EXTEND:model.extend,
              K_USERID:model.userId,
              K_ISADMIN:model.is_admin,
              K_ISDELETE:model.is_delete,
              K_ISONLINE:model.is_online,
              K_LAT:model.lat,
              K_LNG:model.lng,
              K_LOGINCOUNT:model.login_count,
              K_LOGINTIME:model.login_time,
              K_MAJOR:model.major,
              K_NAME:model.name,
              K_PARENTID:model.parent_id,
              K_PASSWORD:model.password,
              K_PHONE:model.phone,
              K_RATE:model.rate,
              K_RECCODE:model.rec_code,
              K_REMARK:model.remark,
              K_ROLEID:model.role_id,
              K_SCORE:model.score,
              K_SEX:model.sex,
              K_SKILL:model.skill,
              K_TERRITORY:model.territory,
              K_WAGES:model.wages,
              K_ONLINEDEVICE:model.is_online,
              K_IS_LOGIN:model.login,
              K_IS_REAL:model.is_real
              };
}

-(UserModel *)fillUserInfoWithNSDictionary:(NSDictionary *)dictionary{

    UserModel * model = [[UserModel alloc] init];

    model.account       =         [dictionary objectForKey:K_ACCOUNT];
    model.age           =         [dictionary objectForKey:K_AGE];
    model.avatar        =         [dictionary objectForKey:K_AVATAR];
    model.balance       =         [dictionary objectForKey:K_BALANCE];
    model.create_time   =         [dictionary objectForKey:K_CREATTIME];
    model.email         =         [dictionary objectForKey:K_EMAIL];
    model.extend        =         [dictionary objectForKey:K_EXTEND];
    model.userId        =         [dictionary objectForKey:K_USERID];
    model.is_admin      =         [dictionary objectForKey:K_ISADMIN];
    model.is_delete     =         [dictionary objectForKey:K_ISDELETE];
    model.is_online     =         [dictionary objectForKey:K_ISONLINE];
    model.lat           =         [dictionary objectForKey:K_LAT];
    model.lng           =         [dictionary objectForKey:K_LNG];
    model.login_count   =         [dictionary objectForKey:K_LOGINCOUNT];
    model.login_time    =         [dictionary objectForKey:K_LOGINTIME];
    model.major         =         [dictionary objectForKey:K_MAJOR];
    model.name          =         [dictionary objectForKey:K_NAME];
    model.parent_id     =         [dictionary objectForKey:K_PARENTID];
    model.password      =         [dictionary objectForKey:K_PASSWORD];
    model.phone         =         [dictionary objectForKey:K_PHONE];
    model.rate          =         [dictionary objectForKey:K_RATE];
    model.rec_code      =         [dictionary objectForKey:K_RECCODE];
    model.remark        =         [dictionary objectForKey:K_REMARK];
    model.role_id       =         [dictionary objectForKey:K_ROLEID];
    model.score         =         [dictionary objectForKey:K_SCORE];
    model.sex           =         [dictionary objectForKey:K_SEX];
    model.skill         =         [dictionary objectForKey:K_SKILL];
    model.territory     =         [dictionary objectForKey:K_TERRITORY];
    model.wages         =         [dictionary objectForKey:K_WAGES];
    model.online_device =         [dictionary objectForKey:K_ONLINEDEVICE];
    model.login         =         [dictionary objectForKey:K_IS_LOGIN];
    model.is_real       =         [dictionary objectForKey:K_IS_REAL];

    return model;
}

#pragma mark - ********** Setter / Getter **********

-(NSString *)login{
    
    return _login.length == 0 ? @"":_login;
}

-(NSString *)account{
    
    if (_account == nil||[_account isEqual:[NSNull null]]||[_account isEqualToString:@"(null)"]||[_account isEqualToString:@"<null>"]) {
        
        return @"";
    }
    
    return _account.length == 0 ? @"":_account;
}
-(NSString *)age{
    
    if (_age == nil||[_age isEqual:[NSNull null]]||[_age isEqualToString:@"(null)"]||[_age isEqualToString:@"<null>"]) {
        
        return @"";
    }
    
    return _age.length == 0 ? @"":_age;
}
-(NSString *)avatar{
    
    if (_avatar == nil||[_avatar isEqual:[NSNull null]]||[_avatar isEqualToString:@"(null)"]||[_avatar isEqualToString:@"<null>"]) {
        
        return @"";
    }
    
    return _avatar.length == 0 ? @"":_avatar;
}
-(NSString *)balance{
    
    if (_balance == nil||[_balance isEqual:[NSNull null]]||[_balance isEqualToString:@"(null)"]||[_balance isEqualToString:@"<null>"]) {
        
        return @"";
    }
    
    return _balance.length == 0 ? @"":_balance;
}
-(NSString *)create_time{
    
    if (_create_time == nil||[_create_time isEqual:[NSNull null]]||[_create_time isEqualToString:@"(null)"]||[_create_time isEqualToString:@"<null>"]) {
        
        return @"";
    }
    
    return _create_time.length == 0 ? @"":_create_time;
}
-(NSString *)email{
    
    if (_email == nil||[_email isEqual:[NSNull null]]||[_email isEqualToString:@"(null)"]||[_email isEqualToString:@"<null>"]) {
        
        return @"";
    }
    
    return _email.length == 0 ? @"":_email;
}
-(NSString *)extend{
    
    if (_extend == nil||[_extend isEqual:[NSNull null]]||[_extend isEqualToString:@"(null)"]||[_extend isEqualToString:@"<null>"]) {
        
        return @"";
    }
    
    return _extend.length == 0 ? @"":_extend;
}
-(NSString *)userId{
    
    if (_userId == nil||[_userId isEqual:[NSNull null]]||[_userId isEqualToString:@"(null)"]||[_userId isEqualToString:@"<null>"]) {
        
        return @"";
    }
    
    return _userId.length == 0 ? @"":_userId;
}
-(NSString *)is_admin{
    
    if (_is_admin == nil||[_is_admin isEqual:[NSNull null]]||[_is_admin isEqualToString:@"(null)"]||[_is_admin isEqualToString:@"<null>"]) {
        
        return @"";
    }
    
    return _is_admin.length == 0 ? @"":_is_admin;
}
-(NSString *)is_delete{
    
    if (_is_delete == nil||[_is_delete isEqual:[NSNull null]]||[_is_delete isEqualToString:@"(null)"]||[_is_delete isEqualToString:@"<null>"]) {
        
        return @"";
    }
    
    return _is_delete.length == 0 ? @"":_is_delete;
}
-(NSString *)is_online{
    
    if (_is_online == nil||[_is_online isEqual:[NSNull null]]||[_is_online isEqualToString:@"(null)"]||[_is_online isEqualToString:@"<null>"]) {
        
        return @"";
    }
    
    return _is_online.length == 0 ? @"":_is_online;
}
-(NSString *)lat{
    
    if (_lat == nil||[_lat isEqual:[NSNull null]]||[_lat isEqualToString:@"(null)"]||[_lat isEqualToString:@"<null>"]) {
        
        return @"";
    }
    
    return _lat.length == 0 ? @"":_lat;
}
-(NSString *)lng{
    
    if (_lng == nil||[_lng isEqual:[NSNull null]]||[_lng isEqualToString:@"(null)"]||[_lng isEqualToString:@"<null>"]) {
        
        return @"";
    }
    
    return _lng.length == 0 ? @"":_lng;
}
-(NSString *)login_count{
    
    if (_login_count == nil||[_login_count isEqual:[NSNull null]]||[_login_count isEqualToString:@"(null)"]||[_login_count isEqualToString:@"<null>"]) {
        
        return @"";
    }
    
    return _login_count.length == 0 ? @"":_login_count;
}
-(NSString *)login_time{
    
    if (_login_time == nil||[_login_time isEqual:[NSNull null]]||[_login_time isEqualToString:@"(null)"]||[_login_time isEqualToString:@"<null>"]) {
        
        return @"";
    }
    
    return _login_time.length == 0 ? @"":_login_time;
}
-(NSString *)major{
    
    if (_major == nil||[_major isEqual:[NSNull null]]||[_major isEqualToString:@"(null)"]||[_major isEqualToString:@"<null>"]) {
        
        return @"";
    }
    
    return _major.length == 0 ? @"":_major;
}
-(NSString *)name{
    
    if (_name == nil||[_name isEqual:[NSNull null]]||[_name isEqualToString:@"(null)"]||[_name isEqualToString:@"<null>"]) {
        
        return @"";
    }
    
    return _name.length == 0 ? @"":_name;
}
-(NSString *)parent_id{
    
    if (_parent_id == nil||[_parent_id isEqual:[NSNull null]]||[_parent_id isEqualToString:@"(null)"]||[_parent_id isEqualToString:@"<null>"]) {
        
        return @"";
    }
    
    return _parent_id.length == 0 ? @"":_parent_id;
}
-(NSString *)password{
    
    if (_password == nil||[_password isEqual:[NSNull null]]||[_password isEqualToString:@"(null)"]||[_password isEqualToString:@"<null>"]) {
        
        return @"";
    }
    
    return _password.length == 0 ? @"":_password;
}
-(NSString *)phone{
    
    if (_phone == nil||[_phone isEqual:[NSNull null]]||[_phone isEqualToString:@"(null)"]||[_phone isEqualToString:@"<null>"]) {
        
        return @"";
    }
    
    return _phone.length == 0 ? @"":_phone;
}
-(NSString *)rate{
    
    if (_rate == nil||[_rate isEqual:[NSNull null]]||[_rate isEqualToString:@"(null)"]||[_rate isEqualToString:@"<null>"]) {
        
        return @"";
    }
    
    return _rate.length == 0 ? @"":_rate;
}
-(NSString *)rec_code{
    
    if (_rec_code == nil||[_rec_code isEqual:[NSNull null]]||[_rec_code isEqualToString:@"(null)"]||[_rec_code isEqualToString:@"<null>"]) {
        
        return @"";
    }
    
    return _rec_code.length == 0 ? @"":_rec_code;
}
-(NSString *)remark{
    
    if (_remark == nil||[_remark isEqual:[NSNull null]]||[_remark isEqualToString:@"(null)"]||[_remark isEqualToString:@"<null>"]) {
        
        return @"";
    }
    
    return _remark.length == 0 ? @"":_remark;
}
-(NSString *)role_id{
    
    if (_role_id == nil||[_role_id isEqual:[NSNull null]]||[_role_id isEqualToString:@"(null)"]||[_role_id isEqualToString:@"<null>"]) {
        
        return @"";
    }
    
    return _role_id.length == 0 ? @"":_role_id;
}
-(NSString *)score{
    
    if (_score == nil||[_score isEqual:[NSNull null]]||[_score isEqualToString:@"(null)"]||[_score isEqualToString:@"<null>"]) {
        
        return @"";
    }
    
    return _score.length == 0 ? @"":_score;
}
-(NSString *)sex{
    
    if (_sex == nil||[_sex isEqual:[NSNull null]]||[_sex isEqualToString:@"(null)"]||[_sex isEqualToString:@"<null>"]) {
        
        return @"";
    }
    
    return _sex.length == 0 ? @"":_sex;
}
-(NSString *)skill{
    
    if (_skill == nil||[_skill isEqual:[NSNull null]]||[_skill isEqualToString:@"(null)"]||[_skill isEqualToString:@"<null>"]) {
        
        return @"";
    }
    
    return _skill.length == 0 ? @"":_skill;
}
-(NSString *)territory{
    
    if (_territory == nil||[_territory isEqual:[NSNull null]]||[_territory isEqualToString:@"(null)"]||[_territory isEqualToString:@"<null>"]) {
        
        return @"";
    }
    
    return _territory.length == 0 ? @"":_territory;
}
-(NSString *)wages{
    
    if (_wages == nil||[_wages isEqual:[NSNull null]]||[_wages isEqualToString:@"(null)"]||[_wages isEqualToString:@"<null>"]) {
        
        return @"";
    }
    
    return _wages.length == 0 ? @"":_wages;
}
-(NSString *)online_device{
    
    if (_online_device == nil||[_online_device isEqual:[NSNull null]]||[_online_device isEqualToString:@"(null)"]||[_online_device isEqualToString:@"<null>"]) {
        
        return @"";
    }
    
    return _online_device.length == 0 ? @"":_online_device;
}

-(NSString *)is_real{
    
    if (_is_real == nil||[_is_real isEqual:[NSNull null]]||[_is_real isEqualToString:@"(null)"]||[_online_device isEqualToString:@"<null>"]) {
        
        return @"";
    }
    
    return _is_real.length == 0 ? @"":_is_real;
}


@end
