//
//  TableViewCell4.m
//  Masonry布局
//
//  Created by Hu, Yuping on 2020/11/17.
//  Copyright © 2020 Hu, Yuping. All rights reserved.
//

#import "TableViewCell4.h"
#import "Masonry.h"

@interface TableViewCell4()

@property (nonatomic, strong) UIImageView *leftImgV;
@property (nonatomic, strong) UILabel *nameLB;
@property (nonatomic, strong) UILabel *addressLB;

@end

@implementation TableViewCell4
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UIImageView *imageV = [[UIImageView alloc] init];
        [self.contentView addSubview:imageV];
        self.leftImgV = imageV;
        
        UILabel *nameLB = [[UILabel alloc] init];
        nameLB.numberOfLines = 0;
        [self.contentView addSubview:nameLB];
        self.nameLB = nameLB;
        
        UILabel *addressLB = [[UILabel alloc] init];
        addressLB.numberOfLines = 0;
        [self.contentView addSubview:addressLB];
        self.addressLB = addressLB;
        
        // Masonry添加约束的注释
        MASAttachKeys(self.leftImgV, self.nameLB, self.addressLB, self.contentView);
        
        // 添加约束
        [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(15);
            make.width.height.mas_equalTo(40);
            make.centerY.equalTo(self.contentView.mas_centerY);
        }];
        
        [nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imageV.mas_right).with.offset(10);
            make.right.equalTo(self.contentView.mas_right).with.offset(-15);
            make.top.equalTo(self.contentView.mas_top).with.offset(10);
        }];
        
        [addressLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(nameLB.mas_left);
            make.top.equalTo(nameLB.mas_bottom).with.offset(10);
            make.right.equalTo(nameLB.mas_right);
            make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-15);
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

- (void)reloadDataWithModel:(ModelForTableViewCell4 *)model {
    self.leftImgV.image = [UIImage imageNamed:model.imgName];
    self.nameLB.text = model.name;
    self.addressLB.text = model.address;
}

@end
