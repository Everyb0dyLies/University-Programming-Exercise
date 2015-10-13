//
//  BinTree.h
//  BinaryTree
//
//  Created by Jerry Black on 14/12/18.
//  Copyright (c) 2014年 Ming Gao. All rights reserved.
//

#import <Foundation/Foundation.h>

//类名称：BinTree
//定义该类的目的：建立二叉树类
//类属性：左子树，右子树，数据域
//类中函数及功能：
//  createWithPreorder:(NSString*)preorder 根据前序遍历序列生成二叉树
//  recursionPrintDataWithVLR 前序递归遍历函数
//  recursionPrintDataWithLVR 中序递归遍历函数
//  recursionPrintDataWithLRV 后序递归遍历函数
//  sequencePrintDataWithVLR 前序非递归遍历函数
//  sequencePrintDataWithLVR 中序非递归遍历函数

@interface BinTree : NSObject

+ (id)createWithPreorder:(NSString*)preorder;

- (void)recursionPrintDataWithVLR;
- (void)recursionPrintDataWithLVR;
- (void)recursionPrintDataWithLRV;

- (void)sequencePrintDataWithVLR;
- (void)sequencePrintDataWithLVR;

@end
