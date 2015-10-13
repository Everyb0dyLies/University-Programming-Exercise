//
//  Teller.m
//  Bank
//
//  Created by GaoMing on 15/3/13.
//  Copyright (c) 2015年 ifLab. All rights reserved.
//

#import "Teller.h"
#import "Customer.h"

@interface Teller()

@end

@implementation Teller

- (instancetype)initWithID:(NSInteger)ID
{
    self = [super init];
    if (self) {
        _ID = ID;
        _isWork = false;
        _countOfCustomer = 0;
        _businessTime  = 0;
    }
    return self;
}

- (void)startWithACD:(AutomaticCallingDistributor *)ACD {
    for (_countOfCustomer = 0; ; ) {
        [ACD.lock lock];
        if ([ACD.customers count] != 0) {
            Customer *customer = [ACD.customers objectAtIndex:0];
            [ACD.customers removeObjectAtIndex:0];
            [ACD.lock unlock];
            
            _isWork = true;
            NSLog(@"%ld号窗口准备接待第%ld位顾客", _ID, customer.ID);
            NSDate *startDate = [NSDate date];
            [customer business];
            _countOfCustomer++;
            NSDate *endDate = [NSDate date];
            _businessTime = _businessTime + [endDate timeIntervalSinceDate:startDate];
            _isWork = false;
        } else {
            [ACD.lock unlock];
            if (!ACD.isOpen) break;
            
            NSCondition *waitTask = [[NSCondition alloc] init];
            [waitTask lock];
            [waitTask waitUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.5]];
            [waitTask unlock];
        }
    }
    return;
}

@end
