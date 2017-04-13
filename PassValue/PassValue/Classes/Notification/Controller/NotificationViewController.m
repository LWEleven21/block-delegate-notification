//
//  ThirdViewController.m
//  BaseForProject
//
//  Created by 刘志伟 on 2017/3/16.
//  Copyright © 2017年 刘志伟. All rights reserved.
//

#import "NotificationViewController.h"
#import "SecondNotificationViewController.h"

@interface NotificationViewController ()
//跳转按钮
@property (nonatomic, strong)UIButton * nextButton;
//显示label
@property (nonatomic, strong)UILabel * showLabel;
@end

@implementation NotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"通知传值";
    [self setUpUI];

}
#pragma mark - 布局
- (void)setUpUI {
    
    self.showLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 150, 200, 20)];
    _showLabel.text = @"我是一个展示label";
    [self.view addSubview:_showLabel];
    
    self.nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _nextButton.frame = CGRectMake(100, 220, 80, 50);
    _nextButton.backgroundColor = [UIColor brownColor];
    [_nextButton setTitle:@"跳转" forState:UIControlStateNormal];
    [_nextButton addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_nextButton];
}
#pragma mark -  button响应方法
- (void)nextAction:(UIButton *)sender {
    SecondNotificationViewController * secondVC = [[SecondNotificationViewController alloc]init];

    [self.navigationController pushViewController:secondVC animated:YES];
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
#pragma mark - 2、接收通知，并且实现方法 接收通知的名字要和发送通知的名字相同，否则接收不到
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(receivePost:) name:@"PassValue" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(receivePostString:) name:@"PassString" object:nil];

}
#pragma mark - 3、实现方法

- (void)receivePost:(NSNotification *)noti{
    self.view.backgroundColor = [noti object];
}
- (void)receivePostString:(NSNotification *)noti{
    self.showLabel.text = [noti object];
    self.showLabel.textAlignment = NSTextAlignmentCenter;
    self.showLabel.textColor = [UIColor whiteColor];
    [self.nextButton setTitle:@"点击跳转" forState:UIControlStateNormal];
    [self.nextButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];}
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
