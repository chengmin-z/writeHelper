//
//  WHCVTestViewController.m
//  易书
//
//  Created by 张成敏 on 2021/4/2.
//

#import "WHCVTestViewController.h"

#import <Masonry/Masonry.h>

#import <ReactiveObjC/ReactiveObjC.h>
#import <TZImagePickerController/TZImagePickerController.h>

#import "WHColorDefine.h"
#import "WHSquarePreviewView.h"
#import "WHLongItemButton.h"
#import "WHImageProcess.h"

@interface WHCVTestViewController ()

@property (nonatomic, strong) WHSquarePreviewView *previewView;
@property (nonatomic, strong) WHLongItemButton *selectButton;
@property (nonatomic, strong) WHLongItemButton *processButton;
@property (nonatomic, strong) TZImagePickerController *imagePickerVc;
@property (nonatomic, strong) UIImage *selectedImage;

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
    [self.navigationController presentViewController:self.imagePickerVc animated:YES completion:nil];
}

- (void)actionForProcessButton
{
    if (!self.selectedImage) {
        return;
    }
    self.selectedImage = [WHImageProcess imageToGrayImage:self.selectedImage];
    self.selectedImage = [WHImageProcess reduceNoiseImage:self.selectedImage];
    self.selectedImage = [WHImageProcess thresholdImage:self.selectedImage];
    self.selectedImage = [WHImageProcess makeTransparent:self.selectedImage];
    [self.previewView setPreviewImage:self.selectedImage];
}

#pragma mark - Lazy Load

- (WHSquarePreviewView *)previewView
{
    if (!_previewView) {
        _previewView = [[WHSquarePreviewView alloc]initWithPreviewImage:nil];
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

- (TZImagePickerController *)imagePickerVc
{
    if (!_imagePickerVc) {
        _imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:nil];
        
        _imagePickerVc.navigationBar.barTintColor = WH_MIAN_THEME_COLOR;
        [_imagePickerVc.navigationBar setTitleTextAttributes:
         @{NSFontAttributeName:[UIFont boldSystemFontOfSize:18],
        NSForegroundColorAttributeName:WH_WHITE_COLOR}];
        
         _imagePickerVc.oKButtonTitleColorDisabled = [UIColor lightGrayColor];
         _imagePickerVc.oKButtonTitleColorNormal = [UIColor greenColor];
         _imagePickerVc.navigationBar.translucent = NO;
        
        _imagePickerVc.allowTakePicture = YES;
        _imagePickerVc.allowPickingGif = NO;
        _imagePickerVc.allowPickingVideo = NO;
        _imagePickerVc.iconThemeColor = WH_MIAN_THEME_COLOR;
        _imagePickerVc.oKButtonTitleColorNormal = WH_MIAN_THEME_COLOR;
        
        _imagePickerVc.allowCrop = YES;
        NSInteger left = 10;
        NSInteger widthHeight = self.view.bounds.size.width - 2 * left;
        NSInteger top = (self.view.bounds.size.height - widthHeight) / 2;
        _imagePickerVc.cropRect = CGRectMake(left, top, widthHeight, widthHeight);
        _imagePickerVc.scaleAspectFillCrop = YES;
        [_imagePickerVc setCropViewSettingBlock:^(UIView *cropView) {
            cropView.layer.borderColor = WH_MIAN_THEME_COLOR.CGColor;
            cropView.layer.borderWidth = 2.0;
        }];
        
        @weakify(self);
        [_imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
            @strongify(self);
            if (photos.count != 1) {
                return;
            }
            self.selectedImage = [photos objectAtIndex:0];
            [self.previewView setPreviewImage:self.selectedImage];
        }];
    }
    return _imagePickerVc;
}

@end
