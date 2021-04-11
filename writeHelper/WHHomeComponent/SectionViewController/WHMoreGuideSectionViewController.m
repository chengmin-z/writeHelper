//
//  WHMoreGuideSectionViewController.m
//  易书
//
//  Created by 张成敏 on 2021/4/2.
//

#import "WHMoreGuideSectionViewController.h"

#import "WHCVTestViewController.h"
#import "WHMoreGuideViewModel.h"
#import "WHMoreGuideCell.h"

@interface WHMoreGuideSectionViewController ()

@property (nonatomic, strong) WHMoreGuideViewModel *viewModel;

@end

@implementation WHMoreGuideSectionViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.inset = UIEdgeInsetsMake(50.0, 0, 10.0, 0);
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
        cellClass = [WHMoreGuideCell class];
    }
    WHMoreGuideCell *cell = [self.collectionContext dequeueReusableCellOfClass:cellClass forSectionController:self atIndex:index];
    [cell setTitle:self.viewModel.title];
    [cell setActionBlock:^{
        WHCVTestViewController *desVC = [[WHCVTestViewController alloc]init];
        desVC.hidesBottomBarWhenPushed = YES;
        [self.viewController.navigationController pushViewController:desVC animated:YES];
    }];
    return cell;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index
{
    const CGFloat width = self.collectionContext.containerSize.width;
    return CGSizeMake(width, 50.0);
}

- (void)didUpdateToObject:(id)object
{
    if ([object isKindOfClass:WHMoreGuideViewModel.class]) {
        self.viewModel = object;
    }
}

@end
