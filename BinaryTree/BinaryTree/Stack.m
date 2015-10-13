//
//  Stack.m
//  数据结构实验2-栈和队列
//
//  Created by Jerry Black on 14/12/7.
//  Copyright (c) 2014年 Ming Gao. All rights reserved.
//

#import "Stack.h"

@interface Stack()

@property NSMutableArray *array;

@end

@implementation Stack

//函数名称：init
//函数功能描述：初始化

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.array = [[NSMutableArray alloc] init];
    }
    return self;
}

//函数名称：isFull
//函数功能描述：判断栈满

- (BOOL)isFull {
    return NO;
}

//函数名称：isEmpty
//函数功能描述：判断栈空

- (BOOL)isEmpty {
    if (self.array.count != 0) {
        return NO;
    } else {
        return YES;
    }
}

//函数名称：pushObject
//函数功能描述：添加元素

- (BOOL)pushObject:(id)object {
    NSInteger count = self.array.count;
    [self.array addObject:object];
    if (count + 1 == self.array.count) {
        return YES;
    } else {
        return NO;
    }
}

//函数名称：getObject
//函数功能描述：取栈顶元素

- (id)getObject {
    NSObject *object = self.array.lastObject;
    return object;
}

//函数名称：popObject
//函数功能描述：推出元素

- (id)popObject {
    NSObject *object = self.array.lastObject;
    [self.array removeLastObject];
    return object;
}

@end

