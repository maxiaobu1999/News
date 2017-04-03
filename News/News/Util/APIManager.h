//
//  APIManager.h
//  News
//
//  Created by 徐伟博 on 2017/4/3.
//  Copyright © 2017年 徐伟博. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol APIManagerDelegate <NSObject>

@optional

- (void)getNewsDidSucceedWithJSONDict:(NSDictionary *)jsonDict;
- (void)getNewsDidFailWithError:(NSError *)error;

@end

@interface APIManager : NSObject

@property (nonatomic, weak) id <APIManagerDelegate> delegate;

- (void)getNewsWithType:(NSString *)type;

@end
