//
//  PHDashView.m
//  AFNetworking
//
//  Created by Hu, Yuping on 2019/12/19.
//

#import "PHDashView.h"
#import "UIColor+PH.h"

@implementation PHDashView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.dashColor = [UIColor ph_colorWithHexString:@"#436BFF"];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context=UIGraphicsGetCurrentContext();//获取绘图用的图形上下文
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);//填充色设置成
    CGFloat lengths[] = {1,2};
    // 第一个参数是上下文
    // 第二个参数表示在第一次绘制的时候跳过几个点
    // 第三个参数表示虚线如何交替绘制，lengths的值｛10,10｝表示先绘制10个点，再跳过10个点
    // 第四个参数表示lengths数组的长度
    CGContextSetLineDash(context, 1, lengths, 2);
    
    CGContextFillRect(context,self.bounds);//把整个空间用刚设置的颜色填充
    //上面是准备工作，下面开始画线了
    CGContextSetStrokeColorWithColor(context, self.dashColor.CGColor);//设置线的颜色
    CGContextMoveToPoint(context,0,0);//画线的起始点位置
    CGContextAddLineToPoint(context,self.frame.size.width,0);//画第一条线的终点位置
    
    CGContextStrokePath(context);//把线在界面上绘制出来
}

- (void)setDashColor:(UIColor *)dashColor {
    if (!dashColor) {
        return;
    }
    _dashColor = dashColor;
    
    // 重新绘制当前视图
    [self setNeedsLayout];
    [self setNeedsDisplay];
}

@end
