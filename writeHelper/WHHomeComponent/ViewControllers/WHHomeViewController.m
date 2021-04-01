//
//  WHHomeViewController.m
//  易书
//
//  Created by 张成敏 on 2021/4/2.
//

#import "WHHomeViewController.h"
#import "WHColorDefine.h"

#import <Masonry/Masonry.h>

@interface WHHomeViewController ()

@property (strong, nonatomic) UIButton *testButton;

@end

@implementation WHHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configLayout];
}

- (void)configLayout {
    [self.view addSubview:self.testButton];
    [self.testButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view);
    }];
}

#pragma mark - Lazy Load

- (UIButton *)testButton {
    if (!_testButton) {
        _testButton = [[UIButton alloc]init];
        [_testButton setTitle:@"TEST" forState:UIControlStateNormal];
        [_testButton.titleLabel setFont:[UIFont boldSystemFontOfSize:20.0]];
        [_testButton setTitleColor: WH_MIAN_THEME_COLOR forState:UIControlStateNormal];
    }
    return _testButton;
}

@end
