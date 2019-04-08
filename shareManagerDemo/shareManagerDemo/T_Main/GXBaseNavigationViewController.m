//
//  XWBaseNavigationViewController.m
//  TestDemo
//
//  Created by T-guo on 2018/3/29.
//  Copyright © 2018年 T_Guo. All rights reserved.
//

#import "GXBaseNavigationViewController.h"

@interface GXBaseNavigationViewController ()

@end

@implementation GXBaseNavigationViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //设置barTintColor
    self.navigationBar.barTintColor = [UIColor orangeColor];
    
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    //禁用view的穿透效果.此时,view的大小是屏幕的高度
    //如果设置了背景图片为空图片,必须要禁用穿透效果,才能看到barTintColor
    
    self.navigationBar.translucent = NO;
    
    //以下两行代码可以隐藏分隔线
    [self.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    
    [self.navigationBar setShadowImage:[[UIImage alloc]init]];
    
}

//设置navigationController所有子控制器的统一状态栏样式
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) {
        
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    //为什么会奔溃在这里
    [super pushViewController:viewController animated:animated];
}

@end
