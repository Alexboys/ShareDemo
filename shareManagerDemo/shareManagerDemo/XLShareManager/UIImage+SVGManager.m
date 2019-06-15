//
//  UIImage+SVGManager.m
//  shareManagerDemo
//
//  Created by T-guo on 2019/6/15.
//  Copyright © 2019 T_Guo. All rights reserved.
//

#import "UIImage+SVGManager.h"

@implementation UIImage (SVGManager)

+ (UIImage *)svgImageNamed:(NSString *)name size:(CGSize)size
{
    SVGKImage *svgImage = [SVGKImage imageNamed:name];
    svgImage.size = size;
    return svgImage.UIImage;
}

@end
