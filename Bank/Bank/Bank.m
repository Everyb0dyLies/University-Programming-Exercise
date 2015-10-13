//
//  Bank.m
//  Bank
//
//  Created by GaoMing on 15/3/17.
//  Copyright (c) 2015年 ifLab. All rights reserved.
//

#import "Bank.h"
#import "Teller.h"
#import "AutomaticCallingDistributor.h"

@interface Bank()

@property NSMutableArray* tellers;

@end

@implementation Bank

- (instancetype)init
{
    self = [super init];
    if (self) {
        _tellers = [[NSMutableArray alloc] init];
    }
    return self;
}


+ (void)bankWithNumberOfTeller:(NSInteger)numberOfTeller andOpenDate:(NSDate *)openDate andCloseDate:(NSDate *)closeDate {
    Bank *bank = [[Bank alloc] init];
    AutomaticCallingDistributor *ACD = [[AutomaticCallingDistributor alloc] init];
    for (int i = 1; i <= numberOfTeller; i++) {
        Teller *teller = [[Teller alloc] initWithID:i];
        [bank.tellers addObject:teller];
    }
    
    NSCondition *waitTask = [[NSCondition alloc] init];
    [waitTask lock];
    [waitTask waitUntilDate:openDate];
    [waitTask unlock];
    
    NSLog(@"银行开门");
    [ACD.lock lock];
    ACD.isOpen = true;
    [ACD.lock unlock];
    for (Teller *teller in bank.tellers) {
        NSThread *thread = [[NSThread alloc] initWithTarget:teller
                                                   selector:@selector(startWithACD:)
                                                     object:ACD];
        [thread start];
    }
    NSThread *thread = [[NSThread alloc] initWithTarget:ACD
                                               selector:@selector(start)
                                                 object:nil];
    [thread start];
    
    [waitTask lock];
    [waitTask waitUntilDate:closeDate];
    [waitTask unlock];
    NSLog(@"银行关门");
    [ACD.lock lock];
    ACD.isOpen = false;
    [ACD.lock unlock];
    
    [bank statistical];
}

- (void)statistical {
    BOOL canClose = true;
    do {
        NSCondition *waitTask = [[NSCondition alloc] init];
        [waitTask lock];
        [waitTask waitUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.5]];
        [waitTask unlock];
        
        canClose = true;
        for (Teller *teller in _tellers) {
            if (teller.isWork) canClose = false;
        }
    } while (!canClose);
    
    NSLog(@"数据统计");
    for (Teller *teller in _tellers) {
        NSLog(@"第%ld号窗口共接待%ld位顾客，总工作时间为%lds，平均每位顾客用时%lds", teller.ID, teller.countOfCustomer, teller.businessTime, (teller.businessTime / teller.countOfCustomer));
    }
}

@end
