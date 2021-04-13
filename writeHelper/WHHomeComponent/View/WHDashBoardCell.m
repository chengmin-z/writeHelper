//
//  WHDashBoardCell.m
//  易书
//
//  Created by 张成敏 on 2021/4/11.
//

#import "WHDashBoardCell.h"

#import "WHColorDefine.h"

#import <Masonry/Masonry.h>

@interface WHDashBoardCell ()

@property (nonatomic, strong, readwrite) UIView *bgView;

@property (nonatomic, strong, readwrite) UILabel *todayStudyLabel;

@property (nonatomic, strong, readwrite) UILabel *toNextLevelLabel;

@property (nonatomic, strong, readwrite) UILabel *myLevelLabel;

@property (nonatomic, strong, readwrite) UILabel *mainTitleLabel;

@property (nonatomic, strong, readwrite) NSString *todayMin;

@property (nonatomic, strong, readwrite) NSString *nextLevel;

@property (nonatomic, strong, readwrite) NSString *myLevelString;

@end

@implementation WHDashBoardCell

- (instancetype)init
{
    if (self = [super init]) {
        [self setupSubviews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews
{
    [self.contentView addSubview:self.bgView];
    [self.contentView addSubview:self.mainTitleLabel];
    [self.contentView addSubview:self.todayStudyLabel];
    [self.contentView addSubview:self.toNextLevelLabel];
    [self.contentView addSubview:self.myLevelLabel];
    [self layoutSubviews];
}

- (void)layoutSubviews
{
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.height.equalTo(@100);
        make.leading.equalTo(self.contentView.mas_leading).offset(21);
        make.trailing.equalTo(self.contentView.mas_trailing).offset(-21);
    }];
    
    [self.mainTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView.mas_leading).offset(26);
        make.trailing.equalTo(self.contentView.mas_trailing).offset(-26);
        make.top.equalTo(self.bgView.mas_bottom).offset(20);
        make.bottom.equalTo(self.contentView);
    }];
    
    [self.todayStudyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.bgView).offset(28);
        make.centerY.equalTo(self.bgView);
    }];
    
    [self.toNextLevelLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgView);
        make.centerY.equalTo(self.bgView);
    }];
    
    [self.myLevelLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.bgView).offset(-28);
        make.centerY.equalTo(self.bgView);
    }];
}

- (void)setTodayStudyMin:(NSInteger)min
{
    self.todayMin = [NSString stringWithFormat:@"%ld", (long)min];
    NSAttributedString *attrString = [self __generateCustomStringWithTitle:@"今日学习" content:self.todayMin unit:@"分钟"];
    [self.todayStudyLabel setAttributedText:attrString];
}

- (void)setToNextLevel:(NSInteger)nums
{
    self.nextLevel = [NSString stringWithFormat:@"%ld", (long)nums];
    NSAttributedString *attrString = [self __generateCustomStringWithTitle:@"距离等级提升" content:self.nextLevel unit:@"节课"];
    [self.toNextLevelLabel setAttributedText:attrString];
}

- (void)setMyLevel:(NSString *)level
{
    self.myLevelString = level;
    NSAttributedString *attrString = [self __generateCustomStringWithTitle:@"我的等级" content:self.myLevelString unit:nil];
    [self.myLevelLabel setAttributedText:attrString];
}

#pragma -mark - Utility

- (NSAttributedString *)__generateCustomStringWithTitle: (NSString *)title content:(NSString *)content unit:(nullable NSString *)unit
{
    NSMutableAttributedString * titleAttribute = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n", title]];
    [titleAttribute addAttribute:NSForegroundColorAttributeName
                           value:WH_LIGHT_GRAY_COLOR
                           range:NSMakeRange(0, titleAttribute.string.length)];
    [titleAttribute addAttribute:NSFontAttributeName
                           value:[UIFont boldSystemFontOfSize:15]
                           range:NSMakeRange(0, titleAttribute.string.length)];
    
    NSMutableAttributedString * numAttribute = [[NSMutableAttributedString alloc] initWithString:content];
    [numAttribute addAttribute:NSForegroundColorAttributeName
                          value:WH_BLACK_COLOR
                          range:NSMakeRange(0, numAttribute.string.length)];
    [numAttribute addAttribute:NSFontAttributeName
                          value:[UIFont boldSystemFontOfSize:26]
                          range:NSMakeRange(0, numAttribute.string.length)];
    
    NSMutableAttributedString *totalAttrString = [[NSMutableAttributedString alloc]init];
    
    [totalAttrString appendAttributedString:titleAttribute];
    [totalAttrString appendAttributedString:numAttribute];
    if (unit) {
        NSMutableAttributedString * mainAttribute = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@" %@", unit]];
        [mainAttribute addAttribute:NSForegroundColorAttributeName
                              value:WH_BLACK_COLOR
                              range:NSMakeRange(0, mainAttribute.string.length)];
        [mainAttribute addAttribute:NSFontAttributeName
                              value:[UIFont boldSystemFontOfSize:19]
                              range:NSMakeRange(0, mainAttribute.string.length)];
        [totalAttrString appendAttributedString:mainAttribute];
    }
    
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.paragraphSpacing = 10.0;
    [paragraphStyle setAlignment:NSTextAlignmentCenter];
    [totalAttrString addAttribute:NSParagraphStyleAttributeName
                            value:paragraphStyle
                            range:NSMakeRange(0, totalAttrString.string.length)];
    return totalAttrString;
}

#pragma mark - Lazy Load

- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc]init];
        [_bgView setBackgroundColor:WH_WHITE_COLOR];
        _bgView.layer.cornerRadius = 20;
        _bgView.layer.shadowColor = [UIColor blackColor].CGColor;
        _bgView.layer.shadowOffset = CGSizeMake(0.0f, 3.0f);
        _bgView.layer.shadowOpacity = 0.16f;
        _bgView.layer.shadowRadius = 6;
    }
    return _bgView;
}

- (UILabel *)mainTitleLabel
{
    if (!_mainTitleLabel) {
        _mainTitleLabel = [[UILabel alloc]init];
        [_mainTitleLabel setFont:[UIFont boldSystemFontOfSize:21]];
        [_mainTitleLabel setTextColor:WH_BLACK_COLOR];
        [_mainTitleLabel setText:@"本周学习内容"];
    }
    return _mainTitleLabel;
}

- (UILabel *)todayStudyLabel
{
    if (!_todayStudyLabel) {
        _todayStudyLabel = [[UILabel alloc]init];
        _todayStudyLabel.numberOfLines = 0;
        NSAttributedString *attrString = [self __generateCustomStringWithTitle:@"今日学习" content:@"" unit:@"分钟"];
        [_todayStudyLabel setAttributedText:attrString];
    }
    return _todayStudyLabel;
}

- (UILabel *)toNextLevelLabel
{
    if (!_toNextLevelLabel) {
        _toNextLevelLabel = [[UILabel alloc]init];
        _toNextLevelLabel.numberOfLines = 0;
        NSAttributedString *attrString = [self __generateCustomStringWithTitle:@"距离等级提升" content:@"" unit:@"节课"];
        [_toNextLevelLabel setAttributedText:attrString];
    }
    return _toNextLevelLabel;
}

- (UILabel *)myLevelLabel
{
    if (!_myLevelLabel) {
        _myLevelLabel = [[UILabel alloc]init];
        _myLevelLabel.numberOfLines = 0;
        NSAttributedString *attrString = [self __generateCustomStringWithTitle:@"我的等级" content:@"" unit:nil];
        [_myLevelLabel setAttributedText:attrString];
    }
    return _myLevelLabel;
}

@end
