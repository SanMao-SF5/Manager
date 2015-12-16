//
//  SchoolViewController.m
//  学生管理系统
//
//  Created by 沈方武 on 15/12/9.
//  Copyright © 2015年 SanMao. All rights reserved.
//

#import "SchoolViewController.h"
#import <POP.h>

#import "DetailViewController.h"

/** POP动画的弹性系数 */
static CGFloat const YYAnimationNumber = 8;
/** POP动画的延迟时间 */
static CGFloat const YYAnimationDelay = 0.25;

@interface SchoolViewController ()

/** 保存所有按钮 */
@property (nonatomic, strong) NSMutableArray *buttons;
/** 保存动画时间 */
@property (nonatomic, strong) NSArray *times;

@end

@implementation SchoolViewController

// 懒加载
- (NSMutableArray *)buttons{

    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置View的背景图片
    UIImageView *bgImageView = [[UIImageView alloc] init];
    bgImageView.image = [UIImage imageNamed:@"3"];
    bgImageView.frame = self.view.bounds;
    [self.view addSubview:bgImageView];
}

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    // 添加按钮
    [self setUpButton];

}

- (void)viewDidDisappear:(BOOL)animated{

    [super viewDidDisappear:animated];
    
    // 将按钮从View中移除
    for (UIButton *btn in self.buttons) {
        [btn removeFromSuperview];
    }
    // 清空按钮数组
    [self.buttons removeAllObjects];
    
}

#pragma mark - 按钮动画时间的数组
- (NSArray *)times{
    
    if (!_times) {
        _times = @[@(YYAnimationDelay * 2),
                   @(YYAnimationDelay * 0),
                   @(YYAnimationDelay * 1),
                   @(YYAnimationDelay * 3)];
    }
    return _times;
}

#pragma mark - 添加按钮
- (void)setUpButton{
    
    // 按钮的数据
    NSArray *titles = @[@"学校概况",@"教学院系",@"行政部门",@"招生就业"];
    
    // 每一行的个数
    NSInteger numOfCol = 2;
    // 计算总行数
    NSInteger totalRows = (titles.count + numOfCol - 1) / numOfCol;
    CGFloat buttonW = ScreenW / numOfCol;
    CGFloat buttonH = buttonW;
    // 按钮开始的y值
    CGFloat startY = (ScreenH - buttonH * totalRows) * 0.5;
    
    // 添加按钮
    for (int i = 0; i < titles.count; i++) {
        UIButton *button = [[UIButton alloc] init];
        // 绑定tag
        button.tag = i;
        
        button.bounds = CGRectMake(0, 0, buttonW, buttonH);
        // 设置按钮背景颜色
        button.backgroundColor = [UIColor orangeColor];
        // 设置按钮圆角
        button.layer.cornerRadius = button.width * 0.5;
        
        [self.buttons addObject:button];
        button.tag = i;
        // 监听按钮点击
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        // 添加按钮到View
        [self.view addSubview:button];
        
        // 设置按钮数据
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        
        // 计算按钮的位置
        button.y -= ScreenH;
        CGFloat buttonX = (i % numOfCol) * buttonW;
        CGFloat buttonY = (i / numOfCol) * buttonH + startY;
        CGFloat buttonFromY = buttonY - ScreenH;
        
        // 做按钮动画
        // 添加标签动画
        POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
        anim.fromValue = [NSValue valueWithCGRect:CGRectMake(buttonX, buttonFromY, buttonW, buttonH)];
        anim.toValue = [NSValue valueWithCGRect:CGRectMake(buttonX, buttonY, buttonW, buttonH)];
        
        // 设置动画的弹性参数
        anim.springBounciness = YYAnimationNumber;
        anim.springSpeed = YYAnimationNumber;
        // 设置动画开始时间
        anim.beginTime = CACurrentMediaTime() + [self.times[i] doubleValue];
        
        [button.layer pop_addAnimation:anim forKey:nil];
    }
}


- (void)buttonClick:(UIButton *)btn{

    switch (btn.tag) {
        case 0:{
            // 跳转概况控制器
            DetailViewController *detailVc = [UIStoryboard storyboardWithName:@"DetailViewController" bundle:nil].instantiateInitialViewController;
            [self presentViewController:detailVc animated:YES completion:nil];
        }
            break;
            
        default:
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.baidu.com/"]];
            break;
    }
}

@end
