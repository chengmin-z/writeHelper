//
//  WHCourseViewController.m
//  易书
//
//  Created by 张成敏 on 2021/4/17.
//

#import "WHCourseViewController.h"

#import <Masonry/Masonry.h>

#import <ReactiveObjC/ReactiveObjC.h>
#import <TZImagePickerController/TZImagePickerController.h>
#import <SDWebImage/SDWebImage.h>
#import <SVProgressHUD/SVProgressHUD.h>
#import <AFNetworking/AFNetworking.h>

#import "WHColorDefine.h"
#import "WHSquarePreviewView.h"
#import "WHLongItemButton.h"
#import "WHImageProcess.h"

@interface WHCourseViewController ()

@property (nonatomic, strong, readwrite) WHCourseModel *courseModel;

@property (nonatomic, strong) WHSquarePreviewView *previewView;
@property (nonatomic, strong) WHLongItemButton *selectButton;
@property (nonatomic, strong) WHLongItemButton *compareButton;
@property (nonatomic, strong) WHLongItemButton *processButton;
@property (nonatomic, strong) UIView *evaView;
@property (nonatomic, strong) UILabel *evaLabel;

@property (nonatomic, strong) TZImagePickerController *imagePickerVc;

@property (nonatomic, strong) UIImage *originSelectedImage;
@property (nonatomic, strong) UIImage *selectedImage;
@property (nonatomic, strong) UIImage *standardFontImage;

@property (nonatomic, assign) BOOL hasEva;

@property (nonatomic, assign) BOOL hideStandPreviewWhenSelectedImage;

@end

@implementation WHCourseViewController

- (instancetype)initWithCourseModel:(WHCourseModel *)courseModel
{
    if (self = [super init]) {
        self.courseModel = courseModel;
        self.hideStandPreviewWhenSelectedImage = NO;
        self.hasEva = NO;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configUI];
}

- (void)configUI
{
    self.view.backgroundColor = WH_WHITE_COLOR;
    self.navigationItem.title = self.courseModel.courseTitle;
    [self setupSubviews];
}

- (void)setupSubviews
{
    [self.view addSubview:self.previewView];
    [self.view addSubview:self.selectButton];
    [self.view addSubview:self.processButton];
    [self.view addSubview:self.compareButton];
    [self.view addSubview:self.evaView];
    [self.evaView addSubview:self.evaLabel];
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
        make.trailing.equalTo(self.previewView.mas_centerX).offset(-5);
        make.height.equalTo(@50);
    }];
    
    [self.compareButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.selectButton);
        make.leading.equalTo(self.previewView.mas_centerX).offset(5);
        make.trailing.equalTo(self.previewView);
        make.height.equalTo(@50);
    }];
    
    [self.processButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.compareButton.mas_bottom).offset(20);
        make.leading.equalTo(self.previewView);
        make.trailing.equalTo(self.previewView);
        make.height.equalTo(@50);
    }];
    
    [self.evaView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.processButton.mas_bottom).offset(20);
        make.leading.equalTo(self.previewView);
        make.trailing.equalTo(self.previewView);
        make.height.equalTo(@100);
    }];
    
    [self.evaLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.processButton.mas_bottom).offset(20);
        make.leading.equalTo(self.previewView).offset(15);
        make.trailing.equalTo(self.previewView).offset(-15);
        make.height.equalTo(@100);
    }];
}

- (void)actionForSelectButton
{
    [self.navigationController presentViewController:self.imagePickerVc animated:YES completion:nil];
}

- (void)actionForCompare
{
    self.hideStandPreviewWhenSelectedImage = !self.hideStandPreviewWhenSelectedImage;
    [self.compareButton setTitle:self.hideStandPreviewWhenSelectedImage ? @"显示对比" : @"隐藏对比" ];
    [self.previewView setBackPreviewImageHidden:self.hideStandPreviewWhenSelectedImage];
}

- (void)actionForImageProcess
{
    if (!self.selectedImage) {
        return;
    }
    self.selectedImage = [WHImageProcess imageToGrayImage:self.selectedImage];
    self.selectedImage = [WHImageProcess reduceNoiseImage:self.selectedImage];
    self.selectedImage = [WHImageProcess thresholdImage:self.selectedImage];
    self.originSelectedImage = [self.selectedImage copy];
    self.selectedImage = [WHImageProcess makeTransparent:self.selectedImage];
    [self.previewView setInputPreviewImage:self.selectedImage];
    [self.previewView setBackPreviewImageHidden:self.hideStandPreviewWhenSelectedImage];
    self.hasEva = NO;
}

