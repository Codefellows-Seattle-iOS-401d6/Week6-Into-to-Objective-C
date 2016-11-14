//
//  Employee.m
//  Monday
//
//  Created by Rick  on 7/11/16.
//  Copyright © 2016 Rick . All rights reserved.
//

#import "Employee.h"

@implementation Employee

- (instancetype)initWithName:(NSString *)job {
    self = [super init];
    
    if (self) {
        _job = job;
    }
    
    return self;
}

- (NSString *)job {
    return _job;
}

-(NSNumber *)salary:(NSNumber *)hourlyWage {
    double salary = [hourlyWage doubleValue] * 40.0 * 52.0;
    return [NSNumber numberWithDouble: salary];
}

@end
