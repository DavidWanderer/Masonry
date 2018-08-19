//
//  FirstVC.m
//  Massonry布局
//
//  Created by Kris on 2018/8/16.
//  Copyright © 2018年 Hu, Yuping. All rights reserved.
//

#import "FirstVC.h"
#import "Masonry.h"

@interface FirstVC ()

@property (nonatomic, strong) UILabel *accountTitleLB;
@property (nonatomic, strong) UILabel *accTextLB;
@property (nonatomic, strong) UITextView *leftTV;
@property (nonatomic, strong) UITextView *rightTV;

@end

@implementation FirstVC

- (void)loadView {
    self.title = @"测试1";
    
    CGRect allRect = [[UIScreen mainScreen] bounds];
    
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, allRect.size.width, allRect.size.height)];
    self.view.backgroundColor = [UIColor grayColor];
    
    UIView *accountBgV = nil;
    {
        //添加背景
        UIView *bgView = [[UIView alloc] init];
        bgView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:bgView];
        accountBgV = bgView;
        
        //标题
        UILabel *lb = [[UILabel alloc] init];
        lb.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16.0f];
        lb.textColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0];
        lb.text = @"账号";
        self.accountTitleLB = lb;
        [bgView addSubview:lb];
        
        //内容
        UILabel *contentLB = [[UILabel alloc] init];
        contentLB.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14.0f];
        contentLB.textColor = [UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1.0];
        contentLB.text = @"admin";
        contentLB.textAlignment = NSTextAlignmentRight;
        [bgView addSubview:contentLB];
        self.accTextLB = contentLB;
        
        //横线
        UIView *lineV = [[UIView alloc] init];
        lineV.backgroundColor = [UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
        [bgView addSubview:lineV];
        
        //添加背景约束
        [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view.mas_left);
            make.top.equalTo(self.view.mas_top).with.offset(100);
            make.width.mas_equalTo(allRect.size.width);
            make.height.mas_equalTo(50);
        }];
        
        //添加标题约束
        [lb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(bgView.mas_top);
            make.left.equalTo(bgView.mas_left).with.offset(16);
            make.height.equalTo(bgView.mas_height);
            //make.width.equalTo(contentLB.mas_width);
        }];
        //设置之后数据不足的时候右边将会被拉伸
        [lb setContentHuggingPriority:251 forAxis:UILayoutConstraintAxisHorizontal];
        [lb setContentCompressionResistancePriority:751 forAxis:UILayoutConstraintAxisHorizontal];
        
        //添加内容约束
        [contentLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(bgView.mas_right).with.offset(-16);
            make.height.equalTo(lb.mas_height);
            make.left.equalTo(lb.mas_right).with.offset(20);
            make.top.equalTo(bgView.mas_top);
            //make.width.equalTo(lb.mas_width);
        }];
        
        //底部横线的约束
        [lineV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(bgView.mas_left);
            make.width.equalTo(bgView.mas_width);
            make.height.mas_equalTo(1);
            make.bottom.equalTo(bgView.mas_bottom);
        }];
    }
    
    //添加左右两个UITextView
    UITextView *leftTV = [[UITextView alloc] init];
    [self.view addSubview:leftTV];
    self.leftTV = leftTV;
    
    UITextView *rightTV = [[UITextView alloc] init];
    [self.view addSubview:rightTV];
    self.rightTV = rightTV;
    
    //添加约束
    [leftTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(accountBgV.mas_bottom).with.offset(10);
        make.left.equalTo(self.view.mas_left).with.offset(10);
        make.right.equalTo(rightTV.mas_left).with.offset(-10);
        make.width.equalTo(rightTV);
        make.height.mas_equalTo(60);
    }];
    [rightTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(leftTV.mas_top);
        make.left.equalTo(leftTV.mas_right).with.offset(10);
        make.right.equalTo(self.view.mas_right).with.offset(-10);
        make.width.equalTo(leftTV);
        make.height.mas_equalTo(60);
    }];
    
    UIButton *btn = [[UIButton alloc] init];
    [btn setBackgroundColor:[UIColor whiteColor]];
    [btn setTitle:@"修改" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(modifyAction) forControlEvents:UIControlEventTouchUpInside];
    //约束
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(10);
        make.top.equalTo(leftTV.mas_bottom).with.offset(10);
        make.right.equalTo(self.view.mas_right).with.offset(-10);
        make.height.mas_equalTo(40);
    }];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)modifyAction{
    
    self.accountTitleLB.text = [self.leftTV.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    self.accTextLB.text = [self.rightTV.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
