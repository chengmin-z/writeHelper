//
//  WHDashBoardSectionViewController.m
//  易书
//
//  Created by 张成敏 on 2021/4/11.
//

#import "WHDashBoardSectionViewController.h"

#import "WHDashBoardCell.h"
#import "WHDashBoardVIewModel.h"

@interface WHDashBoardSectionViewController ()

@property (nonatomic, strong) WHDashBoardVIewModel *viewModel;

@end


@implementation WHDashBoardSectionViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.inset = UIEdgeInsetsMake(0, 0, 20.0, 0);
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
        cellClass = [WHDashBoardCell class];
    }
    WHDashBoardCell *cell = [self.collectionContext dequeueReusableCellOfClass:cellClass forSectionController:self atIndex:index];
    
    [cell setTodayStudyMin:self.viewModel.todayStudyMin];
    [cell setToNextLevel:self.viewModel.toNextLevel];
    [cell setMyLevel:self.viewModel.myLevel];
   
    return cell;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index
{
    const CGFloat width = self.collectionContext.containerSize.width;
    return CGSizeMake(width, 180.0);
}

- (void)didUpdateToObject:(id)object
{
    if ([object isKindOfClass:WHDashBoardVIewModel.class]) {
        self.viewModel = object;
    }
}

@end
