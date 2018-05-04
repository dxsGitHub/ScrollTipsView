//
//  ScrollTipsView.h
//  滚动字幕
//
//  Created by dxs on 2018/5/4.
//  Copyright © 2018年 dxs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollTipsView : UIScrollView

- (instancetype)initWithFrame:(CGRect)frame tipsWords:(NSString *)tips tipsFont:(UIFont *)font tipsColor:(UIColor *)color backgroundColor:(UIColor*)backColor;

@end
