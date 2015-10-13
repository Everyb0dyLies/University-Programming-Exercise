//
//  Expression.m
//  数据结构实验2-栈和队列
//
//  Created by Jerry Black on 14/12/7.
//  Copyright (c) 2014年 Ming Gao. All rights reserved.
//

#import "Expression.h"
#import "Stack.h"

@interface Expression()

@property (nonatomic)  NSString *expression;
@property Stack *operators;
@property Stack *operands;

@end

@implementation Expression

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.expression = [[NSString alloc] init];
        self.operators = [[Stack alloc] init];
        self.operands = [[Stack alloc] init];
    }
    return self;
}

- (instancetype)initWithExpression:(NSString*)exp
{
    self = [super init];
    if (self) {
        self.expression = exp;
        self.operators = [[Stack alloc] init];
        self.operands = [[Stack alloc] init];
    }
    return self;
}

//- (void)setExpression:(NSString*)exp {
//    self.expression = exp;
//}

- (NSNumber*)operation {
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:[self.expression componentsSeparatedByString:@" "]];
    while (![self.operators isEmpty] || array.count != 0) {
        if ([[array firstObject] doubleValue]) {
            [self.operands pushObject:[NSNumber numberWithDouble:[[array firstObject] doubleValue]]];
            [array removeObjectAtIndex:0];
        } else {
            switch ([self compare:[self.operators getObject] and:[array firstObject]]) {
                case -1:
                    [self.operators pushObject:[array firstObject]];
                    [array removeObjectAtIndex:0];
                    break;
                case 0:
                    [self.operators popObject];
                    [array removeObjectAtIndex:0];
                    break;
                case 1:
                    [self.operands pushObject:[self operateA:[self.operands popObject]
                                                        andB:[self.operands popObject]
                                                         use:[self.operators popObject]]];
                    break;
                default:
                    break;
            }
        }
    }
    return [self.operands popObject];
}

- (int)compare:(NSString*)s1 and:(NSString*)s2 {
    int a1 = 0, a2 = 0;
    if ([s1 isEqualToString:@")"] ||
        [s1 isEqualToString:@"]"]) {
        a1 = 17;
    } else if ([s1 isEqualToString:@"("] ||
               [s1 isEqualToString:@"["]) {
        a1 = 0;
    } else if ([s1 isEqualToString:@"++"] ||
               [s1 isEqualToString:@"__"]) {
        a1 = 16;
    } else if ([s1 isEqualToString:@"*"] ||
               [s1 isEqualToString:@"/"] ||
               [s1 isEqualToString:@"%"]) {
        a1 = 13;
    } else if ([s1 isEqualToString:@"+"] ||
               [s1 isEqualToString:@"-"]) {
        a1 = 12;
    }
    
    if ([s2 isEqualToString:@"("] ||
        [s2 isEqualToString:@"["]) {
        a2 = 17;
    } else if ([s2 isEqualToString:@")"] ||
               [s1 isEqualToString:@"]"]) {
        a2 = 0;
    } else if ([s2 isEqualToString:@"++"] ||
               [s2 isEqualToString:@"__"]) {
        a2 = 16;
    } else if ([s2 isEqualToString:@"*"] ||
               [s2 isEqualToString:@"/"] ||
               [s2 isEqualToString:@"%"]) {
        a2 = 13;
    } else if ([s2 isEqualToString:@"+"] ||
               [s2 isEqualToString:@"-"]) {
        a2 = 12;
    }
    
    if (a1 == a2) {
        return 0;
    } else if (a1 > a2) {
        return 1;
    } else {
        return -1;
    }
}

- (NSNumber*)operateA:(NSNumber*)a andB:(NSNumber*)b use:(NSString*)opa {
    if ([opa isEqualToString:@"+"]) {
        return [NSNumber numberWithDouble:[b doubleValue] + [a doubleValue]];
    } else if ([opa isEqualToString:@"-"]) {
        return [NSNumber numberWithDouble:[b doubleValue] - [a doubleValue]];
    } else if ([opa isEqualToString:@"*"]) {
        return [NSNumber numberWithDouble:[b doubleValue] * [a doubleValue]];
    } else if ([opa isEqualToString:@"/"]) {
        return [NSNumber numberWithDouble:[b doubleValue] / [a doubleValue]];
    }
    return nil;
}

@end
