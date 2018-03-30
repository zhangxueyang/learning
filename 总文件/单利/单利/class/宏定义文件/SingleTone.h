//
//  SingleTone.h
//  Instance
//
//  Created by Gary on 2018/3/2.
//  Copyright © 2018年 Gary. All rights reserved.
//

#ifndef SingleTone_h
#define SingleTone_h

#define SingleToneH(MethodName) +(instancetype)shared##MethodName

//如果不是ARC的模式下
#if !__has_feature(objc_arc)
#define SingleToneM(MethodName)\
static id _instance = nil;\
+(id)allocWithZone:(struct _NSZone *)zone\
{\
if (_instance == nil) {\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance = [super allocWithZone:zone];\
});\
}\
return _instance;\
}\
-(instancetype)init\
{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance = [super init];\
});\
return _instance;\
}\
+(instancetype)shared##MethodName\
{\
return [[self alloc] init];\
}\
-(oneway void)release{}\
-(id)retain{return self;}\
-(NSUInteger)retainCount{return 1;}\

#else

#define SingleToneM(MethodName)\
static id _instance = nil;\
+(id)allocWithZone:(struct _NSZone *)zone\
{\
if (_instance == nil) {\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance = [super allocWithZone:zone];\
});\
}\
return _instance;\
}\
-(instancetype)init\
{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance = [super init];\
});\
return _instance;\
}\
+(instancetype)shared##MethodName\
{\
return [[self alloc] init];\
}

#endif



#endif /* SingleTone_h */
