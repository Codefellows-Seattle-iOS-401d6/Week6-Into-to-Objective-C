//
//  Employee.m
//  hannahGaskinsObjCPractice
//
//  Created by hannah gaskins on 7/11/16.
//  Copyright © 2016 hannah gaskins. All rights reserved.
//

#import "Employee.h"

@implementation Employee

-(void)setEmployeeID:(NSString *)employeeID {
    if (_employeeID != employeeID) {
        _employeeID = employeeID;
    }
}
-(NSString *)employeeID {
    return _employeeID;
}

@end
