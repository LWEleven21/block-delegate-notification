//
//  SecondNotificationViewController.m
//  PassValue
//
//  Created by 刘志伟 on 2017/3/16.
//  Copyright © 2017年 刘志伟. All rights reserved.
//

#import "SecondNotificationViewController.h"

@interface SecondNotificationViewController ()

@end

@implementation SecondNotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"通知第二个界面";
    self.view.backgroundColor = [UIColor lightGrayColor];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
#pragma mark - 1、发送通知
    // 随机生成的颜色
    UIColor *color = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"PassValue" object:color];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"PassString" object:@"我是通过通知传过来的值"];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
