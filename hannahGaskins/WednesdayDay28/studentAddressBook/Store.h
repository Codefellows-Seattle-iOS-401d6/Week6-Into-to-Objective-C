//
//  Store.h
//  studentAddressBook
//
//  Created by hannah gaskins on 7/13/16.
//  Copyright © 2016 hannah gaskins. All rights reserved.
//

@import UIKit;
@class Student; //referencing student, but we want compiler to know we have a class called Student. Compiler will not complain, it doesn't know anything about it. "Forward declaration ish".

typedef void(^StoreCompletion)();

@interface Store : NSObject

+ (instancetype)shared;

- (void)addStudentsFromCloudKit:(NSArray *)students;

- (NSArray *)allStudents;
- (Student *)studentForIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)count;

- (void)add:(Student *)student completion:(StoreCompletion)completion;
- (void)remove:(Student *)student completion:(StoreCompletion)completion;
- (void)removeStudentAtIndexPath:(NSIndexPath *)indexPath completion:(StoreCompletion)completion;
- (void)save;

@end
