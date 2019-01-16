//
//  BaseNetwork.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "BaseNetwork.h"

static BaseNetwork *baseNetwork = nil;

@interface BaseNetwork ()

@property (assign, nonatomic) NSUInteger identifier;

@end

@implementation BaseNetwork


+(instancetype)shareInstance{
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        baseNetwork = [[BaseNetwork alloc] init];
    });
    
    return baseNetwork;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    if (!baseNetwork)
    {
        baseNetwork = [super allocWithZone:zone];
        
        return baseNetwork;
    }
    
    return nil;
}

#pragma mark - NetworkRequest

+(void)networkRequestWithPath:(NSString *)path parameters:(NSDictionary *)paramaters sender:(UIView *)sender begin:(void (^)())begin success:(void (^)(id))success error:(void (^)(id))error failure:(void (^)(id))failure{
    
    [self setupNetworkRequestConfiguration];
    
    [self setupHTTPHeader];
    
    [self setupNetworkRequestWithPath:path parameters:paramaters sender:sender begin:begin success:success error:error failure:failure];
}

+(void)networkGetRequestWithPath:(NSString *)path parameters:(NSDictionary *)paramaters sender:(UIView *)sender begin:(void (^)())begin success:(void (^)(id))success error:(void (^)(id))error failure:(void (^)(id))failure{
    
    [self setupNetworkRequestConfiguration];
    
    [self setupHTTPHeader];
    
    [self setupNetworkGetRequestWithPath:path parameters:paramaters sender:sender begin:begin success:success error:error failure:failure];
    
}

#pragma mark - Header

+(void)setupHTTPHeader{
    
    
    [[BaseNetwork shareInstance].requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    

}

+(void)setupJsonHTTPHeader{
    
    
    [[BaseNetwork shareInstance].requestSerializer setValue:@"ios" forHTTPHeaderField:@"channel"];
    
    [[BaseNetwork shareInstance].requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
}

+(void)setupNetworkRequestConfiguration{
    
    [BaseNetwork shareInstance].requestSerializer.timeoutInterval = 20;
    
    [BaseNetwork shareInstance].responseSerializer  = [AFJSONResponseSerializer serializer];
    
    [BaseNetwork shareInstance].requestSerializer = [AFHTTPRequestSerializer serializer];
    
    [BaseNetwork shareInstance].responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript", @"text/plain",@"application/x-javascript",@"application/javascript",@"charset=UTF-8", nil];
    
}

#pragma mark - Request

+ (void)setupNetworkRequestWithPath:(NSString *)path parameters:(NSDictionary *)parameters sender:(UIView *)sender begin:(void (^)())begin success:(void (^)(id object))success error:(void (^)(id object))error failure:(void (^)(id object))failure{
    
    NSString * URL = [NSString stringWithFormat:@"%@%@",BASE_URL,path];
    
    sender.userInteractionEnabled = NO;
    
    if (begin) {
        
        begin();
        
    }
    
    [BaseNetwork shareInstance].identifier = [[BaseNetwork shareInstance] POST:URL parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString * codeString = responseObject[@"code"];
        
        if (codeString.integerValue == 200) {
            
            [self setupSuccessStatus:responseObject success:success sender:sender];

        }else{
            
            [self setupFailtureStatus:responseObject task:task failture:failure sender:sender];

        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSData* data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
        
        if (data == nil) {
            
        }else{
            
            NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            
            [self setupFailtureStatus:dic task:task failture:failure sender:sender];
            
        }
        
    }].taskIdentifier;
    
}

+ (void)setupNetworkGetRequestWithPath:(NSString *)path parameters:(NSDictionary *)parameters sender:(UIView *)sender begin:(void (^)())begin success:(void (^)(id object))success error:(void (^)(id object))error failure:(void (^)(id object))failure{
    
    NSString * URL = path;
    
    NSDictionary * dicData = @{};
    sender.userInteractionEnabled = NO;
    
    if (begin) {
        
        begin();
        
    }
    
    [BaseNetwork shareInstance].identifier = [[BaseNetwork shareInstance] GET:URL parameters:dicData progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [self setupSuccessStatus:responseObject success:success sender:sender];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSData* data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
        
        if (data == nil) {
            
        }else{
            
            NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            
            [self setupFailtureStatus:dic task:task failture:failure sender:sender];
        }
        
    }].taskIdentifier;
}

#pragma mark - Status

+ (void)setupSuccessStatus:(id)responseObject success:(void (^)(id object))success sender:(UIView *)sender
{
    sender.userInteractionEnabled = YES;
    
    if (success)
    {
        success(responseObject);
        
    }
}

+ (void)setupErrorStatus:(id)responseObject error:(void (^)(id object))error sender:(UIView *)sender
{
    sender.userInteractionEnabled = YES;
    
    if (error)
    {
        error(responseObject);
    }
    
}

+ (void)setupFailtureStatus:(NSDictionary *)errordic task:(NSURLSessionDataTask *)task failture:(void (^)(id object))failure sender:(UIView *)sender
{
    sender.userInteractionEnabled = YES;
    
    if (failure)
    {
        failure(errordic);
    }
    
}

#pragma mark - Task

+ (void)cancelLastTask
{
    for (NSURLSessionTask *task in [BaseNetwork shareInstance].tasks)
    {
        if (task.taskIdentifier == [BaseNetwork shareInstance].identifier)
        {
            [task cancel];
            
            break;
        }
    }
}


@end
