//
//  UIViewController+SimpleBubbleTransition.h
//  SimpleBubbleTransitionExample
//
//  Created by chuange.lcg on 16/4/15.
//  Copyright © 2016年 lcg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (SimpleBubbleTransition)

@property (nonatomic, strong) UIViewController *bubblePresentedViewController;

- (void)presentWithBubbleTransition:(UIViewController *)viewControllerToPresent fromView:(UIView *)view;

- (void)dismissWithBubbleTransition;

@end
