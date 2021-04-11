//
//  WHSearchCell.m
//  易书
//
//  Created by 张成敏 on 2021/4/11.
//

#import "WHSearchCell.h"

#import "WHColorDefine.h"

#import <Masonry/Masonry.h>

@interface WHSearchCell ()

@property (nonatomic, strong, readwrite) UIView *searchView;

@property (nonatomic, strong, readwrite) UILabel *searchExampleLabel;

@property (nonatomic, strong, readwrite) UIImageView *searchLeftButton;

@property (nonatomic, strong, readwrite) UIButton *extraButton;

@property (nonatomic, copy, nullable) void (^buttonClickBlock)(void);

@property (nonatomic, copy, nullable) void (^searchClickBlock)(void);


@end

@implementation WHSearchCell

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
    [self.contentView addSubview:self.searchView];
    [self.contentView addSubview:self.extraButton];
    [self.contentView addSubview:self.searchLeftButton];
    [self.contentView addSubview:self.searchExampleLabel];
    [self layoutSubviews];
}

- (void)layoutSubviews
{
    [self.extraButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.contentView).offset(-21);
        make.centerY.equalTo(self.contentView);
        make.width.equalTo(@32);
    }];
    
    [self.searchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.contentView);
        make.leading.equalTo(self.contentView).offset(21);
        make.trailing.equalTo(self.extraButton.mas_leading).offset(-10);
    }];
    
    [self.searchLeftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.searchView);
        make.leading.equalTo(self.searchView).offset(25);
        make.width.equalTo(@22);
        make.height.equalTo(@16);
    }];
    
    [self.searchExampleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.searchView);
        make.leading.equalTo(self.searchLeftButton.mas_trailing);
        make.trailing.equalTo(self.searchView).offset(-10);
        make.height.equalTo(@34);
    }];
}

- (void)setTitle:(NSString *)title
{
    [self.searchExampleLabel setText:[title copy]];
}

- (void)setSearchClickBlock:(void(^)(void))block
{
    self.searchClickBlock = block;
}

- (void)setButtonClickBlock:(void(^)(void))block
{
    self.buttonClickBlock = block;
}

# pragma mark - Lazy Load

- (UIView *)searchView
{
    if (!_searchView) {
        _searchView = [[UIView alloc]init];
        [_searchView setAlpha:0.2];
        [_searchView setBackgroundColor:WH_WHITE_COLOR];
        _searchView.layer.cornerRadius = 17;
        _searchView.layer.masksToBounds = YES;
    }
    return _searchView;
}

- (UIImageView *)searchLeftButton
{
    if (!_searchLeftButton) {
        _searchLeftButton = [[UIImageView alloc]init];
        [_searchLeftButton setImage:[UIImage imageNamed:@"SearchButton"]];
    }
    return _searchLeftButton;
}

- (UILabel *)searchExampleLabel
{
    if (!_searchExampleLabel) {
        _searchExampleLabel = [[UILabel alloc]init];
        [_searchExampleLabel setFont:[UIFont boldSystemFontOfSize:14]];
        [_searchExampleLabel setTextColor:WH_WHITE_COLOR];
    }
    return _searchExampleLabel;
}

- (UIButton *)extraButton
{
    if (!_extraButton) {
        _extraButton = [[UIButton alloc]init];
        [_extraButton setImage:[UIImage imageNamed:@"StudyCalendarButton"] forState:UIControlStateNormal];
    }
    return _extraButton;
}


@end
