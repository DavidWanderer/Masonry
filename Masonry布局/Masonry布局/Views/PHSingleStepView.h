//
//  PHSingleStepView.h
//  AFNetworking
//
//  Created by Hu, Yuping on 2019/12/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PHSingleStepView : UIView

/// 设置当前步骤的标题
/// @param title 标题内容
- (void) setStepTitle:(NSString *)title;

/// 设置当前步骤是否选中，选中传YES，不选中传NO
/// @param selected 是否选中的参数
- (void) setStepSelected:(BOOL)selected;

/// 设置左右横线是否隐藏，默认左右都显示
/// @param leftHide 隐藏传YES，显示传NO
/// @param rightHide 隐藏传YES，显示传NO
- (void) setLineHideL:(BOOL)leftHide right:(BOOL)rightHide;

@end

NS_ASSUME_NONNULL_END
