//
//  AutomaticCallingDistributor.h
//  Bank
//
//  Created by GaoMing on 15/3/13.
//  Copyright (c) 2015年 ifLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AutomaticCallingDistributor : NSObject

@property BOOL isOpen;
@property NSLock *lock;
@property NSMutableArray *customers;

- (instancetype)init;

@end
