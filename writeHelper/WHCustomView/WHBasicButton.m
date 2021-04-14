//
//  WHBasicButton.m
//  易书
//
//  Created by 张成敏 on 2021/4/14.
//

#import "WHBasicButton.h"

#import <Masonry/Masonry.h>

#import "WHColorDefine.h"

@interface WHBasicButton()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *arrow;

@end

@implementation WHBasicButton

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setBackgroundColor:WH_WHITE_COLOR];
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
        make.height.equalTo(@(14.2));
        make.width.equalTo(@(7.5));
        make.trailing.equalTo(self).offset(-16);
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
        [_titleLabel setFont:[UIFont boldSystemFontOfSize:12]];
        [_titleLabel setTextColor:WH_MIAN_THEME_COLOR];
    }
    return _titleLabel;
}

- (UIImageView *)arrow
{
    if (!_arrow) {
        _arrow = [[UIImageView alloc]init];
        [_arrow setImage:[UIImage imageNamed:@"buttonSmallPurpleArrow"]];
    }
    return _arrow;
}

@end
