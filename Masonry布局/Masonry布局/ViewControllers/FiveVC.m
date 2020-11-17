//
//  FiveVC.m
//  Masonry布局
//
//  Created by Hu, Yuping on 2020/11/17.
//  Copyright © 2020 Hu, Yuping. All rights reserved.
//

#import "FiveVC.h"
#import "Masonry.h"
#import "TableViewCell4.h"
#import "ModelForTableViewCell4.h"

@interface FiveVC ()<UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation FiveVC

- (void)loadView {
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
    tableView.dataSource = self;
    tableView.estimatedRowHeight = 50;
    tableView.rowHeight = UITableViewAutomaticDimension;
    [self.view addSubview:tableView];
    
    // 添加当前tableView的约束
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.width.height.equalTo(self.view);
    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.dataSource = @[].mutableCopy;
    
    ModelForTableViewCell4 *model = [[ModelForTableViewCell4 alloc] initWithImg:@"orange" name:@"cell1_name_cell1_name_cell1_name_cell1_name_cell1_name_cell1_name_cell1_name_cell1_name_cell1_name_cell1_name_cell1_name_cell1_name_cell1_name_cell1_name_cell1_name_cell1_name_cell1_name" address:@"cell1_address_cell1_address_cell1_address_cell1_address_cell1_address_cell1_address_cell1_address_cell1_address_cell1_address_cell1_address_cell1_address_cell1_address_cell1_address_cell1_address_cell1_address_cell1_address_cell1_address_cell1_address_cell1_address_cell1_address_cell1_address_cell1_address"];
    [self.dataSource addObject:model];
    
    ModelForTableViewCell4 *model2 = [[ModelForTableViewCell4 alloc] initWithImg:@"orange" name:@"cell2_name_cell2_name_cell2_name_cell2_name_cell2_name_cell2_name_cell2_name_cell2_name_cell2_name_cell2_name_cell2_name_cell2_name_cell2_name_cell2_name_cell2_name_cell2_name_cell2_name_cell2_name" address:@"cell2_address_cell2_address_cell2_address_cell2_address_cell2_address_cell2_address_cell2_address_cell2_address_cell2_address_cell2_address_cell2_address_cell2_address_cell2_address_cell2_address_cell2_address_cell2_address_cell2_address"];
    [self.dataSource addObject:model2];
    
    ModelForTableViewCell4 *model3 = [[ModelForTableViewCell4 alloc] initWithImg:@"orange" name:@"cell3_name_cell3_name_cell3_name_cell3_name_cell3_name_cell3_name_cell3_name_cell3_name_cell3_name_cell3_name_cell3_name_cell3_name_cell3_name_cell3_name_cell3_name_cell3_name_cell3_name_cell3_name_cell3_name_cell3_name_cell3_name_cell3_name_cell3_name_cell3_name_cell3_name_cell3_name" address:@"cell3_address_cell3_address_cell3_address_cell3_address_cell3_address_cell3_address_cell3_address_cell3_address_cell3_address_cell3_address_cell3_address_cell3_address_cell3_address_cell3_address_cell3_address_cell3_address_cell3_address_cell3_address_cell3_address_cell3_address_cell3_address"];
    [self.dataSource addObject:model3];
    
    [self.tableView reloadData];
}

#pragma mark - 当前的tableView的数据源代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * identifer = @"cell_id";
    TableViewCell4 *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (!cell) {
        cell = [[TableViewCell4 alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifer];
    }
    
    ModelForTableViewCell4 *model = [self.dataSource objectAtIndex:indexPath.row];
    [cell reloadDataWithModel:model];
    
    return cell;
}

@end
