//
//  SecondDelegateViewController.h
//  PassValue
//
//  Created by 刘志伟 on 2017/3/16.
//  Copyright © 2017年 刘志伟. All rights reserved.
//

#import "LeftSlideBackViewController.h"
#pragma mark - 1、声明代理及代理方法
@class SecondDelegateViewController;
@protocol Delegate <NSObject>

@optional
- (void)viewController:(SecondDelegateViewController *)viewController didpassingValueWithInfo:(id)info;

- (void)viewController:(SecondDelegateViewController *)viewController didpassingValueWithstr:(id)str;
@end
@interface SecondDelegateViewController : LeftSlideBackViewController
#pragma mark - 2、创建代理对象
@property (nonatomic, strong)id <Delegate> delegate;//通过代理对象传值


@end
