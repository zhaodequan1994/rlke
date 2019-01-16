//
//  URLDefines.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#ifndef URLDefines_h
#define URLDefines_h

#ifdef OFFICIAL
#define BASE_URL @"http://www.zhrlgx.com:3369"
#else
#define BASE_URL @"http://www.zhrlgx.com:3369"
#endif


//Image

#define PATH_IMAGE_UPDATE                   @"http://oss-cn-shenzhen.aliyuncs.com"
#define PATH_IMAGE                          @"http://renli.oss-cn-shenzhen.aliyuncs.com/"

//Login

#define PATH_LOGIN                   @"/login-t/user-login"
#define PATH_REGISTER                @"/login-t/user-register"
#define PATH_SNSCODE                 @"/login/send-message"
#define PATH_RESERTPASSWORD          @"/login-t/reset-password"

//PersonalCenter
#define PATH_USERINFO                @"/login-t/get-user-info"
#define PATH_MYFOLLOWS               @"/personal/get-my-follows"
#define PATH_MYFANS                  @"/personal/get-my-fans"
#define PATH_REALNAME                @"/personal/real-name"
#define PATH_MODIFYINFO              @"/personal/modify-personal-info"
#define PATH_REALNAME                @"/personal/real-name"


#endif /* URLDefines_h */
