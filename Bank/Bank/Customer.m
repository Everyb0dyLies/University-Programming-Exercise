//
//  Customer.m
//  Bank
//
//  Created by GaoMing on 15/3/13.
//  Copyright (c) 2015年 ifLab. All rights reserved.
//

#import "Customer.h"

@interface Customer()

@property NSInteger seconds;

@end

@implementation Customer

- (instancetype)initWithID:(NSInteger)ID
{
    self = [super init];
    if (self) {
        _ID = ID;
        _seconds = ((arc4random() % 18) + 12);
    }
    return self;
}

- (void)business {
    NSLog(@"%ld号顾客开始办理业务", self.ID);
    NSCondition *businessTask = [[NSCondition alloc] init];
    [businessTask lock];
    [businessTask waitUntilDate:[NSDate dateWithTimeIntervalSinceNow:_seconds]];
    [businessTask unlock];
    NSLog(@"%ld号顾客业务办理结束", self.ID);
    return;
}

@end
