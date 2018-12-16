//
//  RectDefines.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#ifndef RectDefines_h
#define RectDefines_h

#define iPhone6Plus_SCREEN  [UIScreen mainScreen].bounds.size.height == 736
#define iPhone6_SCREEN      [UIScreen mainScreen].bounds.size.height == 667
#define iPhone5_SCREEN      [UIScreen mainScreen].bounds.size.height == 568
#define iPhone4_SCREEN      [UIScreen mainScreen].bounds.size.height == 480
#define iPhone4_SCREEN_Landscape      [UIScreen mainScreen].bounds.size.width == 480

#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_RECT   CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)


#define iPhone5_WIDTH     320
#define iPhone6_WIDTH     375


#endif /* RectDefines_h */
