//
//  YYLoginViewController.m
//  YiYaYi
//
//  Created by 沈方武 on 15/10/16.
//  Copyright © 2015年 YiYaYi. All rights reserved.
//

#import "LoginViewController.h"
#import <SVProgressHUD.h>

@interface LoginViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *account;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;

@property (weak, nonatomic) IBOutlet UIButton *registNowBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *registerViewCon;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginViewRightCon;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginViewleftCon;

@end


@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.password.delegate = self;
    
}

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
    self.loginBtn.layer.cornerRadius = 5;
    self.registerBtn.layer.cornerRadius = 5;
}

// 点击了关闭页面
- (IBAction)closeBtnClick {
    
    // 退出键盘
    [self.view endEditing:YES];
    // 推出控制器
    [self dismissViewControllerAnimated:YES completion:nil];
}

// 监听键盘return键的点击
- (BOOL)textFieldShouldReturn:(UITextField *)textField{

    [self loginBtnClick];
    
    return YES;
}

// 点击登录
- (IBAction)loginBtnClick {
    
    NSLog(@"点击了登录");
    // 退出键盘
    [self.view endEditing:YES];
    
    // 判断账号或者密码是否为空
    if (self.account.text.length == 0 || self.password.text.length == 0) {
        [SVProgressHUD showErrorWithStatus:@"账号或密码不能为空"];
        return;
    }
    
    // 模拟延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [SVProgressHUD showErrorWithStatus:@"服务器忙，请稍后再试！"];
    });
    
}

// 点击了注册
- (IBAction)registerBtnClick {
    
    NSLog(@"点击了注册");
    // 退出键盘
    [self.view endEditing:YES];
    [SVProgressHUD showErrorWithStatus:@"服务器忙，请稍后再试！"];
}

// 立即注册
- (IBAction)registNow {
    
    NSLog(@"立即注册");
    
    self.loginViewleftCon.constant = - ScreenW;
    self.loginViewRightCon.constant = ScreenW;
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
}

// 忘记密码
- (IBAction)forgetPwd {
    
    NSLog(@"忘记密码");
    [SVProgressHUD showErrorWithStatus:@"服务器忙，请稍后再试！"];
}

// 已有账号，前去登录
- (IBAction)goToLogin {
    
    NSLog(@"已有账号，去登录");
    
    self.loginViewRightCon.constant = 0;
    self.loginViewleftCon.constant = 0;
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    // 退出键盘
    [self.view endEditing:YES];
}

@end
