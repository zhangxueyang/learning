//
//  ViewController.m
//  单利
//
//  Created by Gary on 2018/3/30.
//  Copyright © 2018年 Gary. All rights reserved.
//

#import "ViewController.h"
#import "Single.h"
#import "MalocSingleTone.h"
#import "Inheritance.h"

@interface ViewController ()

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    //普通创建
//    NSLog(@"%@%@",[[Single alloc] init],[Single shareInstance]);
    
    //继承单利
     NSLog(@"%@%@",[[Inheritance alloc] init],[Inheritance sharedInstance]);
    
    //宏定义创建
//    NSLog(@"%@,%@",[MalocSingleTone sharedMaloc],[[MalocSingleTone alloc] init]);
}

@end
