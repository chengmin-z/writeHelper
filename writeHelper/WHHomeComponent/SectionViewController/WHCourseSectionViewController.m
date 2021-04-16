//
//  WHCourseSectionViewController.m
//  易书
//
//  Created by 张成敏 on 2021/4/14.
//

#import "WHCourseSectionViewController.h"

#import "WHCoursesViewModel.h"

#import "WHCoursesCell.h"

@interface WHCourseSectionViewController ()<XLCardSwitchDelegate>

@property (nonatomic, strong) WHCoursesViewModel *viewModel;

@end

@implementation WHCourseSectionViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.inset = UIEdgeInsetsMake(0, 0, 25.0, 0);
    }
    return self;
}

#pragma mark - IGListSectionController

- (NSInteger)numberOfItems
{
    return 1;
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index
{
    Class cellClass;
    if (index == 0) {
        cellClass = [WHCoursesCell class];
    }
    WHCoursesCell *cell = [self.collectionContext dequeueReusableCellOfClass:cellClass forSectionController:self atIndex:index];
    [cell setXLDelegate:self];
    [cell setCourseData:self.viewModel.courseModels];
    return cell;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index
{
    const CGFloat width = self.collectionContext.containerSize.width;
    return CGSizeMake(width, 300);
}

- (void)didUpdateToObject:(id)object
{
    if ([object isKindOfClass:WHCoursesViewModel.class]) {
        self.viewModel = object;
    }
}

#pragma mark - CardSwitchDelegate
- (void)cardSwitchDidClickAtIndex:(NSInteger)index {
    NSLog(@"点击了：%zd",index);
}

@end
