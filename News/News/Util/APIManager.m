//
//  APIManager.m
//  News
//
//  Created by 徐伟博 on 2017/4/3.
//  Copyright © 2017年 徐伟博. All rights reserved.
//

#import "APIManager.h"
#import "AFNetworking.h"

#define kHOST @"http://toutiao-ali.juheapi.com/"

@implementation APIManager

- (AFHTTPSessionManager *)manager {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = 10.0;
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    return manager;
}

- (void)getNewsWithType:(NSString *)type {
    AFHTTPSessionManager *manager = [self manager];
    NSString *urlStr = [NSString stringWithFormat:@"%@toutiao/index?type=%@", kHOST, type];
    [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        // 进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 成功
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        if (self.delegate && [self.delegate respondsToSelector:@selector(getNewsDidSucceedWithJSONDict:)]) {
            [self.delegate getNewsDidSucceedWithJSONDict:jsonDict];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 失败
        if (self.delegate && [self.delegate respondsToSelector:@selector(getNewsDidFailWithError:)]) {
            [self.delegate getNewsDidFailWithError:error];
        }
    }];
}

@end
