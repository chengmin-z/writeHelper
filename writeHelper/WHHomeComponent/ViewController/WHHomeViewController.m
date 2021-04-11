//
//  WHHomeViewController.m
//  易书
//
//  Created by 张成敏 on 2021/4/2.
//

#import "WHHomeViewController.h"

#import "WHMoreGuideSectionViewController.h"
#import "WHSearchSectionViewController.h"
#import "WHDashBoardSectionViewController.h"

#import "WHHomeViewModel.h"
#import "WHMoreGuideViewModel.h"
#import "WHSearchViewModel.h"
#import "WHDashBoardVIewModel.h"

#import "WHColorDefine.h"

#import <Masonry/Masonry.h>
#import <IGListKit/IGListKit.h>

@interface WHHomeViewController () <IGListAdapterDataSource, UIScrollViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) WHHomeViewModel *viewModel;
@property (nonatomic, strong) UIView *headView;

@end

@implementation WHHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;
    self.navigationItem.title = @"学习";
    [self setupSubviews];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)setupSubviews
{
    [self.view addSubview:self.headView];
    [self.view addSubview:self.collectionView];
    [self layoutSubviews];
}

- (void)layoutSubviews
{
    
}

#pragma mark - IGListAdapterDataSource

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter
{
    return self.viewModel.viewModels;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object
{
    if ([object isKindOfClass:WHMoreGuideViewModel.class]) {
        return (IGListSectionController *)[[WHMoreGuideSectionViewController alloc]init];
    } else if ([object isKindOfClass:WHSearchViewModel.class]) {
        return (IGListSectionController *)[[WHSearchSectionViewController alloc]init];
    } else if ([object isKindOfClass:WHDashBoardVIewModel.class]) {
        return (IGListSectionController *)[[WHDashBoardSectionViewController alloc]init];
    }
    return (IGListSectionController *)[[WHDashBoardSectionViewController alloc]init];
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter
{
    return nil;
}


#pragma mark - Lazy Load

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        _collectionView =  [[UICollectionView alloc] initWithFrame:self.view.bounds
                                                     collectionViewLayout:[UICollectionViewFlowLayout new]];
        [_collectionView setBackgroundColor:[UIColor clearColor]];
        [_collectionView setAlwaysBounceVertical:NO];
    }
    return _collectionView;
}

- (IGListAdapter *)adapter
{
    if (!_adapter) {
        _adapter = [[IGListAdapter alloc] initWithUpdater:[[IGListAdapterUpdater alloc] init]
                                                   viewController:self];
    }
    return _adapter;
}

- (WHHomeViewModel *)viewModel
{
    if (!_viewModel) {
        _viewModel = [[WHHomeViewModel alloc]init];
    }
    return _viewModel;
}

- (UIView *)headView
{
    if (!_headView) {
        _headView = [[UIView alloc]init];
        [_headView setBackgroundColor:WH_HEAD_PURPLE_COLOR];
        _headView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 160);
        _headView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
        _headView.clipsToBounds = YES;
    }
    return _headView;
}

@end
