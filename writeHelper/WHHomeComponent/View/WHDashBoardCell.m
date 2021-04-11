//
//  WHDashBoardCell.m
//  易书
//
//  Created by 张成敏 on 2021/4/11.
//

#import "WHDashBoardCell.h"

#import "WHColorDefine.h"

#import <Masonry/Masonry.h>

@interface WHDashBoardCell ()

@property (nonatomic, strong, readwrite) UIView *bgView;

@property (nonatomic, strong, readwrite) UILabel *mainTitleLabel;

@end

@implementation WHDashBoardCell

- (instancetype)init
{
    if (self = [super init]) {
        [self setupSubviews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews
{
    [self.contentView addSubview:self.bgView];
    [self.contentView addSubview:self.mainTitleLabel];
    [self layoutSubviews];
}

- (void)layoutSubviews
{
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.height.equalTo(@100);
        make.leading.equalTo(self.contentView.mas_leading).offset(21);
        make.trailing.equalTo(self.contentView.mas_trailing).offset(-21);
    }];
    
    [self.mainTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView.mas_leading).offset(26);
        make.trailing.equalTo(self.contentView.mas_trailing).offset(-26);
        make.top.equalTo(self.bgView.mas_bottom).offset(20);
        make.bottom.equalTo(self.contentView);
    }];
}

#pragma mark - Lazy Load

- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc]init];
        [_bgView setBackgroundColor:WH_WHITE_COLOR];
        _bgView.layer.cornerRadius = 20;
        _bgView.layer.shadowColor = [UIColor blackColor].CGColor;
        _bgView.layer.shadowOffset = CGSizeMake(0.0f, 3.0f);
        _bgView.layer.shadowOpacity = 0.16f;
        _bgView.layer.shadowRadius = 6;
    }
    return _bgView;
}

- (UILabel *)mainTitleLabel
{
    if (!_mainTitleLabel) {
        _mainTitleLabel = [[UILabel alloc]init];
        [_mainTitleLabel setFont:[UIFont boldSystemFontOfSize:21]];
        [_mainTitleLabel setTextColor:WH_BLACK_COLOR];
        [_mainTitleLabel setText:@"本周学习内容"];
    }
    return _mainTitleLabel;
}

@end
