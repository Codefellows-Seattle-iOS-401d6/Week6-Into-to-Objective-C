//
//  Employee.m
//  Homework1Week6
//
//  Created by Olesia Kalashnik on 7/11/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

#import "Employee.h"

//Task4
@implementation Employee

- (instancetype)initWithID:(NSNumber *)ID {
    self = [super init];
    if (self) {
        _ID = ID;
    }
    return self;
}


@end
