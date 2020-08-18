//
//  ViewController.m
//  Massonry布局
//
//  Created by Kris on 2018/8/16.
//  Copyright © 2018年 Hu, Yuping. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "FirstVC.h"
#import "SecondVC.h"
#import "ThirdVC.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataSource; //数据源

@end

@implementation ViewController

- (void)loadView {
    
    CGRect allRect = [[UIScreen mainScreen] bounds];
    
    self.title = @"Massonry实例";
    
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, allRect.size.width, allRect.size.height)];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    
    __weak ViewController *weakSelf = self;
    //添加TableView的约束
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left);
        make.top.equalTo(weakSelf.view.mas_top);
        make.width.mas_equalTo(allRect.size.width);
        make.height.mas_equalTo(allRect.size.height);
    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.dataSource = [NSMutableArray arrayWithObjects:@"横向摆放2个Label", @"横向等间距均分多个视图", @"TableViewCell嵌套TableView", nil];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark-tableView代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifer = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    
    NSString *title = [self.dataSource objectAtIndex:indexPath.row];
    cell.textLabel.text = title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        FirstVC *firstVC = [[FirstVC alloc] init];
        [self.navigationController pushViewController:firstVC animated:YES];
    } else if (indexPath.row == 1) {
        SecondVC *secondVC = [[SecondVC alloc] init];
        [self.navigationController pushViewController:secondVC animated:YES];
    } else if (indexPath.row == 2){
        ThirdVC *thirdVC = [[ThirdVC alloc] init];
        [self.navigationController pushViewController:thirdVC animated:YES];
    }
}



@end
