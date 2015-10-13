//
//  Customer.h
//  Bank
//
//  Created by GaoMing on 15/3/13.
//  Copyright (c) 2015年 ifLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Customer : NSObject

@property NSInteger ID;

- (instancetype)initWithID:(NSInteger)ID;
- (void)business;

@end
