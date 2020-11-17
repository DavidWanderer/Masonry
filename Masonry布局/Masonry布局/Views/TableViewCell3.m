//
//  TableViewCell3.m
//  Masonry布局
//
//  Created by Hu, Yuping on 2020/8/18.
//  Copyright © 2020 Hu, Yuping. All rights reserved.
//

#import "TableViewCell3.h"
#import <Masonry/Masonry.h>

@interface TableViewCell3()
@property (nonatomic, strong) UILabel *lb;
@end

@implementation TableViewCell3

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UILabel *lb = [[UILabel alloc] init];
        lb.numberOfLines = 0;
        lb.font = [UIFont systemFontOfSize:15.0];
        [self.contentView addSubview:lb];
        self.lb = lb;
        [lb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.bottom.equalTo(self.contentView);
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
