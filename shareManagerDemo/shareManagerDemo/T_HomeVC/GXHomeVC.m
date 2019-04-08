//
//  GXHomeVC.m
//  shareManagerDemo
//
//  Created by T-guo on 2019/4/8.
//  Copyright © 2019 T_Guo. All rights reserved.
//

#import "GXHomeVC.h"
#import "XLShareManager.h"

@interface GXHomeVC ()

@property (nonatomic, strong) UIButton      *shareButton;

@end

@implementation GXHomeVC


-(UIButton *)shareButton
{
    if (!_shareButton) {
        _shareButton = [[UIButton alloc]init];
        [_shareButton setBackgroundColor:ORANGECOLOR];
        [_shareButton setTitle:@"分享" forState:UIControlStateNormal];
        [_shareButton.titleLabel setFont:UIFontSize(XWLayout(36))];
        [_shareButton addTarget:self action:@selector(shareButtonAction) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _shareButton;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:WHITECOLOR];
    self.navigationItem.title = @"ShareDemao";
    [self creatUI];
}

#pragma mark
#pragma mark - 初始化界面
- (void)creatUI{
    
    [self.view addSubview:self.shareButton];
    
    [_shareButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.height.mas_equalTo(XWLayout(88));
        make.width.mas_equalTo(XWLayout(300));
    }];
}

- (void)shareButtonAction
{
    XLShareManager *shareManager = [[XLShareManager alloc]init];
    shareManager.shareUrl = @"http://www.baidu.com";
    shareManager.shareTitle = @"最好的礼物从这里开始";
    shareManager.shareDescription = @"我知道您此刻钱包很紧，但是，别怕，有我在！ --by小乐钱包";
    shareManager.thumImage = @"AppIcon";//@"https://img.alicdn.com/tfs/TB1nl3daYGYBuNjy0FoXXciBFXa-228-80.jpg";
    [shareManager sharedWebPage:self shareId:nil];
}


@end
