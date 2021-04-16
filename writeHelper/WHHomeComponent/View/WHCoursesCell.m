//
//  WHCoursesCell.m
//  易书
//
//  Created by 张成敏 on 2021/4/14.
//

#import "WHCoursesCell.h"

#import "WHColorDefine.h"

#import <Masonry/Masonry.h>

@interface WHCoursesCell ()

@property (nonatomic, strong) XLCardSwitch *cardSwitch;

@property (nonatomic, strong, readwrite) NSMutableArray *models;

@property (nonatomic, strong, readwrite) NSArray<WHCourseModel *> *courseModels;

@property (nonatomic, strong, readwrite) id<XLCardSwitchDelegate> delegate;

@end

@implementation WHCoursesCell

- (instancetype)init
{
    if (self = [super init]) {
        [self addCardSwitch];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addCardSwitch];
        [self configData];
    }
    return self;
}

- (void)setXLDelegate:(id<XLCardSwitchDelegate>)delegate
{
    self.delegate = delegate;
    self.cardSwitch.delegate = self.delegate;
}

- (void)setCourseData:(NSArray<WHCourseModel *> *)courseModels
{
    self.courseModels = courseModels;
    [self configData];
}

- (void)addCardSwitch
{
    self.cardSwitch.pagingEnabled = false;
    [self.contentView addSubview:self.cardSwitch];
}

- (void)configData {
    self.models = [NSMutableArray new];
    for (NSInteger i = 0; i < self.courseModels.count; i++) {
        NSInteger size = self.courseModels.count;
        
        XLCardModel *xlmodel = [[XLCardModel alloc] init];
        WHCourseModel *model = [self.courseModels objectAtIndex:i];
        
        xlmodel.imageName = model.bgImgUrl;
        xlmodel.title = model.courseTitle;
        xlmodel.subTitle = [NSString stringWithFormat:@"%ld/%ld", i+1, size];
        
        [self.models addObject:xlmodel];
    }
    self.cardSwitch.models = self.models;
}

#pragma mark - Lazy Load

- (XLCardSwitch *)cardSwitch
{
    if (!_cardSwitch) {
        _cardSwitch = [[XLCardSwitch alloc] initWithFrame:self.contentView.bounds];
    }
    return _cardSwitch;
}

@end
