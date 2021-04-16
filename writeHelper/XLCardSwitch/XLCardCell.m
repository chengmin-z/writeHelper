//
//  Card.m
//  CardSwitchDemo
//
//  Created by Apple on 2016/11/9.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "XLCardCell.h"
#import "XLCardModel.h"

#import "WHColorDefine.h"
#import "WHFullBasicButton.h"

#import <Masonry/Masonry.h>
#import <SDWebImage/SDWebImage.h>

@interface XLCardCell ()

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *indexLabel;

@property (nonatomic, strong) WHFullBasicButton *button;

@end

@implementation XLCardCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.layer.cornerRadius = 21;
        self.layer.masksToBounds = true;
        self.backgroundColor = [UIColor clearColor];
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews
{
    [self addSubview:self.imageView];
    [self addSubview:self.button];
    [self addSubview:self.indexLabel];
    [self addSubview:self.titleLabel];
    [self layoutSubviews];
}

- (void)layoutSubviews
{
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.leading.trailing.equalTo(self.contentView);
    }];
    
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(248);
        make.height.equalTo(@36);
        make.width.equalTo(@112);
        make.leading.equalTo(self.contentView).offset(15);
    }];
    
    [self.indexLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(14);
        make.leading.equalTo(self.contentView).offset(15);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(200);
        make.leading.equalTo(self.contentView).offset(15);
    }];
}

- (void)setModel:(XLCardModel *)model {
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.imageName]];
    [self.titleLabel setText:model.title];
    [self.indexLabel setText:model.subTitle];
}

- (UIImageView *)imageView
{
    if (!_imageView) {
        self.imageView = [[UIImageView alloc] init];
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        self.imageView.layer.masksToBounds = true;
    }
    return _imageView;
}


#pragma mark - Lazy Load

- (WHFullBasicButton *)button
{
    if (!_button) {
        _button = [[WHFullBasicButton alloc]init];
        [_button setTitle:@"开始学习"];
    }
    return _button;
}

- (UILabel *)indexLabel
{
    if (!_indexLabel) {
        _indexLabel = [[UILabel alloc]init];
        [_indexLabel setFont:[UIFont boldSystemFontOfSize:22]];
        [_indexLabel setTextColor:WH_WHITE_COLOR];
    }
    return _indexLabel;
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

@end
