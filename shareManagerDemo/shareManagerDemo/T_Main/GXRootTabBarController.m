//
//  GXRootTabBarController.m
//  TestDemo
//
//  Created by T-guo on 2018/3/29.
//  Copyright © 2018年 T_Guo. All rights reserved.
//

#import "GXRootTabBarController.h"
#import "GXBaseNavigationViewController.h"
#import "GXHomeVC.h"

@interface GXRootTabBarController ()

@end

@implementation GXRootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadControllers];
    
}

- (void)loadControllers{
    
    
    UIViewController *refreshVC = [self controllerWithClassName:@"GXHomeVC" title:@"首页" imageName:@"money"];
    
    UIViewController *refreshOneVC = [self controllerWithClassName:@"GXHomeVC" title:@"我的" imageName:@"money"];
    
    UIViewController *webVC = [self controllerWithClassName:@"GXHomeVC" title:@"网页" imageName:@"money"];
    
    UIViewController *SpecialVC = [self controllerWithClassName:@"GXHomeVC" title:@"推荐" imageName:@"money"];


    //把导航控制器添加到tabBarController里,作为子控制器
    self.viewControllers = @[refreshVC,refreshOneVC,webVC,SpecialVC];
    
}


- (UIViewController *)controllerWithStoryboardName:(NSString *)storyboardName title:(NSString *)titlle imageName:(NSString *)imageName{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    
    UIViewController *controller = [storyboard instantiateInitialViewController];
    
    return [self navControllerWithController:controller title:titlle imageName:imageName];
    
}


- (UIViewController *)controllerWithClassName:(NSString *)className title:(NSString *)titlle imageName:(NSString *)imageName
{
    Class clz = NSClassFromString(className);
    
    UIViewController *controller = [[clz alloc]init];
    
    return [self navControllerWithController:controller title:titlle imageName:imageName];
}

- (UINavigationController *)navControllerWithController:(UIViewController *)controller title:(NSString *)title imageName:(NSString *)imageName
{
    //设置tabBarItem上的文字
    controller.tabBarItem.title = title;
    
    //设置tabBarItem上的图片
    controller.tabBarItem.image = [[UIImage imageNamed:imageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //设置tabbar的控件属性
    [controller.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName :[UIColor orangeColor]} forState:UIControlStateSelected];
    
    //设置tabBarItem上被选中的图片
    controller.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_Sel",imageName]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //把首页控制器作为导航控制器的根视图控制器
    GXBaseNavigationViewController *navController = [[GXBaseNavigationViewController alloc]initWithRootViewController:controller];
    
    return navController;
}

@end
