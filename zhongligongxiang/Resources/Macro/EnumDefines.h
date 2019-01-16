//
//  EnumDefines.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#ifndef EnumDefines_h
#define EnumDefines_h

//工作列表类型
typedef NS_ENUM(NSInteger, WorksListType) {
    
    WorksBillType = 1,//发单记录
    WorksCommitType = 2,//评价确认
    
};

//认证类型
typedef NS_ENUM(NSInteger, AuthenType) {
    
    AuthenTypeSuccess = 1,//认证成功
    AuthenTypeFail = 2,//认证失败
    
};

//性别
typedef NS_ENUM(NSInteger, SexType) {
    
    SexTypeNone = 0,//性别
    SexTypeMale = 1,//男
    SexTypeFemale = 2,//女
    
};



#endif /* EnumDefines_h */
