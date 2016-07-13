//
//  Employee.m
//  LabClass1Week6
//
//  Created by Erin Roby on 7/11/16.
//  Copyright © 2016 Erin Roby. All rights reserved.
//

#import "Employee.h"

@implementation Employee

- (void)setTitle:(NSString *)title
{
    if (_title != title) {
        _title = [title copy];
    }
}

- (NSString *)title
{
    return _title;
}

@end
