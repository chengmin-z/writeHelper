//
//  WHSquarePreviewView.m
//  易书
//
//  Created by 张成敏 on 2021/4/2.
//

#import "WHSquarePreviewView.h"

#import <Masonry/Masonry.h>

#import "WHColorDefine.h"

@interface WHSquarePreviewView()

@property (nonatomic, strong) UIImageView *backImageView;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation WHSquarePreviewView

- (instancetype)initWithPreviewImage:(nullable UIImage *)image
{
    if (self = [super init]) {
        [self configUI];
        [self setupSubviews];
        [self setPreviewImage:image];
    }
    return self;
}

- (void)configUI
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 34;
    self.layer.borderColor = WH_MIAN_THEME_COLOR.CGColor;
    self.layer.borderWidth = 2;
    [self.imageView setAlpha:0.8];
    [self.backImageView setImage:[UIImage imageNamed:@"PreviewBackGround"]];
}

- (void)setupSubviews
{
    [self addSubview:self.backImageView];
    [self addSubview:self.imageView];
    [self layoutSubviews];
}

- (void)layoutSubviews
{
    [self.backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self).offset(-42);
        make.height.equalTo(self).offset(-42);
        make.centerX.equalTo(self);
        make.centerY.equalTo(self);
    }];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.backImageView).offset(-10);
        make.height.equalTo(self.backImageView).offset(-10);
        make.centerX.equalTo(self);
        make.centerY.equalTo(self);
    }];
}

- (void)setPreviewImage:(UIImage *)image
{
    [self.imageView setImage:image];
}

#pragma mark - Lazy Load

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
        [_imageView setContentMode:UIViewContentModeScaleAspectFit];
    }
    return _imageView;
}

- (UIImageView *)backImageView
{
    if (!_backImageView) {
        _backImageView = [[UIImageView alloc]init];
        [_backImageView setContentMode:UIViewContentModeScaleAspectFit];
    }
    return _backImageView;
}

@end
