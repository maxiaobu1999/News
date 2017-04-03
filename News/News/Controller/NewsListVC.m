//
//  NewsListVC.m
//  News
//
//  Created by 徐伟博 on 2017/4/3.
//  Copyright © 2017年 徐伟博. All rights reserved.
//

#import "NewsListVC.h"
#import "CodingHelper.h"
#import "APIManager.h"

@interface NewsListVC () <APIManagerDelegate> {
    APIManager *_manager;
}

@end

@implementation NewsListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"News";
    self.view.backgroundColor = kCyan;
    
    _manager = [[APIManager alloc] init];
    _manager.delegate = self;
    [_manager getNewsWithType:@"yule"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getNewsDidSucceedWithJSONDict:(NSDictionary *)jsonDict {
    kOutput(jsonDict);
}

- (void)getNewsDidFailWithError:(NSError *)error {
    kOutput(error);
}

@end
