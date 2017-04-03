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
#import "NewsCell.h"
#import "NewsDetailVC.h"

@interface NewsListVC () <APIManagerDelegate, UITableViewDelegate, UITableViewDataSource> {
    APIManager *_manager;
    UITableView *_theTableView;
    NSArray *_dataArray;
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
    
    _theTableView = [CodingHelper createTableViewWithFrame:kScreenB backgroundColor:kWhite style:UITableViewStylePlain dataSource:self delegate:self];
    _theTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _theTableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_theTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - API -

- (void)getNewsDidSucceedWithJSONDict:(NSDictionary *)jsonDict {
    kOutput(jsonDict);
    _dataArray = jsonDict[@"result"][@"data"];
    [_theTableView reloadData];
}

- (void)getNewsDidFailWithError:(NSError *)error {
    kOutput(error);
}

#pragma mark - Table -

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseID = @"NewsCell";
    NewsCell *aCell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (!aCell) {
        aCell = [[NewsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
        aCell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSDictionary *dict = _dataArray[indexPath.row];
    aCell.dateLb.text = dict[@"date"];
    aCell.titleLb.text = dict[@"title"];
    return aCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dict = _dataArray[indexPath.row];
    NewsDetailVC *vc = [[NewsDetailVC alloc] init];
    vc.newsURL = dict[@"url"];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
