//
//  Store.h
//  studentAddressBook
//
//  Created by hannah gaskins on 7/13/16.
//  Copyright © 2016 hannah gaskins. All rights reserved.
//

@import UIKit;
@class Student; //referencing student, but we want compiler to know we have a class called Student. Compiler will not complain, it doesn't know anything about it. "Forward declaration ish".

@interface Store : NSObject

+ (instancetype)shared;

- (NSArray *)allStudents;
- (Student *)studentForIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)count;

// method for adding,removing, saving student
- (void)add:(Student *)student;
- (void)remove:(Student *)student;
- (void)removeStudentAtIndexPath:(NSIndexPath *)indexPath;
- (void)save;



@end
