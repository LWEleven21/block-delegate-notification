//
//  RootViewController.m
//  BaseForProject
//
//  Created by 刘志伟 on 2017/3/16.
//  Copyright © 2017年 刘志伟. All rights reserved.
//

#import "RootViewController.h"
#import "NavigationViewController.h"

#import "BlockViewController.h"
#import "DelegateViewController.h"
#import "NotificationViewController.h"
#import "FourthViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"dibubeijing"]];
    
    [UITabBar appearance].translucent = NO;
    
    self.tabBarController.tabBar.tintColor = [UIColor greenColor];
    

    [self setUpController];
    [self setNavigationBackItem];
}

#pragma mark - 设置底部视图
-(void)setUpController
{
    // 第一个页面 一般为首页
    BlockViewController *VC1 = [[BlockViewController alloc] init];
    NavigationViewController * NC1 = [[NavigationViewController alloc]initWithRootViewController:VC1];
    NC1.tabBarItem.title = @"Block";
    NC1.tabBarItem.tag = 0;
    NC1.tabBarItem.image = [UIImage imageNamed:@"shouyeweidianji"];
    NC1.tabBarItem.selectedImage = [UIImage imageNamed:@"shouyedianji"];
    NC1.tabBarController.tabBar.tintColor = [UIColor whiteColor];
    
    
    [self addChildViewController:NC1];
    
    //第二个界面
    DelegateViewController *VC2 = [[DelegateViewController alloc] init];
    
    NavigationViewController *NC2 = [[NavigationViewController alloc]initWithRootViewController:VC2];
    NC2.tabBarItem.title = @"代理";
    NC2.tabBarItem.image = [UIImage imageNamed:@"weizhiweidianji"];
    NC2.tabBarItem.selectedImage = [UIImage imageNamed:@"weizhidianji"];
    NC2.tabBarController.tabBar.tintColor = [UIColor whiteColor];
    
    [self addChildViewController:NC2];
    NC2.tabBarItem.tag = 1;
    
    
    // 第三个界面
    NotificationViewController *VC3 = [[NotificationViewController alloc] init];
    NavigationViewController *NC3 = [[NavigationViewController alloc]initWithRootViewController:VC3];
    NC3.tabBarItem.title = @"通知";
    NC3.tabBarItem.image = [UIImage imageNamed:@"zixunweidianji"];
    NC3.tabBarItem.selectedImage = [UIImage imageNamed:@"zixundianji"];
    NC3.tabBarController.tabBar.tintColor = [UIColor whiteColor];
    
    [self addChildViewController:NC3];
    NC3.tabBarItem.tag = 2;
    
    
//    // 第四个界面
//    FourthViewController *VC4 = [[FourthViewController alloc] init];
//    NavigationViewController *NC4 = [[NavigationViewController alloc]initWithRootViewController:VC4];
//    NC4.tabBarItem.title = @"第四";
//    NC4.tabBarItem.image = [UIImage imageNamed:@"gerenweidianji"];
//    NC4.tabBarItem.selectedImage = [UIImage imageNamed:@"gerendianji"];
//    NC4.tabBarController.tabBar.tintColor = [UIColor whiteColor];
//    
//    [self addChildViewController:NC4];
//    NC4.tabBarItem.tag = 3;
    
    
    // 设置程序打开时显示 homeVC
    self.selectedIndex = 0;
}

/**
这里的返回按钮一般是要设置成空的
 */
#pragma mark - 返回按钮
-(void)setNavigationBackItem{
    UIButton *leftbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftbtn.frame = CGRectMake(5, 10, 9, 16);
    [leftbtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:leftbtn];
    self.navigationItem.leftBarButtonItem = back;
    
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
