//
//  WHCVTestViewController.m
//  易书
//
//  Created by 张成敏 on 2021/4/2.
//

#import "WHCVTestViewController.h"

#import <Masonry/Masonry.h>

#import "WHColorDefine.h"
#import "WHSquarePreviewView.h"
#import "WHLongItemButton.h"

@interface WHCVTestViewController ()

@property (nonatomic, strong) WHSquarePreviewView *previewView;
@property (nonatomic, strong, readwrite) WHLongItemButton *selectButton;
@property (nonatomic, strong, readwrite) WHLongItemButton *processButton;

@end

@implementation WHCVTestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configUI];
}

- (void)configUI
{
    self.view.backgroundColor = WH_WHITE_COLOR;
    self.navigationItem.title = @"OpenCV 开发测试页面";
    [self setupSubviews];
}

- (void)setupSubviews
{
    [self.view addSubview:self.previewView];
    [self.view addSubview:self.selectButton];
    [self.view addSubview:self.processButton];
    [self layoutSubviews];
}

- (void)layoutSubviews
{
    [self.previewView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(124);
        make.trailing.equalTo(self.view).offset(-30);
        make.leading.equalTo(self.view).offset(30);
        make.height.mas_equalTo(self.previewView.mas_width);
    }];
    
    [self.selectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.previewView.mas_bottom).offset(40);
        make.leading.equalTo(self.previewView);
        make.trailing.equalTo(self.previewView);
        make.height.equalTo(@50);
    }];
    
    [self.processButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.selectButton.mas_bottom).offset(20);
        make.leading.equalTo(self.previewView);
        make.trailing.equalTo(self.previewView);
        make.height.equalTo(@50);
    }];
}

- (void)actionForSelectButton
{
    
}

- (void)actionForProcessButton
{
    
}

#pragma mark - Lazy Load

- (WHSquarePreviewView *)previewView
{
    if (!_previewView) {
        _previewView = [[WHSquarePreviewView alloc]initWithPreviewImage:[UIImage imageNamed:@"PreviewBackGround"]];
    }
    return _previewView;
}


- (UIButton *)selectButton
{
    if (!_selectButton) {
        _selectButton = [[WHLongItemButton alloc]initWithTitle:@"选择照片"];
        [_selectButton addTarget:self action:@selector(actionForSelectButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _selectButton;
}

- (UIButton *)processButton
{
    if (!_processButton) {
        _processButton = [[WHLongItemButton alloc]initWithTitle:@"CV 处理"];
        [_processButton addTarget:self action:@selector(actionForProcessButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _processButton;
}

@end
