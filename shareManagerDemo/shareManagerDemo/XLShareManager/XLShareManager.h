//
//  XLShareManager.h
//  51易借
//
//  Created by T-guo on 2019/3/15.
//  Copyright © 2019 Jeremy.L.Wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UShareUI/UShareUI.h>

@interface XLShareManager : NSObject

@property(nonatomic,strong)NSString* shareUrl;
@property(nonatomic,strong)NSString* shareTitle;
@property(nonatomic,strong)NSString* shareDescription;
@property(nonatomic,strong)NSString* shareId;
@property(nonatomic,strong)id thumImage;
- (void)sharedWebPage:(UIViewController *)vc shareId:(NSString *)shareId;
- (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType :(UIViewController *)vc;


@end

