//
//  BlockSecondViewController.h
//  PassValue
//
//  Created by 刘志伟 on 2017/3/16.
//  Copyright © 2017年 刘志伟. All rights reserved.
//

#import "LeftSlideBackViewController.h"

@interface BlockSecondViewController : LeftSlideBackViewController
// 第一步定义, Block作为property属性
/*
 void: Block的返回值为空，即无返回值；
 colorBlock: Block的作为对象属性时的属性名；
 (UIColor *color): Block的参数是UIColor实例对象
 */
@property (nonatomic, copy) void(^colorBlock)(UIColor *color);
@property (nonatomic, copy)void (^strBlock)(NSString * str);
@property (nonatomic, copy)void (^doSth)();

@end
