//
//  PresentedViewController.m
//  SimpleBubbleTransitionExample
//
//  Created by chuange.lcg on 16/4/15.
//  Copyright © 2016年 lcg. All rights reserved.
//

#import "PresentedViewController.h"
#import "UIViewController+SimpleBubbleTransition.h"


@implementation PresentedViewController

- (IBAction)buttonClicked:(UIButton *)btn {
    [self.parentViewController dismissWithBubbleTransition];
}

@end
