//
//  XLShareManager.m
//  51易借
//
//  Created by T-guo on 2019/3/15.
//  Copyright © 2019 Jeremy.L.Wang. All rights reserved.
//

#import "XLShareManager.h"

@implementation XLShareManager

#pragma mark
#pragma mark - 分享
- (void)sharedWebPage:(UIViewController *)vc shareId:(NSString *)shareId
{
    NSLog(@"点击了分享");
    
    //显示分享面板
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
        // 根据获取的platformType确定所选平台进行下一步操作
        [self shareWebPageToPlatformType:platformType:vc];
        
    }];
    
}


- (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType :(UIViewController *)vc{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    //创建网页内容对象
        NSString* thumbURL =  @"https://mobile.umeng.com/images/pic/home/social/img-1.png";
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:self.shareTitle descr:self.shareDescription thumImage:thumbURL];
    //设置网页地址
    shareObject.webpageUrl = self.shareUrl;
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:vc completion:^(id data, NSError *error) {
        if (error) {
            
            UMSocialLogInfo(@"************Share fail with error %@*********",error);
            if([error.userInfo[@"message"] isEqualToString:@"Operation is cancel"]) {
                //[XLBaseToastVC showWithMessage:@"取消分享" residenceTime:1 ViewController:nil];
            }
            
        }else{
            if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                UMSocialShareResponse *resp = data;
                //分享结果消息
                UMSocialLogInfo(@"response message is %@",resp.message);
                //第三方原始返回的数据
                UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                //[XWBaseToastVC showWithMessage:@"分享成功" residenceTime:2];
            }else{
                
                UMSocialLogInfo(@"response data is %@",data);
            }
        }
    }];
}

@end
