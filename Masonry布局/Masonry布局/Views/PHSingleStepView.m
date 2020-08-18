//
//  PHSingleStepView.m
//  AFNetworking
//
//  Created by Hu, Yuping on 2019/12/18.
//

#import "PHSingleStepView.h"
#import "Masonry.h"
#import "PHDashView.h"
#import "UIColor+PH.h"
#import "NSString+PH.h"

@interface PHSingleStepView()

// 显示选中和未选中的圆圈
@property (nonatomic, strong) UIImageView *imageView;
// 左边的横线
@property (nonatomic, strong) PHDashView *leftLineView;
// 右边的横线
@property (nonatomic, strong) PHDashView *rightLineView;
// 底部的标题
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation PHSingleStepView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        // 16pt(圆圈距离顶部的高度) + 14pt(圆圈高度) + 16pt(标题和圆圈间距) + 18pt(底部标题高度)
        CGFloat topMargin = 16;
        CGFloat imgW = 14;
        CGFloat imgMargToLB = 16;
        CGFloat titleH = 18;
        CGFloat lineH = 1;
        CGFloat lineToImgMarg = 8;
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [imageView setImage:[UIImage imageNamed:@"step_unselected"]];
        [self addSubview:imageView];
        self.imageView = imageView;
        
        PHDashView *leftLineView = [[PHDashView alloc] initWithFrame:CGRectZero];
        leftLineView.dashColor = [UIColor ph_colorWithHexString:@"#436BFF"];
        [self addSubview:leftLineView];
        self.leftLineView = leftLineView;
        
        PHDashView *rightLineView = [[PHDashView alloc] initWithFrame:CGRectZero];
        rightLineView.dashColor = [UIColor ph_colorWithHexString:@"#436BFF"];
        [self addSubview:rightLineView];
        self.rightLineView = rightLineView;
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        titleLabel.font = [UIFont systemFontOfSize:12.0];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [UIColor ph_colorWithHexString:@"#595959"];
        [self addSubview:titleLabel];
        self.titleLabel = titleLabel;
        
        // 添加约束
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.mas_equalTo(imgW);
            make.top.equalTo(self.mas_top).with.offset(topMargin);
            make.centerX.equalTo(self.mas_centerX);
        }];

        [leftLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left);
            make.right.equalTo(imageView.mas_left).with.offset(-lineToImgMarg);
            make.height.mas_equalTo(lineH);
            make.centerY.equalTo(imageView.mas_centerY);
        }];

        [rightLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imageView.mas_right).with.offset(lineToImgMarg);
            make.right.equalTo(self.mas_right);
            make.height.mas_equalTo(lineH);
            make.centerY.equalTo(imageView.mas_centerY);
        }];

        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left);
            make.top.equalTo(imageView.mas_bottom).with.offset(imgMargToLB);
            make.width.equalTo(self.mas_width);
            make.height.mas_equalTo(titleH);
        }];
    }
    return self;
}

- (void)setStepTitle:(NSString *)title {
    if ([NSString ph_isNilOrEmpty:title]) {
        return;
    }
    [self.titleLabel setText:title];
}

- (void)setStepSelected:(BOOL)selected {
    if (selected) {
        [self.imageView setImage:[UIImage imageNamed:@"step_selected"]];
    } else {
        [self.imageView setImage:[UIImage imageNamed:@"step_unselected"]];
    }
}

- (void)setLineHideL:(BOOL)leftHide right:(BOOL)rightHide {
    if (leftHide) {
        self.leftLineView.alpha = 0;
    } else {
        self.leftLineView.alpha = 1;
    }
    
    if (rightHide) {
        self.rightLineView.alpha = 0;
    } else {
        self.rightLineView.alpha = 1;
    }
}

@end
