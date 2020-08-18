//
//  SecondVC.m
//  Masonry布局
//
//  Created by Hu, Yuping on 2019/12/19.
//  Copyright © 2019 Hu, Yuping. All rights reserved.
//

#import "SecondVC.h"
#import "Masonry.h"

@interface SecondVC ()

/** 灰色的背景视图 */
@property (nonatomic, strong) UIView *bgView;
/** 存放所有的子视图 */
@property (nonatomic, strong) NSMutableArray *viewArray;

@end

@implementation SecondVC

- (void)loadView {
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 1.初始化数组
    NSMutableArray *array = [NSMutableArray array];
    self.viewArray = array;
    
    // 2.添加背景View
    CGFloat bgWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat bgHeight = 300;
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectZero];
    bgView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:bgView];
    // 3.给背景View添加约束
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(bgWidth);
        make.height.mas_equalTo(bgHeight);
        make.left.equalTo(self.view.mas_left);
        make.top.equalTo(self.view.mas_top).with.offset(150);
    }];
    
    // 4.添加子视图到背景View中
    for (int i=0; i<5; i++) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor redColor];
        [bgView addSubview:view];
        [self.viewArray addObject:view];
    }
    
    // 5.给子视图设置约束(等间距)
    [self.viewArray mas_distributeViewsAlongAxis:(MASAxisTypeHorizontal) withFixedSpacing:5 leadSpacing:20 tailSpacing:20];
    [self.viewArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgView.mas_top).with.offset(100);
        make.bottom.equalTo(bgView.mas_bottom).with.offset(-100);
    }];
    
    
    // 添加横向等间距均分的按钮
    UIButton *btn1 = [[UIButton alloc] init];
    [btn1 setTitle:@"横向等间距均分" forState:UIControlStateNormal];
    [self.view addSubview:btn1];
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.top.equalTo(bgView.mas_bottom).with.offset(20);
        make.width.mas_equalTo(bgWidth);
        make.height.mas_equalTo(40);
    }];
    // 添加横向固定大小的按钮
    UIButton *btn2 = [[UIButton alloc] init];
    [btn2 setTitle:@"横向固定大小均分" forState:UIControlStateNormal];
    [self.view addSubview:btn2];
    [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.top.equalTo(btn1.mas_bottom).with.offset(10);
        make.width.mas_equalTo(bgWidth);
        make.height.mas_equalTo(40);
    }];
    // 添加纵向等间距均分的按钮
    UIButton *btn3 = [[UIButton alloc] init];
    [btn3 setTitle:@"纵向等间距均分" forState:UIControlStateNormal];
    [self.view addSubview:btn3];
    [btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.top.equalTo(btn2.mas_bottom).with.offset(10);
        make.width.mas_equalTo(bgWidth);
        make.height.mas_equalTo(40);
    }];
    // 添加纵向固定大小的按钮
    UIButton *btn4 = [[UIButton alloc] init];
    [btn4 setTitle:@"纵向固定大小均分" forState:UIControlStateNormal];
    [self.view addSubview:btn4];
    [btn4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.top.equalTo(btn3.mas_bottom).with.offset(10);
        make.width.mas_equalTo(bgWidth);
        make.height.mas_equalTo(40);
    }];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}





@end
