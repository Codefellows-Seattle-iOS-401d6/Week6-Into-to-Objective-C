//
//  Employee.h
//  Week6-Class26
//
//  Created by Sean Champagne on 7/11/16.
//  Copyright © 2016 Sean Champagne. All rights reserved.
//

#import "Person.h"

@interface Employee : Person
@property(copy, nonatomic) NSString *employeeTitle;

-(void)giveTitle;

-(NSString *)employeeTitle; //getter

@end
