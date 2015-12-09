//
//  MainTabBarController.m
//  学生管理系统
//
//  Created by 沈方武 on 15/12/9.
//  Copyright © 2015年 SanMao. All rights reserved.
//

#import "MainTabBarController.h"
#import "MainNavViewController.h"
#import "SchoolViewController.h"
#import "BeautiesViewController.h"
#import "StudentViewController.h"
#import "TeacherViewController.h"
#import "LoginViewController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加所有的子控制器
    [self setUpAllControllers];
}

/**
 *  添加所有的子控制器
 */
- (void)setUpAllControllers{

    // 学校简介
    [self setUpNavControllerWithVC:[[SchoolViewController alloc] init] titleName:@"学校简介" imageName:@"我的收藏" seletedImage:@"我的收藏-点击效果"];
    
    // 校园风光
    [self setUpNavControllerWithVC:[[BeautiesViewController alloc] init] titleName:@"校园风光" imageName:@"我的收藏" seletedImage:@"我的收藏-点击效果"];
    
    // 学生信息
//    [self setUpNavControllerWithVC:[[StudentViewController alloc] init] titleName:@"学生信息" imageName:@"关于我们" seletedImage:@"关于我们-点击效果"];
    [self setUpNavControllerWithVC:[[LoginViewController alloc] init] titleName:@"学生信息" imageName:@"关于我们" seletedImage:@"关于我们-点击效果"];
    
    // 教师信息
//    [self setUpNavControllerWithVC:[[TeacherViewController alloc] init] titleName:@"教师信息" imageName:@"关于我们" seletedImage:@"关于我们-点击效果"];
    [self setUpNavControllerWithVC:[[LoginViewController alloc] init] titleName:@"教师信息" imageName:@"关于我们" seletedImage:@"关于我们-点击效果"];
}

/**
 *  将所有的子控制器包装成导航控制器
 *
 *  @param vc       控制器
 *  @param title    控制器的标题
 *  @param norImage 正常图片
 *  @param selImage 选中图片
 */
- (void)setUpNavControllerWithVC:(UIViewController *)vc titleName:(NSString *)title imageName:(NSString *)norImage seletedImage:(NSString *)selImage{

    // 创建导航控制器
    MainNavViewController *navVc = [[MainNavViewController alloc] initWithRootViewController:vc];
    
    // 设置导航控制器为TabBar控制器的子控制器
    [self addChildViewController:navVc];
    
    // 设置导航条的标题
    vc.title = title;
    
    // 设置TabBar的图片
    vc.tabBarItem.image = [UIImage imageNamed:norImage];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selImage];
    
    // 设置各控制器的背景色
    vc.view.backgroundColor = RandomColor;
}

@end
