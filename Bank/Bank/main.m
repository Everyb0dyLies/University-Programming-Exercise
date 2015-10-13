//
//  main.m
//  Bank
//
//  Created by GaoMing on 15/3/13.
//  Copyright (c) 2015年 ifLab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bank.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSDate *openDate = [[NSDate alloc] initWithTimeIntervalSinceNow:10.0];
        NSDate *closeDate = [[NSDate alloc] initWithTimeIntervalSinceNow:60.0];
        [Bank bankWithNumberOfTeller:2 andOpenDate:openDate andCloseDate:closeDate];
    }
    return 0;
}

