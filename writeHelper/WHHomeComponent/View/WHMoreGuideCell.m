//
//  WHMoreGuideCell.m
//  易书
//
//  Created by 张成敏 on 2021/4/2.
//

#import "WHMoreGuideCell.h"

#import "WHColorDefine.h"
#import "WHLongItemButton.h"

#import <Masonry/Masonry.h>

@interface WHMoreGuideCell ()

@property (nonatomic, strong, readwrite) WHLongItemButton *infoButton;
@property (nonatomic, strong, readwrite) NSString *buttonTitle;
@property (nonatomic, copy, nullable) void (^buttonClickBlock)(void);


@end

@implementation WHMoreGuideCell

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
    [self.contentView addSubview:self.infoButton];
    [self layoutSubviews];
}

- (void)layoutSubviews
{
    [self.infoButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.contentView);
        make.trailing.equalTo(self.contentView).offset(-21);
        make.leading.equalTo(self.contentView).offset(21);
    }];
}

- (void)setTitle:(NSString *)title
{
    self.buttonTitle = [title copy];
    [self.infoButton setTitle:self.buttonTitle forState:UIControlStateNormal];
}

- (void)setActionBlock:(void(^)(void))block
{
    self.buttonClickBlock = block;
}

- (void)actionForButton
{
    !self.buttonClickBlock ?: self.buttonClickBlock();
}

#pragma mark - Lazy Load
- (UIButton *)infoButton
{
    if (!_infoButton) {
        _infoButton = [[WHLongItemButton alloc]initWithTitle:@""];
        [_infoButton addTarget:self action:@selector(actionForButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _infoButton;
}

- (NSString *)buttonTitle
{
    if (!_buttonTitle) {
        _buttonTitle = [[NSString alloc]init];
    }
    return _buttonTitle;
}

@end