- (void)actionForGetEva
{
    [SVProgressHUD setForegroundColor:WH_MIAN_THEME_COLOR];
    if (self.originSelectedImage == nil) {
        [SVProgressHUD dismissWithDelay:0.5];
        [SVProgressHUD showWithStatus:@"先选择一张汉字照片吧!"];
        return;
    }
    
    if (self.hasEva) {
        [SVProgressHUD dismissWithDelay:0.5];
        [SVProgressHUD showWithStatus:@"本次书写已有评价"];
        return;
    }
    
    [SVProgressHUD showWithStatus:@"正在进行分析评价"];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain", @"image/jpeg", @"image/png", @"text/plain", @"multipart/form-data", nil];
    
    NSDictionary *dict = @{
        @"char" : self.courseModel.text
    };
     
    @weakify(self);
    [manager POST:@"https://www.bupt.site/easy_write/evaluate" parameters:dict headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        @strongify(self);
        UIImage *resizeImage = [self scaleToSize:self.originSelectedImage size:CGSizeMake(500.0, 500.0)];
        NSData *fileData = UIImageJPEGRepresentation(resizeImage, 1);
        NSString *name = @"file";
        NSString *fileName = [NSString stringWithFormat:@"%@.jpg", name];
        NSString *mimeType = @"image/jpg";
        [formData appendPartWithFileData:fileData name:@"file" fileName:fileName mimeType:mimeType];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        @strongify(self);
        NSLog(@"%@", responseObject);
        NSDictionary *dict = (NSDictionary *)responseObject;
        NSString *evaString = [dict objectForKey:@"info"];
        [self.evaLabel setText:evaString];
        [self.evaView setHidden:NO];
        self.hasEva = YES;
        [SVProgressHUD dismiss];
        [SVProgressHUD dismissWithDelay:0.5];
        [SVProgressHUD showSuccessWithStatus:@"获取成功"];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
        [SVProgressHUD dismiss];
        [SVProgressHUD dismissWithDelay:0.5];
        [SVProgressHUD showErrorWithStatus:@"网络好像开小差了"];
    }];
}


- (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size{
     UIGraphicsBeginImageContext(size);
     [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
     UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
     UIGraphicsEndImageContext();
     return scaledImage;
}

#pragma mark - Lazy Load

- (WHSquarePreviewView *)previewView
{
    if (!_previewView) {
        _previewView = [[WHSquarePreviewView alloc]initWithPreviewImage:self.standardFontImage];
    }
    return _previewView;
}

- (UIView *)evaView
{
    if (!_evaView) {
        _evaView = [[UIView alloc]init];
        _evaView.layer.borderWidth = 2;
        _evaView.layer.borderColor = WH_LIGHT_PURPLE_COLOR.CGColor;
        [_evaView setHidden:YES];
    }
    return _evaView;
}

- (UIImage *)standardFontImage
{
    if (!_standardFontImage) {
        NSURL *url = [NSURL URLWithString: self.courseModel.textImgUrl];
        _standardFontImage = [WHImageProcess makeTransparentImage:[UIImage imageWithData: [NSData dataWithContentsOfURL:url]] AndToR:255 G:110 B:110];
    }
    return _standardFontImage;
}

- (WHLongItemButton *)selectButton
{
    if (!_selectButton) {
        _selectButton = [[WHLongItemButton alloc]initWithTitle:@"选择照片"];
        [_selectButton addTarget:self action:@selector(actionForSelectButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _selectButton;
}

- (WHLongItemButton *)processButton
{
    if (!_processButton) {
        _processButton = [[WHLongItemButton alloc]initWithTitle:@"获得评价"];
        [_processButton addTarget:self action:@selector(actionForGetEva) forControlEvents:UIControlEventTouchUpInside];
    }
    return _processButton;
}

- (WHLongItemButton *)compareButton
{
    if (!_compareButton) {
        _compareButton = [[WHLongItemButton alloc]initWithTitle:@"隐藏对比"];
        [_compareButton addTarget:self action:@selector(actionForCompare) forControlEvents:UIControlEventTouchUpInside];
    }
    return _compareButton;
}

- (UILabel *)evaLabel
{
    if (!_evaLabel) {
        _evaLabel = [[UILabel alloc]init];
        _evaLabel.textColor = WH_MIAN_THEME_COLOR;
        _evaLabel.textAlignment = NSTextAlignmentLeft;
        _evaLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [_evaLabel setFont:[UIFont boldSystemFontOfSize:16]];
        _evaLabel.numberOfLines = 0;
    }
    return _evaLabel;
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
            [self actionForImageProcess];
        }];
    }
    return _imagePickerVc;
}

@end
