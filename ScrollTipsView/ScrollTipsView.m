//
//  ScrollTipsView.m
//  滚动字幕
//
//  Created by dxs on 2018/5/4.
//  Copyright © 2018年 dxs. All rights reserved.
//

#import "ScrollTipsView.h"

@interface ScrollTipsView()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UILabel *tipsLab;

@end

@implementation ScrollTipsView

- (instancetype)initWithFrame:(CGRect)frame tipsWords:(NSString *)tips tipsFont:(UIFont *)font tipsColor:(UIColor *)color backgroundColor:(UIColor*)backColor {
    if ([super initWithFrame:frame]) {
        CGSize size = [tips sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName,nil]];
        self.contentSize = size;
        self.contentOffset = CGPointMake(0, 0);
        [self addTipsLabWithText:tips wordSize:size tipsLabFont:font textColor:color];
        self.backgroundColor = backColor;
        [self startTimer];
    }
    return self;
}

- (NSTimer *)timer {
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:.1f target:self selector:@selector(autoScroll) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
    
    return _timer;
}

- (UILabel *)tipsLab {
    if (!_tipsLab) {
        _tipsLab = [[UILabel alloc] initWithFrame:CGRectZero];
        _tipsLab.numberOfLines = 1;
    }
    return _tipsLab;
}

- (void)startTimer {
    [self.timer fire];
}


- (void)addTipsLabWithText:(NSString *)text wordSize:(CGSize)size tipsLabFont:(UIFont *)font textColor:(UIColor *)color {
    [self.tipsLab setFrame:CGRectMake(0, 0, size.width, CGRectGetHeight(self.frame))];
    _tipsLab.text = text;
    _tipsLab.font = font;
    _tipsLab.textColor = color;
    [self addSubview:_tipsLab];
}


- (void)autoScroll {
    CGFloat offSet = 10;
    
    if (self.contentOffset.x > self.contentSize.width + offSet / 2) {
        self.contentOffset = CGPointMake(0, 0);
        _tipsLab.hidden = true;
        self.contentOffset = CGPointMake(-self.frame.size.width, 0);
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            _tipsLab.hidden = false;
        });
    }
    
    [UIView animateWithDuration:.5f animations:^{
        self.contentOffset = CGPointMake(self.contentOffset.x+offSet, self.contentOffset.y);
    } completion:nil];
}

@end
