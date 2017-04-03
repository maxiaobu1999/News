//
//  NewsCell.m
//  News
//
//  Created by 徐伟博 on 2017/4/3.
//  Copyright © 2017年 徐伟博. All rights reserved.
//

#import "NewsCell.h"
#import "CodingHelper.h"

@implementation NewsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _dateLb = [CodingHelper createLabelWithFrame:CGRectMake(10, 10, kScreenW-20, 20) backgroundColor:kClear text:nil lines:1 font:kSysFont(15) textColor:kGray align:NSTextAlignmentLeft breakMode:NSLineBreakByWordWrapping];
        [self.contentView addSubview:_dateLb];
        
        _titleLb = [CodingHelper createLabelWithFrame:CGRectMake(10, 30, kScreenW-20, 40) backgroundColor:kClear text:nil lines:2 font:kSysFont(15) textColor:kBlack align:NSTextAlignmentLeft breakMode:NSLineBreakByWordWrapping];
        [self.contentView addSubview:_titleLb];
        
        [self.contentView addSubview:[CodingHelper createViewWithFrame:CGRectMake(0, 79, kScreenW, 1) backgroundColor:kColorFromRGB16(0xeeeeee, 1)]];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
