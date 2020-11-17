//
//  TableViewCell2.m
//  Masonry布局
//
//  Created by Hu, Yuping on 2020/8/18.
//  Copyright © 2020 Hu, Yuping. All rights reserved.
//

#import "TableViewCell2.h"
#import <Masonry/Masonry.h>

@interface TableViewCell2()

@property (nonatomic, strong) UILabel *lb;
@property (nonatomic, strong) UILabel *lbRead;
@property (nonatomic, strong) UIView *lineV;

@end

@implementation TableViewCell2

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UILabel *lb = [[UILabel alloc] init];
        lb.font = [UIFont systemFontOfSize:15.0];
        lb.numberOfLines = 0;
        [self addSubview:lb];
        self.lb = lb;
        [lb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.width.equalTo(self);
        }];
        
        UILabel *lbRead = [[UILabel alloc] init];
        lbRead.text = @"未读";
        lbRead.textColor = [UIColor redColor];
        lbRead.font = [UIFont systemFontOfSize:13.0];
        [self addSubview:lbRead];
        self.lbRead = lb;
        [lbRead mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right);
            make.top.equalTo(lb.mas_bottom);
            make.width.mas_equalTo(80);
            make.height.mas_equalTo(20);
        }];
        
        UIView *lineV = [[UIView alloc] init];
        lineV.backgroundColor = [UIColor grayColor];
        [self addSubview:lineV];
        self.lineV = lineV;
        [lineV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left);
            make.bottom.equalTo(self.mas_bottom);
            make.top.equalTo(lbRead.mas_bottom);
            make.width.equalTo(self.mas_width);
            make.height.mas_equalTo(0.5);
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

- (void)reloadCellWithStr:(NSString *)text {
    self.lb.text = text;
}

@end
