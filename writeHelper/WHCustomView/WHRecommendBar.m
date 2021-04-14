//
//  WHRecommendBar.m
//  易书
//
//  Created by 张成敏 on 2021/4/14.
//

#import "WHRecommendBar.h"

#import <Masonry/Masonry.h>
#import <SDWebImage/SDWebImage.h>

#import "WHColorDefine.h"
#import "WHBasicButton.h"

@interface WHRecommendBar()

@property (nonatomic, strong) UIImageView *backImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) WHBasicButton *button;

@end

@implementation WHRecommendBar

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews
{
    [self addSubview:self.backImageView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.button];
    [self configUI];
}

- (void)configUI
{
    [self.backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.leading.equalTo(self).offset(21);
        make.trailing.equalTo(self).offset(-21);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10);
        make.height.equalTo(@30);
        make.leading.equalTo(self.backImageView).offset(16);
        make.trailing.equalTo(self.backImageView).offset(-16);
    }];
    
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
        make.height.equalTo(@31);
        make.width.equalTo(@95);
        make.leading.equalTo(self.backImageView).offset(16);
    }];
}

- (void)setTitle:(NSString *)title
{
    [self.titleLabel setText:title];
}

- (void)setBackImageURL:(NSString *)url
{
    [self.backImageView sd_setImageWithURL:[NSURL URLWithString:url]];
}

#pragma mark - Lazy Load

- (UIImageView *)backImageView
{
    if (!_backImageView) {
        _backImageView = [[UIImageView alloc]init];
        _backImageView.layer.masksToBounds = YES;
        _backImageView.layer.cornerRadius = 20;
    }
    return _backImageView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        [_titleLabel setFont:[UIFont boldSystemFontOfSize:22]];
        [_titleLabel setTextColor:WH_WHITE_COLOR];
    }
    return _titleLabel;
}

- (WHBasicButton *)button
{
    if (!_button) {
        _button = [[WHBasicButton alloc]init];
        [_button setTitle:@"点击查看"];
    }
    return _button;
}

@end
