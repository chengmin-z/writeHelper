//
//  WHRecommendCell.m
//  易书
//
//  Created by 张成敏 on 2021/4/14.
//

#import "WHRecommendCell.h"

#import "WHColorDefine.h"
#import "WHRecommendBar.h"

#import <Masonry/Masonry.h>

@interface WHRecommendCell ()

@property (nonatomic, strong, readwrite) WHRecommendBar *recommendBar;

@end

@implementation WHRecommendCell

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
    [self.contentView addSubview:self.recommendBar];
    [self layoutSubviews];
}

- (void)layoutSubviews
{
    [self.recommendBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(self.contentView);
    }];
}

- (void)setBackImgUrl:(NSString *)url
{
    [self.recommendBar setBackImageURL:url];
}

- (void)setTitle:(NSString *)title
{
    [self.recommendBar setTitle:title];
}

#pragma mark - Lazy Load

- (WHRecommendBar *)recommendBar
{
    if (!_recommendBar) {
        _recommendBar = [[WHRecommendBar alloc]init];
    }
    return _recommendBar;
}

@end
