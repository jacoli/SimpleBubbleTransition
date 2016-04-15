//
//  ViewController.m
//  SimpleBubbleTransitionExample
//
//  Created by chuange.lcg on 16/4/15.
//  Copyright © 2016年 lcg. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+SimpleBubbleTransition.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonClicked:(UIButton *)btn {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"PresentedVC"];
    vc.view.backgroundColor = [UIColor purpleColor];
    
    [self presentWithBubbleTransition:vc fromView:btn];
}


@end
