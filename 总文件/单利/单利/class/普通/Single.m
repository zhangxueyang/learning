//
//  Single.m
//  单利
//
//  Created by Gary on 2018/3/30.
//  Copyright © 2018年 Gary. All rights reserved.
//

#import "Single.h"
static Single *single = nil;
@implementation Single
+(instancetype) shareInstance{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        single = [[super allocWithZone:NULL] init];
    }) ;
    return single ;
}
+(id) allocWithZone:(struct _NSZone *)zone{
    return [Single shareInstance] ;
}
-(id) copyWithZone:(struct _NSZone *)zone{
    return [Single shareInstance] ;
}
@end
