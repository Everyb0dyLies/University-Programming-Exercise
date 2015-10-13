//
//  Expression.h
//  数据结构实验2-栈和队列
//
//  Created by Jerry Black on 14/12/7.
//  Copyright (c) 2014年 Ming Gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Expression : NSObject

- (instancetype)initWithExpression:(NSString*)expression;
- (void)setExpression:(NSString*)expression;
- (NSNumber*)operation;

@end
