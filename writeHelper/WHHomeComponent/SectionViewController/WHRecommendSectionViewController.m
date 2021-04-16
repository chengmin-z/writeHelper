//
//  WHRecommendSectionViewController.m
//  易书
//
//  Created by 张成敏 on 2021/4/14.
//

#import "WHRecommendSectionViewController.h"

#import "WHRecommendViewModel.h"
#import "WHRecommendCell.h"

@interface WHRecommendSectionViewController ()

@property (nonatomic, strong) WHRecommendViewModel *viewModel;

@end

@implementation WHRecommendSectionViewController

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
        cellClass = [WHRecommendCell class];
    }
    WHRecommendCell *cell = [self.collectionContext dequeueReusableCellOfClass:cellClass forSectionController:self atIndex:index];
    [cell setBackImgUrl:self.viewModel.backImgUrl];
    [cell setTitle:self.viewModel.title];
   
    return cell;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index
{
    const CGFloat width = self.collectionContext.containerSize.width;
    return CGSizeMake(width, 96.0);
}

- (void)didUpdateToObject:(id)object
{
    if ([object isKindOfClass:WHRecommendViewModel.class]) {
        self.viewModel = object;
    }
}

@end
