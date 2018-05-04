//
//  ViewController.m
//  ScrollTipsView
//
//  Created by dxs on 2018/5/4.
//  Copyright © 2018年 dxs. All rights reserved.
//

#import "ViewController.h"
#import "ScrollTipsView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ScrollTipsView *scrollLab = [[ScrollTipsView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 80) tipsWords:@"滚动字幕，类似于游戏上的通知。。。第一次发布，后续会提供播放速度参数的增加。。。" tipsFont:[UIFont systemFontOfSize:18] tipsColor:[UIColor redColor] backgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:scrollLab];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
