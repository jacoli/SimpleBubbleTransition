//
//  UIViewController+SimpleBubbleTransition.m
//  SimpleBubbleTransitionExample
//
//  Created by chuange.lcg on 16/4/15.
//  Copyright © 2016年 lcg. All rights reserved.
//

#import "UIViewController+SimpleBubbleTransition.h"
#import <objc/runtime.h>

static int kBubblePresentedVC;
static int kBubbleTransitionMaskView;

@interface UIViewController (SimpleBubbleTransitionPrivate)

@property (nonatomic, strong) UIView *bubbleTransitionMaskView;

@end

@implementation UIViewController (SimpleBubbleTransitionPrivate)

- (UIView *)bubbleTransitionMaskView {
    return objc_getAssociatedObject(self, &kBubbleTransitionMaskView);
}

- (void)setBubbleTransitionMaskView:(UIView *)bubbleTransitionMaskView {
    objc_setAssociatedObject(self, &kBubbleTransitionMaskView, bubbleTransitionMaskView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

@implementation UIViewController (SimpleBubbleTransition)

- (UIViewController *)bubblePresentedViewController {
    return objc_getAssociatedObject(self, &kBubblePresentedVC);
}

- (void)setBubblePresentedViewController:(UIViewController *)bubblePresentedViewController {
    objc_setAssociatedObject(self, &kBubblePresentedVC, bubblePresentedViewController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)presentWithBubbleTransition:(UIViewController *)viewControllerToPresent fromView:(UIView *)view {
    UIView *maskView = [[UIView alloc] initWithFrame:view.frame];
    maskView.layer.cornerRadius = view.bounds.size.width / 2;
    maskView.clipsToBounds = YES;
    maskView.backgroundColor = [UIColor whiteColor];
    maskView.alpha = 1.0;
    [self.view addSubview:maskView];
    self.bubbleTransitionMaskView = maskView;
    
    [self.view addSubview:viewControllerToPresent.view];
    [self addChildViewController:viewControllerToPresent];
    viewControllerToPresent.view.alpha = 0;
    self.bubblePresentedViewController = viewControllerToPresent;
    
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.4 delay:0.2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        if (weakSelf) {
            weakSelf.bubblePresentedViewController.view.alpha = 1;
        }
    } completion:^(BOOL finished) {
        if (weakSelf) {
            weakSelf.bubbleTransitionMaskView.hidden = YES;
        }
    }];
    
    [UIView animateWithDuration:0.6
                          delay:0
         usingSpringWithDamping:1
          initialSpringVelocity:0
                        options:0
                     animations:^{
                         if (weakSelf) {
                             weakSelf.bubbleTransitionMaskView.transform = CGAffineTransformMakeScale(30, 30);
                         }
                     }
                     completion:^(BOOL finished) {
                     }];
}

- (void)dismissWithBubbleTransition {
    if (self.bubblePresentedViewController) {
        
        self.bubbleTransitionMaskView.hidden = NO;
        __weak typeof(self) weakSelf = self;
        [UIView animateWithDuration:0.4
                              delay:0
             usingSpringWithDamping:1
              initialSpringVelocity:0
                            options:0
                         animations:^{
                             if (weakSelf) {
                                 weakSelf.bubblePresentedViewController.view.alpha = 0;
                                 weakSelf.bubbleTransitionMaskView.transform = CGAffineTransformIdentity;
                             }
                         }
                         completion:^(BOOL finished) {
                             if (weakSelf) {
                                 [weakSelf.bubblePresentedViewController.view removeFromSuperview];
                                 [weakSelf.bubblePresentedViewController removeFromParentViewController];
                                 weakSelf.bubblePresentedViewController = nil;
                                 [weakSelf.bubbleTransitionMaskView removeFromSuperview];
                                 weakSelf.bubbleTransitionMaskView = nil;
                             }
                         }];
    }
}

@end
