//
//  ThirdVC.m
//  Masonry布局
//
//  Created by Hu, Yuping on 2020/8/18.
//  Copyright © 2020 Hu, Yuping. All rights reserved.
//

#import "ThirdVC.h"
#import <Masonry/Masonry.h>
#import "TableViewCell.h"

@interface ThirdVC ()<UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ThirdVC

- (void)loadView {
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
    tableView.dataSource = self;
    tableView.tableFooterView = [[UIView alloc] init];
    tableView.estimatedRowHeight = 30;
    tableView.rowHeight = UITableViewAutomaticDimension;
    [self.view addSubview:tableView];
    
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.width.height.equalTo(self.view);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - tableView数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"outCell";
    TableViewCell *cell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[TableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    return cell;
}

@end
