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
@property (nonatomic, strong) UIImageView *standardImageView;
@property (nonatomic, strong) UIImageView *inputImageView;

@end

@implementation WHSquarePreviewView

- (instancetype)initWithPreviewImage:(nullable UIImage *)image
{
    if (self = [super init]) {
        [self configUI];
        [self setupSubviews];
        [self setBackPreviewImage:image];
    }
    return self;
}

- (void)configUI
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 34;
    self.layer.borderColor = WH_MIAN_THEME_COLOR.CGColor;
    self.layer.borderWidth = 2;
    [self.backImageView setImage:[UIImage imageNamed:@"PreviewBackGround"]];
}

- (void)setupSubviews
{
    [self addSubview:self.backImageView];
    [self addSubview:self.standardImageView];
    [self addSubview:self.inputImageView];
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
    
    [self.standardImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.backImageView).offset(-10);
        make.height.equalTo(self.backImageView).offset(-10);
        make.centerX.equalTo(self);
        make.centerY.equalTo(self);
    }];
    
    [self.inputImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.backImageView).offset(-10);
        make.height.equalTo(self.backImageView).offset(-10);
        make.centerX.equalTo(self);
        make.centerY.equalTo(self);
    }];
}

- (void)setBackPreviewImageHidden:(BOOL)hidden
{
    [self.standardImageView setHidden:hidden];
}

- (void)setInputPreviewImageHidden:(BOOL)hidden
{
    [self.inputImageView setHidden:hidden];
}

- (void)setBackPreviewImage:(UIImage *)image
{
    [self.standardImageView setImage:image];
}

- (void)setInputPreviewImage:(UIImage *)image
{
    [self.inputImageView setImage:image];
}

#pragma mark - Lazy Load

- (UIImageView *)inputImageView
{
    if (!_inputImageView) {
        _inputImageView = [[UIImageView alloc]init];
        [_inputImageView setContentMode:UIViewContentModeScaleAspectFit];
    }
    return _inputImageView;
}

- (UIImageView *)standardImageView
{
    if (!_standardImageView) {
        _standardImageView = [[UIImageView alloc]init];
        [_standardImageView setContentMode:UIViewContentModeScaleAspectFit];
    }
    return _standardImageView;
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
