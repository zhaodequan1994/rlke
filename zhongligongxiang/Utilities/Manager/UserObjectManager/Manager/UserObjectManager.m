//
//  UserObjectManager.m
//  lanlingdai
//
//  Created by zhaodq on 2017/12/14.
//  Copyright © 2017年 zhaodq. All rights reserved.
//

#import "UserObjectManager.h"

@implementation UserObjectManager

-(void)encodeUserModelObject:(id)object superUserModel:(UserModel *)userObjectModel{
    
    UserModel * model = [[UserModel alloc] init];
    
    //-----------------------------1---------------------------
    
    NSString * accounStr = [NSString stringWithFormat:@"%@",[object objectForKey:@"account"]];
    if (accounStr == nil||[accounStr isEqual:[NSNull null]]||[accounStr isEqualToString:@"(null)"]||[accounStr isEqualToString:@"<null>"]||accounStr.length == 0) {
        
        model.account = userObjectModel.account;
        
    }else{
        
        model.account = accounStr;
    }
    
    //-----------------------------2---------------------------
    
    NSString * ageStr = [NSString stringWithFormat:@"%@",[object objectForKey:@"age"]];
    if (ageStr == nil||[ageStr isEqual:[NSNull null]]||[ageStr isEqualToString:@"(null)"]||[ageStr isEqualToString:@"<null>"]||ageStr.length == 0) {
        
        model.age = userObjectModel.age;
        
    }else{
        
        model.age = ageStr;
    }
    
    //-----------------------------3---------------------------
    
    NSString * avatarStr = [NSString stringWithFormat:@"%@",[object objectForKey:@"avatar"]];
    if (avatarStr == nil||[avatarStr isEqual:[NSNull null]]||[avatarStr isEqualToString:@"(null)"]||[avatarStr isEqualToString:@"<null>"]||avatarStr.length == 0) {
        
        model.avatar = userObjectModel.avatar;
        
    }else{
        
        model.avatar = avatarStr;
    }
    
    //-----------------------------4---------------------------
    
    NSString * balanceStr = [NSString stringWithFormat:@"%@",[object objectForKey:@"balance"]];
    if (balanceStr == nil||[balanceStr isEqual:[NSNull null]]||[balanceStr isEqualToString:@"(null)"]||balanceStr.length == 0) {
        
        model.balance = userObjectModel.balance;
        
    }else{
        
        model.balance = balanceStr;
    }
    
    //-----------------------------5---------------------------
    
    NSString * createtimeStr = [NSString stringWithFormat:@"%@",[object objectForKey:@"create_time"]];
    if (createtimeStr == nil||[createtimeStr isEqual:[NSNull null]]||[createtimeStr isEqualToString:@"(null)"]||[createtimeStr isEqualToString:@"<null>"]||createtimeStr.length == 0) {
        
        model.create_time = userObjectModel.create_time;
        
    }else{
        
        model.create_time = createtimeStr;
    }
    
    //-----------------------------6---------------------------
    
    NSString * emailStr = [NSString stringWithFormat:@"%@",[object objectForKey:@"email"]];
    if (emailStr == nil||[emailStr isEqual:[NSNull null]]||[emailStr isEqualToString:@"(null)"]||[emailStr isEqualToString:@"<null>"]||emailStr.length == 0) {
        
        model.email = userObjectModel.email;
        
    }else{
        
        model.email = emailStr;
    }
    
    //-----------------------------7---------------------------
    
    NSString * extendStr = [NSString stringWithFormat:@"%@",[object objectForKey:@"extend"]];
    if (extendStr == nil||[extendStr isEqual:[NSNull null]]||[extendStr isEqualToString:@"(null)"]||[extendStr isEqualToString:@"<null>"]||extendStr.length == 0) {
        
        model.extend = userObjectModel.extend;
        
    }else{
        
        model.extend = extendStr;
    }
    
    //-----------------------------8---------------------------
    
    NSString * userIdStr = [NSString stringWithFormat:@"%@",[object objectForKey:@"id"]];
    if (userIdStr == nil||[userIdStr isEqual:[NSNull null]]||[userIdStr isEqualToString:@"(null)"]||[userIdStr isEqualToString:@"<null>"]||userIdStr.length == 0) {
        
        model.userId = userObjectModel.userId;
        
    }else{
        
        model.userId = userIdStr;
    }
    
    //-----------------------------9---------------------------
    
    NSString * isadminStr = [NSString stringWithFormat:@"%@",[object objectForKey:@"is_admin"]];
    if (isadminStr == nil||[isadminStr isEqual:[NSNull null]]||[isadminStr isEqualToString:@"(null)"]||[isadminStr isEqualToString:@"<null>"]||isadminStr.length == 0) {
        
        model.is_admin = userObjectModel.is_admin;
        
    }else{
        
        model.is_admin = isadminStr;
    }
    
    //-----------------------------10---------------------------
    
    NSString * isdeleteStr = [NSString stringWithFormat:@"%@",[object objectForKey:@"is_delete"]];
    if (isdeleteStr == nil||[isdeleteStr isEqual:[NSNull null]]||[isdeleteStr isEqualToString:@"(null)"]||[isdeleteStr isEqualToString:@"<null>"]||isdeleteStr.length == 0) {
        
        model.is_delete = userObjectModel.is_delete;
        
    }else{
        
        model.is_delete = isdeleteStr;
    }
    
    //-----------------------------11---------------------------
    
    NSString * isonlineStr = [NSString stringWithFormat:@"%@",[object objectForKey:@"is_online"]];
    if (isonlineStr == nil||[isonlineStr isEqual:[NSNull null]]||[isonlineStr isEqualToString:@"(null)"]||[isonlineStr isEqualToString:@"<null>"]||isonlineStr.length == 0) {
        
        model.is_online = userObjectModel.is_online;
        
    }else{
        
        model.is_online = isonlineStr;
    }
    
    //-----------------------------12---------------------------
    
    NSString * latStr = [NSString stringWithFormat:@"%@",[object objectForKey:@"lat"]];
    if (latStr == nil||[latStr isEqual:[NSNull null]]||[latStr isEqualToString:@"(null)"]||[latStr isEqualToString:@"<null>"]||latStr.length == 0) {
        
        model.lat = userObjectModel.lat;
        
    }else{
        
        model.lat = latStr;
    }
    
    //-----------------------------13---------------------------
    
    NSString * lngStr = [NSString stringWithFormat:@"%@",[object objectForKey:@"lng"]];
    if (lngStr == nil||[lngStr isEqual:[NSNull null]]||[lngStr isEqualToString:@"(null)"]||[lngStr isEqualToString:@"<null>"]||lngStr.length == 0) {
        
        model.lng = userObjectModel.lng;
        
    }else{
        
        model.lng = lngStr;
    }
    
    //-----------------------------14---------------------------
    
    NSString * logincountStr = [NSString stringWithFormat:@"%@",[object objectForKey:@"login_count"]];
    if (logincountStr == nil||[logincountStr isEqual:[NSNull null]]||[logincountStr isEqualToString:@"(null)"]||[logincountStr isEqualToString:@"<null>"]||logincountStr.length == 0) {
        
        model.login_count = userObjectModel.login_count;
        
    }else{
        
        model.login_count = logincountStr;
    }
    
    //-----------------------------15---------------------------
    
    NSString * logintimeStr = [NSString stringWithFormat:@"%@",[object objectForKey:@"login_time"]];
    if (logintimeStr == nil||[logintimeStr isEqual:[NSNull null]]||[logintimeStr isEqualToString:@"(null)"]||[logintimeStr isEqualToString:@"<null>"]||logintimeStr.length == 0) {
        
        model.login_time = userObjectModel.login_time;
        
    }else{
        
        model.login_time = logintimeStr;
    }
    
    //-----------------------------16---------------------------
    
    NSString * majorStr = [NSString stringWithFormat:@"%@",[object objectForKey:@"major"]];
    if (majorStr == nil||[majorStr isEqual:[NSNull null]]||[majorStr isEqualToString:@"(null)"]||[majorStr isEqualToString:@"<null>"]||majorStr.length == 0) {
        
        model.major = userObjectModel.major;
        
    }else{
        
        model.major = majorStr;
    }
    
    //-----------------------------17---------------------------
    
    NSString * nameStr = [NSString stringWithFormat:@"%@",[object objectForKey:@"name"]];
    if (nameStr == nil||[nameStr isEqual:[NSNull null]]||[nameStr isEqualToString:@"(null)"]||[nameStr isEqualToString:@"<null>"]||nameStr.length == 0) {
        
        model.name = userObjectModel.name;
        
    }else{
        
        model.name = nameStr;
    }
    
    //-----------------------------18---------------------------
    
    NSString * parentidStr = [NSString stringWithFormat:@"%@",[object objectForKey:@"parent_id"]];
    if (parentidStr == nil||[parentidStr isEqual:[NSNull null]]||[parentidStr isEqualToString:@"(null)"]||[parentidStr isEqualToString:@"<null>"]||parentidStr.length == 0) {
        
        model.parent_id = userObjectModel.parent_id;
        
    }else{
        
        model.parent_id = parentidStr;
    }
    
    //-----------------------------19---------------------------
    
    
    NSString * passwordStr = [NSString stringWithFormat:@"%@",[object objectForKey:@"password"]];
    if (passwordStr == nil||[passwordStr isEqual:[NSNull null]]||[passwordStr isEqualToString:@"(null)"]||[passwordStr isEqualToString:@"<null>"]||passwordStr.length == 0) {
        
        model.password = userObjectModel.password;
        
    }else{
        
        model.password = passwordStr;
    }
    
    //-----------------------------20---------------------------
    
    NSString * phoneStr = [NSString stringWithFormat:@"%@",[object objectForKey:@"phone"]];
    if (phoneStr == nil||[phoneStr isEqual:[NSNull null]]||[phoneStr isEqualToString:@"(null)"]||[phoneStr isEqualToString:@"<null>"]||phoneStr.length == 0) {
        
        model.phone = userObjectModel.phone;
        
    }else{
        
        model.phone = phoneStr;
    }
    
    //-----------------------------21---------------------------
    
    NSString * rateStr = [NSString stringWithFormat:@"%@",[object objectForKey:@"rate"]];
    if (rateStr == nil||[rateStr isEqual:[NSNull null]]||[rateStr isEqualToString:@"(null)"]||[rateStr isEqualToString:@"<null>"]||rateStr.length == 0) {
        
        model.rate = userObjectModel.rate;
        
    }else{
        
        model.rate = rateStr;
    }
    
    //-----------------------------22---------------------------
    
    NSString * reccodeStr = [NSString stringWithFormat:@"%@",[object objectForKey:@"rec_code"]];
    if (reccodeStr == nil||[reccodeStr isEqual:[NSNull null]]||[reccodeStr isEqualToString:@"(null)"]||[reccodeStr isEqualToString:@"<null>"]||reccodeStr.length == 0) {
        
        model.rec_code = userObjectModel.rec_code;
        
    }else{
        
        model.rec_code = reccodeStr;
    }
    
    //-----------------------------23---------------------------
    
    NSString * remarkStr = [NSString stringWithFormat:@"%@",[object objectForKey:@"remark"]];
    if (remarkStr == nil||[remarkStr isEqual:[NSNull null]]||[remarkStr isEqualToString:@"(null)"]||[remarkStr isEqualToString:@"<null>"]||remarkStr.length == 0) {
        
        model.remark = userObjectModel.remark;
        
    }else{
        
        model.remark = remarkStr;
    }
    
    //-----------------------------24---------------------------
    
    NSString * roleidStr = [NSString stringWithFormat:@"%@",[object objectForKey:@"role_id"]];
    if (roleidStr == nil||[roleidStr isEqual:[NSNull null]]||[roleidStr isEqualToString:@"(null)"]||[roleidStr isEqualToString:@"<null>"]||roleidStr.length == 0) {
        
        model.role_id = userObjectModel.role_id;
        
    }else{
        
        model.role_id = roleidStr;
    }
    
    //-----------------------------25---------------------------
    
    NSString * scoreStr = [NSString stringWithFormat:@"%@",[object objectForKey:@"score"]];
    if (scoreStr == nil||[scoreStr isEqual:[NSNull null]]||[scoreStr isEqualToString:@"(null)"]||[scoreStr isEqualToString:@"<null>"]||scoreStr.length == 0) {
        
        model.score = userObjectModel.score;
        
    }else{
        
        model.score = scoreStr;
    }
    
    //-----------------------------26---------------------------
    
    NSString * sexStr = [NSString stringWithFormat:@"%@",[object objectForKey:@"sex"]];
    if (sexStr == nil||[sexStr isEqual:[NSNull null]]||[sexStr isEqualToString:@"(null)"]||[sexStr isEqualToString:@"<null>"]||sexStr.length == 0) {
        
        model.sex = userObjectModel.sex;
        
    }else{
        
        model.sex = sexStr;
    }
    
    //-----------------------------27---------------------------
    
    NSString * skillStr = [NSString stringWithFormat:@"%@",[object objectForKey:@"skill"]];
    
    if (skillStr == nil||[skillStr isEqual:[NSNull null]]||[skillStr isEqualToString:@"(null)"]||[skillStr isEqualToString:@"<null>"]||skillStr.length == 0) {
        
        model.skill = userObjectModel.skill;
        
    }else{
        
        model.skill = skillStr;
    }
    
    
    //-----------------------------28---------------------------
    
    NSString * territoryStr = [NSString stringWithFormat:@"%@",[object objectForKey:@"territory"]];
    if (territoryStr == nil||[territoryStr isEqual:[NSNull null]]||[territoryStr isEqualToString:@"(null)"]||[territoryStr isEqualToString:@"<null>"]||territoryStr.length == 0) {
        
        model.territory = userObjectModel.territory;
        
    }else{
        
        model.territory = territoryStr;
    }
    
    //-----------------------------29---------------------------
    
    NSString * wagesStr = [NSString stringWithFormat:@"%@",[object objectForKey:@"wages"]];
    if (wagesStr == nil||[wagesStr isEqual:[NSNull null]]||[wagesStr isEqualToString:@"(null)"]||[wagesStr isEqualToString:@"<null>"]||wagesStr.length == 0) {
        
        model.wages = userObjectModel.wages;
        
    }else{
        
        model.wages = wagesStr;
    }
    //-----------------------------30---------------------------
    
    NSString * realStr = [NSString stringWithFormat:@"%@",[object objectForKey:@"is_real"]];
    if (realStr == nil||[realStr isEqual:[NSNull null]]||[realStr isEqualToString:@"(null)"]||[realStr isEqualToString:@"<null>"]||realStr.length == 0) {
        
        model.is_real = userObjectModel.is_real;
        
    }else{
        
        model.is_real = realStr;
    }

    
    [[PublicManager shareInstance].userManager codeNSUserDefaultsUserInfo:model];
    
}

@end

