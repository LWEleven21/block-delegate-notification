//
//  BlockSecondViewController.m
//  PassValue
//
//  Created by 刘志伟 on 2017/3/16.
//  Copyright © 2017年 刘志伟. All rights reserved.
//

#import "BlockSecondViewController.h"

@interface BlockSecondViewController ()

@end

@implementation BlockSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Block第二个界面";
    self.view.backgroundColor = [UIColor brownColor];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // 随机生成的颜色
    UIColor *color = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
    // 第二步 给Block传入参数color
    if (self.colorBlock) {
        self.colorBlock(color);
    }
    if (self.strBlock) {
        self.strBlock(@"我是通过Block传过来的值");
    }
    if (self.doSth) {
        self.doSth();
    }

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
