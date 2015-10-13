//
//  main.m
//  BinaryTree
//
//  Created by Jerry Black on 14/12/18.
//  Copyright (c) 2014年 Ming Gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BinTree.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        char buffer[1000];
        int a = 1;
        printf("请输入前序遍历序列:");
        gets(buffer);
        BinTree *bt = [BinTree createWithPreorder:[NSString stringWithUTF8String:buffer]];
        while (a != 0) {
            printf("请选择模式:\n");
            printf("1:前序递归遍历\n");
            printf("2:中序递归遍历\n");
            printf("3:后序递归遍历\n");
            printf("4:前序非递归遍历\n");
            printf("5:中序非递归遍历\n");
            printf("0:退出\n");
            scanf("%d", &a);
            switch (a) {
                case 1:
                    [bt recursionPrintDataWithVLR];
                    break;
                case 2:
                    [bt recursionPrintDataWithLVR];
                    break;
                case 3:
                    [bt recursionPrintDataWithLRV];
                    break;
                case 4:
                    [bt sequencePrintDataWithVLR];
                    break;
                case 5:
                    [bt sequencePrintDataWithLVR];
                    break;
                default:
                    a = 0;
                    break;
            }
        }
    }
    return 0;
}
