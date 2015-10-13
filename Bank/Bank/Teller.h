//
//  Teller.h
//  Bank
//
//  Created by GaoMing on 15/3/13.
//  Copyright (c) 2015年 ifLab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AutomaticCallingDistributor.h"

@interface Teller : NSObject //<CustomerDelegate>

@property NSInteger ID;
@property BOOL isWork;
@property NSInteger countOfCustomer;
@property NSInteger businessTime;

- (instancetype)initWithID:(NSInteger)ID;
- (void)startWithACD:(AutomaticCallingDistributor *)ACD;

@end
