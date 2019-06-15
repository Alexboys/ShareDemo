//
//  SVGPlayerVC.m
//  shareManagerDemo
//
//  Created by T-guo on 2019/6/15.
//  Copyright © 2019 T_Guo. All rights reserved.
//

#import "SVGPlayerVC.h"

@interface SVGPlayerVC ()<SVGAPlayerDelegate>

@property (nonatomic, strong) UIImageView   *imageIcon;
@property (nonatomic, strong) SVGAPlayer    *player;

@end

@implementation SVGPlayerVC

- (UIImageView *)imageIcon
{
    if (!_imageIcon) {
        _imageIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
        [_imageIcon setBackgroundColor:YELLOWCOLOR];
    }
    return _imageIcon;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.view addSubview:self.imageIcon];
    [_imageIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.height.width.mas_equalTo(XWLayout(200));
    }];
    
    SVGAParser *parser = [[SVGAParser alloc] init];
    SVGAPlayer *player = [[SVGAPlayer alloc] init];

    player.delegate = self;
    player.loops = 0;
    //player.clearsAfterStop = YES;
    [_imageIcon addSubview:player];

    [player mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.imageIcon);
        make.height.width.mas_equalTo(XWLayout(80));
    }];
    
    [parser parseWithNamed:@"heartbeat" inBundle:[NSBundle mainBundle] completionBlock:^(SVGAVideoEntity * _Nonnull videoItem) {

        if (videoItem != nil) {
            player.videoItem = videoItem;
            [player startAnimation];
        }
        
    } failureBlock:^(NSError * _Nonnull error) {

    }];
    
}


@end
