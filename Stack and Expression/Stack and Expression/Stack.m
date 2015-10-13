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

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.array = [[NSMutableArray alloc] init];
    }
    return self;
}

- (BOOL)isFull {
    return NO;
}

- (BOOL)isEmpty {
    if (self.array.count != 0) {
        return NO;
    } else {
        return YES;
    }
}

- (BOOL)pushObject:(id)object {
    NSInteger count = self.array.count;
    [self.array addObject:object];
    if (count + 1 == self.array.count) {
        return YES;
    } else {
        return NO;
    }
}

- (id)getObject {
    NSObject *object = self.array.lastObject;
    return object;
}

- (id)popObject {
    NSObject *object = self.array.lastObject;
    [self.array removeLastObject];
    return object;
}


@end

