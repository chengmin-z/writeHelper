//
//  WHCourseSectionViewController.m
//  易书
//
//  Created by 张成敏 on 2021/4/14.
//

#import "WHCourseSectionViewController.h"

#import "WHCoursesViewModel.h"

#import "WHCoursesCell.h"

@interface WHCourseSectionViewController ()

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
    return cell;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index
{
    const CGFloat width = self.collectionContext.containerSize.width;
    return CGSizeMake(width, 268.0);
}

- (void)didUpdateToObject:(id)object
{
    
}

@end
