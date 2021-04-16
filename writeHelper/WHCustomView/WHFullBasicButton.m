//
//  WHFullBasicButton.m
//  易书
//
//  Created by 张成敏 on 2021/4/15.
//

#import "WHFullBasicButton.h"

#import <Masonry/Masonry.h>

#import "WHColorDefine.h"

@interface WHFullBasicButton()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *arrow;

@end

@implementation WHFullBasicButton

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setBackgroundColor:WH_MIAN_THEME_COLOR];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 17;
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews
{
    [self addSubview:self.titleLabel];
    [self addSubview:self.arrow];
    [self configUI];
}

- (void)configUI
{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.leading.equalTo(self).offset(12);
        make.trailing.equalTo(self).offset(-18);
    }];
    
    [self.arrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.height.equalTo(@(18.5));
        make.width.equalTo(@(10.5));
        make.trailing.equalTo(self).offset(-12);
    }];
}

- (void)setTitle:(NSString *)title
{
    [self.titleLabel setText:title];
}

#pragma mark - Lazy Load

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        [_titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
        [_titleLabel setTextColor:WH_WHITE_COLOR];
    }
    return _titleLabel;
}

- (UIImageView *)arrow
{
    if (!_arrow) {
        _arrow = [[UIImageView alloc]init];
        [_arrow setImage:[UIImage imageNamed:@"buttonWhiteArrow"]];
    }
    return _arrow;
}

@end

