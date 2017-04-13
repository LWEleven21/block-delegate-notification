//
//  SecondDelegateViewController.m
//  PassValue
//
//  Created by 刘志伟 on 2017/3/16.
//  Copyright © 2017年 刘志伟. All rights reserved.
//

#import "SecondDelegateViewController.h"

@interface SecondDelegateViewController ()

@end

@implementation SecondDelegateViewController

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
#pragma mark - 3、实现代理方法需要传的值
    //视图将要消失时通过代理传值
    //首次判断代理是否存在，并且代理能够响应代理方法时，才执行代理方法
    if (self.delegate&&[self.delegate respondsToSelector:@selector(viewController:didpassingValueWithInfo:)]) {
        // 随机生成的颜色
        UIColor *color = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
        [self.delegate viewController:self didpassingValueWithInfo:color];
        [self.delegate viewController:self didpassingValueWithstr:@"我是通过Delegate传过来的值"];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Delegate第二个界面";
    self.view.backgroundColor = [UIColor greenColor];
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
