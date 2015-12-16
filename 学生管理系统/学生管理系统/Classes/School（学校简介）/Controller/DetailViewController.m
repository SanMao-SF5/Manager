//
//  DetailViewController.m
//  学生管理系统
//
//  Created by 沈方武 on 15/12/16.
//  Copyright © 2015年 SanMao. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 取消自动缩进
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com/"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.webView loadRequest:request];
}

// 退出当前控制器
- (IBAction)closeBtnClick:(UIBarButtonItem *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}


@end
