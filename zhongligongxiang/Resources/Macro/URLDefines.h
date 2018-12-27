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
#define BASE_URL @"http://120.79.165.130:3369"
#else
#define BASE_URL @"http://120.79.165.130:3369"
#endif


//Login

#define PATH_LOGIN            @"/login-t/user-login"
#define PATH_REGISTER         @"/login-t/user-register"
#define PATH_SNSCODE          @"/login/send-message"


#endif /* URLDefines_h */
