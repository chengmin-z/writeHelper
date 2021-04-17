//
//  WHCourseSectionViewController.m
//  易书
//
//  Created by 张成敏 on 2021/4/14.
//

#import "WHCourseSectionViewController.h"

#import "WHCoursesViewModel.h"
#import "WHCoursesCell.h"
#import "WHCourseViewController.h"

#import <AFNetworking/AFNetworking.h>
#import <ReactiveObjC/ReactiveObjC.h>

@interface WHCourseSectionViewController ()<XLCardSwitchDelegate>

@property (nonatomic, strong) WHCoursesViewModel *viewModel;

@end

@implementation WHCourseSectionViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.inset = UIEdgeInsetsMake(0, 0, 25.0, 0);
        [self requestForData];
    }
    return self;
}

- (void)requestForData
{
    NSMutableArray<WHCourseModel *> *models = [[NSMutableArray<WHCourseModel *> alloc]init];
    
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [[NSSet alloc] initWithObjects:@"text/html", @"application/json",nil];
    
    @weakify(self);
    [manager GET:@"https://www.bupt.site/easy_write/getCourseInfo" parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        @strongify(self);
        NSDictionary *response = (NSDictionary *)responseObject;
        NSArray *courses = response[@"course"];
        for (NSDictionary *course in courses) {
            WHCourseModel *courseModel = [MTLJSONAdapter modelOfClass:[WHCourseModel class] fromJSONDictionary:course error:nil];
            [models addObject:courseModel];
        }
        WHCoursesViewModel *vm =  [[WHCoursesViewModel alloc]init];
        [vm setCourseModels:models];
        [self didUpdateToObject:vm];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
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
        [self.collectionContext performBatchAnimated:YES updates:^(id<IGListBatchContext>  _Nonnull batchContext) {
            [batchContext reloadSectionController:self];
        } completion:^(BOOL finished) {
            NSLog(@"完成刷新");
        }];
    }
}

#pragma mark - CardSwitchDelegate
- (void)cardSwitchDidClickAtIndex:(NSInteger)index {
    WHCourseModel *currentCourseModel = [self.viewModel.courseModels objectAtIndex:index];
    WHCourseViewController *desVC = [[WHCourseViewController alloc]initWithCourseModel:currentCourseModel];
    desVC.hidesBottomBarWhenPushed = YES;
    [self.viewController.navigationController pushViewController:desVC animated:YES];
}

@end
