//
//  HomeViewController.m
//  BaseForProject
//
//  Created by 刘志伟 on 2017/3/16.
//  Copyright © 2017年 刘志伟. All rights reserved.
//

#import "BlockViewController.h"
#import "BlockSecondViewController.h"

@interface BlockViewController ()

//跳转按钮
@property (nonatomic, strong)UIButton * nextButton;
//显示label
@property (nonatomic, strong)UILabel * showLabel;


@end

@implementation BlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"Block传值";
    [self setUpUI];
    
    // 定义无返回值、无参数的Block
    void(^nothingBlcok)() = ^(){
        
        NSLog(@"这是一个无参，无返回值的block");
    };
    nothingBlcok();
    
    //定义无返回值，有参数的block
    
    void(^twoBlock)(NSString *) = ^(NSString * str){
        
        NSLog(@"%@",str);
    };
    twoBlock(@"这是一个有参数无返回值的block");
    // 3.定义返回值为OC对象的Block
    NSString * (^threeBlock)(NSString *) = ^(NSString * str){
        NSString * string = [NSString stringWithFormat:@"%@+++%@",str,str];
        return string;
        
    };
    NSLog(@"%@",threeBlock(@"返回值为NSString的block"));
    
    
    
    int (^myBlock)(int,int) = ^(int num1,int num2){
        return num1 + num2;
    };
    
    NSLog(@"多参有返回值的block %d",myBlock(20,10));
   
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
    BlockSecondViewController * secondVC = [[BlockSecondViewController alloc]init];
    //第三步实现block的回调
    secondVC.colorBlock = ^(UIColor * color) {
        self.view.backgroundColor = color;
    };
    secondVC.strBlock = ^(NSString * str) {
        self.showLabel.text = str;
    };
    __weak typeof(self) weakSelf = self;
    secondVC.doSth = ^(){
        [weakSelf doSth];
        NSLog(@"doSth");
    };
    [self.navigationController pushViewController:secondVC animated:YES];
}
- (void)doSth {
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
