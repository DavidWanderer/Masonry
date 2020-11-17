//
//  FourVC.m
//  Masonry布局
//
//  Created by Hu, Yuping on 2020/8/27.
//  Copyright © 2020 Hu, Yuping. All rights reserved.
//

#import "FourVC.h"
#import <Masonry/Masonry.h>

@interface FourVC ()
@property (nonatomic, strong) UIView *safeView;
@end

@implementation FourVC
- (void)loadView {
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor grayColor];
    
    UIView *safeView = [[UIView alloc] init];
    safeView.backgroundColor = [UIColor systemBlueColor];
    [self.view addSubview:safeView];
    self.safeView = safeView;
    [safeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
        make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
    }];
    
    UIButton *backBtn = [[UIButton alloc] init];
    [backBtn setTitle:@"返回" forState:(UIControlStateNormal)];
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:backBtn];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(100);
        make.center.equalTo(self.view);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLayoutSubviews {
    NSLog(@"self.view.bounds=%@", NSStringFromCGRect(self.view.bounds));
    NSLog(@"self.safeView.frame=%@", NSStringFromCGRect(self.safeView.frame));
}

@end
