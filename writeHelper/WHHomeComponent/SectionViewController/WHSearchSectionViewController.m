//
//  WHSearchSectionViewController.m
//  易书
//
//  Created by 张成敏 on 2021/4/11.
//

#import "WHSearchSectionViewController.h"

#import "WHSearchViewModel.h"
#import "WHSearchCell.h"

@interface WHSearchSectionViewController ()

@property (nonatomic, strong) WHSearchViewModel *viewModel;

@end


@implementation WHSearchSectionViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.inset = UIEdgeInsetsMake(15.0, 0, 10.0, 0);
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
        cellClass = [WHSearchCell class];
    }
    WHSearchCell *cell = [self.collectionContext dequeueReusableCellOfClass:cellClass forSectionController:self atIndex:index];
    [cell setTitle:self.viewModel.title];
    return cell;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index
{
    const CGFloat width = self.collectionContext.containerSize.width;
    return CGSizeMake(width, 34.0);
}

- (void)didUpdateToObject:(id)object
{
    if ([object isKindOfClass:WHSearchViewModel.class]) {
        self.viewModel = object;
    }
}


@end
