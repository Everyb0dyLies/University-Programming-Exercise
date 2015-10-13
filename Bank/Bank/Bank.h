//
//  Bank.h
//  Bank
//
//  Created by GaoMing on 15/3/17.
//  Copyright (c) 2015年 ifLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bank : NSObject

+ (void)bankWithNumberOfTeller:(NSInteger)numberOfTeller
                   andOpenDate:(NSDate *)openDate
                  andCloseDate:(NSDate *)closeDate;

@end
