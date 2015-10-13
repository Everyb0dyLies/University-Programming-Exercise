//
//  AutomaticCallingDistributor.m
//  Bank
//
//  Created by GaoMing on 15/3/13.
//  Copyright (c) 2015年 ifLab. All rights reserved.
//

#import "AutomaticCallingDistributor.h"
#import "Customer.h"

@interface AutomaticCallingDistributor()

@end

@implementation AutomaticCallingDistributor

- (instancetype)init
{
    self = [super init];
    if (self) {
        _isOpen = false;
        _customers = [[NSMutableArray alloc] init];
        _lock = [[NSLock alloc] init];
    }
    return self;
}

- (void)start {
    NSLog(@"开始接待顾客");
    for (int i = 1; ; ) {
        [_lock lock];
        if (_isOpen) {
            Customer *customer = [[Customer alloc] initWithID:i];
            [_customers addObject:customer];
            [_lock unlock];
            NSLog(@"第%ld号顾客开始等待", customer.ID);
            i++;
        } else {
            [_lock unlock];
            break;
        }
        
        NSCondition *waitTask = [[NSCondition alloc] init];
        [waitTask lock];
        [waitTask waitUntilDate:[NSDate dateWithTimeIntervalSinceNow:((arc4random() % 5) + 5)]];
        [waitTask unlock];
    }
    return;
}

@end
