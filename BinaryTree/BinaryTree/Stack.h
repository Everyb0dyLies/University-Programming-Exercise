//
//  Stack.h
//  数据结构实验2-栈和队列
//
//  Created by Jerry Black on 14/12/7.
//  Copyright (c) 2014年 Ming Gao. All rights reserved.
//

#import <Foundation/Foundation.h>

//类名称：Stack
//定义该类的目的：建立栈类
//类属性：array(NSMutableArray类型)
//类中函数及功能：init inFull isEmpty pushObject getObject popObject

@interface Stack : NSObject

- (BOOL)isFull;
- (BOOL)isEmpty;
- (BOOL)pushObject:(id)object;
- (id)getObject;
- (id)popObject;

@end
