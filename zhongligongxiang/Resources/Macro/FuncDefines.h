//
//  FuncDefines.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#ifndef FuncDefines_h
#define FuncDefines_h

// String
#define ZLGX_STRING(_string) NSLocalizedString(_string, @"")

// Load Main Bundle File
#define MAIN_BUNDLE_LOAD_NIB_FILE(_file) [[NSBundle mainBundle] loadNibNamed:_file owner:self options:nil].firstObject

// WeakSelf

#define WEAKSELF typeof(self) __weak weakSelf = self;



//Block

typedef void(^RequestBlock)();



#endif /* FuncDefines_h */
