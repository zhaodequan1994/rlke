//
//  PersoalUserModel.m
//  zhongligongxiang
//
//  Created by zhaodq on 2019/1/16.
//  Copyright © 2019 zhaodq. All rights reserved.
//

#import "PersoalUserModel.h"

@implementation PersoalUserModel

-(NSString *)wages{
    
    if (_wages == nil||[_wages isEqual:[NSNull null]]||[_wages isEqualToString:@"(null)"]) {
        
        return @"0";
    }
    
    return _wages;
}
-(NSString *)used_cash{
    
    if (_used_cash == nil||[_used_cash isEqual:[NSNull null]]||[_used_cash isEqualToString:@"(null)"]) {
        
        return @"0";
    }
    
    return _used_cash;
}
-(NSString *)using_cash{
    
    if (_using_cash == nil||[_using_cash isEqual:[NSNull null]]||[_using_cash isEqualToString:@"(null)"]) {
        
        return @"0";
    }
    
    return _using_cash;
}
-(NSString *)name{
    
    if (_name == nil||[_name isEqual:[NSNull null]]||[_name isEqualToString:@"(null)"]) {
        
        return @"";
    }
    
    return _name;
}

-(NSString *)fans_num{
    
    if (_fans_num == nil||[_fans_num isEqual:[NSNull null]]||[_fans_num isEqualToString:@"(null)"]) {
        
        return @"0";
    }
    
    return _fans_num;
}

-(NSString *)follows_num{
    
    if (_follows_num == nil||[_follows_num isEqual:[NSNull null]]||[_follows_num isEqualToString:@"(null)"]) {
        
        return @"0";
    }
    
    return _follows_num;
}

-(NSString *)th_nums{
    
    if (_th_nums == nil||[_th_nums isEqual:[NSNull null]]||[_th_nums isEqualToString:@"(null)"]) {
        
        return @"0";
    }
    
    return _th_nums;
}

-(NSString *)get_th_nums{
    
    if (_get_th_nums == nil||[_get_th_nums isEqual:[NSNull null]]||[_get_th_nums isEqualToString:@"(null)"]) {
        
        return @"0";
    }
    
    return _get_th_nums;
}

@end
