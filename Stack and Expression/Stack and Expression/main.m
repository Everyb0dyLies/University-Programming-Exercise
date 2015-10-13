//
//  main.m
//  数据结构实验2-栈和队列
//
//  Created by Jerry Black on 14/12/7.
//  Copyright (c) 2014年 Ming Gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Expression.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Expression *exp = [[Expression alloc] initWithExpression:@"99 - 3 * 4"];
        NSLog(@"%f", [[exp operation] doubleValue]);
    }
    return 0;
}
