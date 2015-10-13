//
//  BinTree.m
//  BinaryTree
//
//  Created by Jerry Black on 14/12/18.
//  Copyright (c) 2014年 Ming Gao. All rights reserved.
//

#import "BinTree.h"
#import "Stack.h"

@interface BinTree()

@property BinTree *liftBinTree;
@property BinTree *rightBinTree;
@property id data;

@end

@implementation BinTree

//- (instancetype)initWith
//{
//    self = [super init];
//    if (self) {
//        <#statements#>;
//    }
//    return self;
//}

//函数名称：init
//函数参数：(BinTree*)bt1 (id)data (BinTree*)bt2
//函数功能描述：初始化

- (instancetype)initWithBT:(BinTree*)bt1 data:(id)data BT:(BinTree*)bt2
{
    self = [super init];
    if (self) {
        self.liftBinTree = bt1;
        self.rightBinTree = bt2;
        self.data = data;
    }
    return self;
}

//函数名称：createWithArray
//函数参数：(NSMutableArray*)array
//函数功能描述：根据前序遍历序列生成二叉树

+ (id)createWithArray:(NSMutableArray*)array {
    BinTree *bt = [[BinTree alloc] init];
    if ([[array firstObject] isEqualToString:@"#"]) {
        [array removeObjectAtIndex:0];
        return nil;
    } else {
        bt.data = [array firstObject];
        [array removeObjectAtIndex:0];
        bt.liftBinTree = [BinTree createWithArray:array];
        bt.rightBinTree = [BinTree createWithArray:array];
        return bt;
    }
}

//函数名称：createWithPreorder
//函数参数：(NSString*)preorder
//函数功能描述：解析用户输入的字符串

+ (id)createWithPreorder:(NSString*)preorder {
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:[preorder componentsSeparatedByString:@" "]];
    return [BinTree createWithArray:array];
}

//- (BOOL)isEmpty {
//    return 0;
//}

//函数名称：getData
//函数功能描述：获取数据域

- (id)getData {
    return self.data;
}

//函数名称：recursionPrintDataWithVLR
//函数功能描述：前序递归遍历函数

- (void)recursionPrintDataWithVLR {
    if (self) {
        NSLog(self.data);
        [self.liftBinTree recursionPrintDataWithVLR];
        [self.rightBinTree recursionPrintDataWithVLR];
    }
    return;
}

//函数名称：recursionPrintDataWithLVR
//函数功能描述：中序递归遍历函数

- (void)recursionPrintDataWithLVR {
    if (self) {
        [self.liftBinTree recursionPrintDataWithVLR];
        NSLog(self.data);
        [self.rightBinTree recursionPrintDataWithVLR];
    }
}

//函数名称：recursionPrintDataWithLRV
//函数功能描述：后序递归遍历函数

- (void)recursionPrintDataWithLRV {
    if (self) {
        [self.liftBinTree recursionPrintDataWithVLR];
        [self.rightBinTree recursionPrintDataWithVLR];
        NSLog(self.data);
    }
}

//函数名称：sequencePrintDataWithVLR
//函数功能描述：前序非递归遍历函数

- (void)sequencePrintDataWithVLR {
    BinTree *p = self;
    Stack *stack = [[Stack alloc] init];
    do {
        if (p) {
            NSLog(p.data);
            [stack pushObject:p];
            p = p.liftBinTree;
        } else {
            p = [stack popObject];
            p = p.rightBinTree;
        }
    } while (![stack isEmpty]);
}

//函数名称：sequencePrintDataWithLVR
//函数功能描述：中序非递归遍历函数

- (void)sequencePrintDataWithLVR {
    BinTree *p = self;
    Stack *stack = [[Stack alloc] init];
    do {
        if (p) {
            [stack pushObject:p];
            p = p.liftBinTree;
        } else {
            p = [stack popObject];
            NSLog(p.data);
            p = p.rightBinTree;
        }
    } while (![stack isEmpty]);
}

@end
