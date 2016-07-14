//
//  Employee.h
//  hannahGaskinsObjCPractice
//
//  Created by hannah gaskins on 7/11/16.
//  Copyright © 2016 hannah gaskins. All rights reserved.
//

#import "Person.h"

@interface Employee : Person

{
    NSString *_employeeID;
}

-(void)setEmployeeID:(NSString *)employeeID;
-(NSString *)employeeID;

@end
