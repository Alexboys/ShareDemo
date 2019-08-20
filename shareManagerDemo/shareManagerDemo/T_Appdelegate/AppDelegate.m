//
//  AppDelegate.m
//  shareManagerDemo
//
//  Created by T-guo on 2019/4/8.
//  Copyright © 2019 T_Guo. All rights reserved.
//

#import "AppDelegate.h"
#import "GXRootTabBarController.h"

//AppKey And Secret
#define UMSocialAppKey @"5c93056961f564975e00031b"

#define UMQQAppKey_Test @"1108321974"
#define UMQQSecret_test @"CYMu0RNtqKFJnVfJ"

#define UMWechatAppKey_Test @"wx3044ad8438b6c1ab"
#define UMWechatSecret_Test @"24adb6e39a583fd7e3e40c09b7f8940e"

#define UMSinaAppKey_Test @"1791124911"
#define UMSinaSecret_Test @"78b5fceff2c9ce839ad115b6e228b23d"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //友盟分享
    [self initUMShared];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    GXRootTabBarController *jumpVC = [[GXRootTabBarController alloc] init];
    self.window.rootViewController = jumpVC;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



#pragma mark
#pragma mark - 友盟分享
- (void)initUMShared
{
    /* 打开调试日志 */
    [[UMSocialManager defaultManager] openLog:YES];

    /* 设置友盟appkey */
    [UMConfigure initWithAppkey:UMSocialAppKey channel:@"App Store"];

    [self configUSharePlatforms];
    [self confitUShareSettings];
}

- (void)confitUShareSettings
{
    /*
     * 打开图片水印
     */
    //[UMSocialGlobal shareInstance].isUsingWaterMark = YES;
    /*
     * 关闭强制验证https，可允许http图片分享，但需要在info.plist设置安全域名
     <key>NSAppTransportSecurity</key>
     <dict>
     <key>NSAllowsArbitraryLoads</key>
     <true/>
     </dict>
     */
    //[UMSocialGlobal shareInstance].isUsingHttpsWhenShareContent = NO;
}

- (void)configUSharePlatforms
{
    //设置微信的appKey和appSecret
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:UMWechatAppKey_Test appSecret:UMWechatSecret_Test redirectURL:@"www.mo-kuai.com"];

    //设置分享到QQ互联的appKey和appSecret
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:UMQQAppKey_Test  appSecret:UMQQSecret_test redirectURL:@"www.baidu.com"];

    //设置新浪的appKey和appSecret
    // 两种方案: 一种手动设置,一种友盟后台进行设置
    //    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:UMSinaAppKey  appSecret:UMSinaSecret redirectURL:@"http://zs.mo-kuai.com/rest/"];

    //移除新浪分享
    [[UMSocialManager defaultManager] removePlatformProviderWithPlatformType:UMSocialPlatformType_Sina];


    //    UMSocialPlatformType_Sina               = 0, //新浪
    //    UMSocialPlatformType_WechatSession      = 1, //微信聊天
    //    UMSocialPlatformType_WechatTimeLine     = 2,//微信朋友圈
    //    UMSocialPlatformType_WechatFavorite     = 3,//微信收藏
    //    UMSocialPlatformType_QQ                 = 4,//QQ聊天页面
    //    UMSocialPlatformType_Qzone              = 5,//qq空间

}

/*----------------------------------支付相关回调---------------------------- */
// 支持所有iOS系统
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
}

/*----------------------------------友盟分享回调----------------------------- */
//仅支持iOS9以上系统，iOS8及以下系统不会回调
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options
{
    //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响
    BOOL result = [[UMSocialManager defaultManager]  handleOpenURL:url options:options];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
}


//支持目前所有iOS系统
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
}

@end
