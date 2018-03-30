//
//  Inheritance.m
//  单利
//
//  Created by Gary on 2018/3/30.
//  Copyright © 2018年 Gary. All rights reserved.
//

#import "Inheritance.h"
#import <objc/runtime.h>
@implementation Inheritance
+(instancetype)sharedInstance{
    id instance = objc_getAssociatedObject(self, @"instance");
    if (!instance){
        instance = [[super allocWithZone:NULL] init];
        NSLog(@"单例创建=====%@=====",instance);
        objc_setAssociatedObject(self, @"instance", instance, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return instance;
}
+(id) allocWithZone:(struct _NSZone *)zone{
    return [self sharedInstance] ;
}
-(id) copyWithZone:(struct _NSZone *)zone{
    Class selfClass = [self class];
    return [selfClass sharedInstance] ;
}
@end
