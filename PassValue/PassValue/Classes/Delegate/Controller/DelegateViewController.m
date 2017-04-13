//
//  SecondViewController.m
//  BaseForProject
//
//  Created by 刘志伟 on 2017/3/16.
//  Copyright © 2017年 刘志伟. All rights reserved.
//

#import "DelegateViewController.h"
#import "SecondDelegateViewController.h"

@interface DelegateViewController ()<Delegate>

//跳转按钮
@property (nonatomic, strong)UIButton * nextButton;
//显示label
@property (nonatomic, strong)UILabel * showLabel;


@end

@implementation DelegateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"代理传值";
    [self setUpUI];

}
#pragma mark - 布局
- (void)setUpUI {
    
    self.showLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 150, 230, 20)];
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
    SecondDelegateViewController * secondVC = [[SecondDelegateViewController alloc]init];
#pragma mark - 5、设置代理
    secondVC.delegate = self;
    [self.navigationController pushViewController:secondVC animated:YES];
}
#pragma mark - 6、实现代理方法
//代理方法
-(void)viewController:(SecondDelegateViewController *)viewController didpassingValueWithInfo:(id)info {
    self.view.backgroundColor = info;

}
- (void)viewController:(SecondDelegateViewController *)viewController didpassingValueWithstr:(id)str {
    self.showLabel.text = str;
    self.showLabel.textAlignment = NSTextAlignmentCenter;
    self.showLabel.textColor = [UIColor whiteColor];
    [self.nextButton setTitle:@"点击跳转" forState:UIControlStateNormal];
    [self.nextButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];

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
