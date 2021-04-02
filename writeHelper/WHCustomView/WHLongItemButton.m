//
//  WHLongItemButton.m
//  易书
//
//  Created by 张成敏 on 2021/4/2.
//

#import "WHLongItemButton.h"

#import "WHColorDefine.h"

@implementation WHLongItemButton

- (instancetype)initWithTitle:(NSString *)title
{
    if (self = [super init]) {
        [self setTitle:title];
        [self configUI];
    }
    return self;
}

- (void)configUI
{
    [self.titleLabel setFont:[UIFont boldSystemFontOfSize:19.0]];
    [super setTitleColor: WH_WHITE_COLOR forState:UIControlStateNormal];
    
    self.layer.cornerRadius = 15;
    self.layer.masksToBounds = YES;
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.startPoint = CGPointMake(0, 0);
    gradient.endPoint = CGPointMake(1, 0);
    gradient.frame = CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width - 42 , 50);
    gradient.colors = [NSArray arrayWithObjects:(id)WH_PURPLE_COLOR.CGColor,(id)WH_LIGHT_PURPLE_COLOR.CGColor,nil];
    [self.layer insertSublayer:gradient atIndex:0];
}

- (void)setTitle:(NSString *)title
{
    [super setTitle:title forState:UIControlStateNormal];
}


@end
