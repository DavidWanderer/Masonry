//
//  TableViewCell.m
//  Masonry布局
//
//  Created by Hu, Yuping on 2020/8/18.
//  Copyright © 2020 Hu, Yuping. All rights reserved.
//

#import "TableViewCell.h"
#import <Masonry/Masonry.h>
#import "TableViewCell2.h"
#import "TableViewCell3.h"

@interface TableViewCell()<UITableViewDataSource>

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *view;
@property (nonatomic, strong) MASConstraint *tableHeightConstraint;

@end

@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        tableView.dataSource = self;
        tableView.estimatedRowHeight = 100;
        tableView.rowHeight = UITableViewAutomaticDimension;
        [self.contentView addSubview:tableView];
        self.tableView = tableView;
        
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.width.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView.mas_bottom);
            self.tableHeightConstraint = make.height.equalTo(self.contentView.mas_height);
        }];
        
        
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - UITableView数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"inner_cell";
    TableViewCell3 *cell = (TableViewCell3 *)[tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[TableViewCell3 alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    
    NSString *title = @"播放回放时，来电话，挂断电话提交了一次心跳，不应该提交心跳.播放回放时，来电话，挂断电话提交了一次心跳，不应该提交心跳.播放回放时，来电话，挂断电话提交了一次心跳，不应该提交心跳.播放回放时，来电话，挂断电话提交了一次心跳，不应该提交心跳.播放回放时，来电话，挂断电话提交了一次心跳，不应该提交心跳.播放回放时，来电话，挂断电话提交了一次心跳，不应该提交心跳.播放回放时，来电话，挂断电话提交了一次心跳，不应该提交心跳.播放回放时，来电话，挂断电话提交了一次心跳，不应该提交心跳.播放回放时，来电话，挂断电话提交了一次心跳，不应该提交心跳.播放回放时，来电话，挂断电话提交了一次心跳，不应该提交心跳.播放回放时，来电话，挂断电话提交了一次心跳，不应该提交心跳.播放回放时，来电话，挂断电话提交了一次心跳，不应该提交心跳.播放回放时，来电话，挂断电话提交了一次心跳，不应该提交心跳.播放回放时，来电话，挂断电话提交了一次心跳，不应该提交心跳.播放回放时，来电话，挂断电话提交了一次心跳，不应该提交心跳.播放回放时，来电话，挂断电话提交了一次心跳，不应该提交心跳.";
    [cell reloadCellWithStr:title];
    return cell;
}

@end
