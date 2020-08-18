//
//  PHStepView.m
//  AFNetworking
//
//  Created by Hu, Yuping on 2019/12/18.
//

#import "PHStepView.h"
#import "PHSingleStepView.h"
#import "Masonry.h"
#import "PHBaseDataUtil.h"
#import "PHSafeCollection.h"

@interface PHStepView()

/// 存放所有的步骤视图
@property (nonatomic, strong) NSMutableArray *stepViewArray;

@end

@implementation PHStepView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
    
}

- (instancetype)initWithStepViewWithTotalSteps:(NSUInteger)totalStep selectedIndex:(NSUInteger)selectedIndex titleArray:(NSArray *)titleArray {
    
    // 初始化Step
    PHStepView *stepView = [[PHStepView alloc] initWithFrame:CGRectZero];
    self.stepViewArray = [NSMutableArray array];
    
    if (totalStep <= 1) {
        return stepView;
    }

    if (![PHBaseDataUtil isPHKindOfArray:titleArray] || (totalStep != titleArray.count)) {
        return stepView;
    }
    
    // 添加业务需求的视图
    for (int i=0; i<totalStep; i++) {
        PHSingleStepView *singleStepView = [[PHSingleStepView alloc] init];
        [stepView addSubview:singleStepView];
        [self.stepViewArray addObject:singleStepView];
        [singleStepView setStepTitle:[titleArray ph_objectAtIndex:i]]; // 设置标题
        if (i<selectedIndex) { // 设置选中
            [singleStepView setStepSelected:YES];
        }
        if (i == 0) {
            [singleStepView setLineHideL:YES right:NO];
        }
        if (i == (totalStep - 1)) {
            [singleStepView setLineHideL:NO right:YES];
        }
    }
    
    // 设置约束
    [self.stepViewArray mas_distributeViewsAlongAxis:(MASAxisTypeHorizontal) withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    [self.stepViewArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(stepView.mas_height);
        make.centerY.equalTo(stepView.mas_centerY);
    }];
    
    return stepView;
}

@end
