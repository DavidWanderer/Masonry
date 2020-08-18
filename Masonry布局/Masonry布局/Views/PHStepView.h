//
//  PHStepView.h
//  AFNetworking
//
//  Created by Hu, Yuping on 2019/12/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PHStepView : UIView

- (instancetype) initWithStepViewWithTotalSteps:(NSUInteger)totalStep selectedIndex:(NSUInteger)selectedIndex titleArray:(NSArray *)titleArray;

@end

NS_ASSUME_NONNULL_END
