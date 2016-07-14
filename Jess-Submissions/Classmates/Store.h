//
//  Store.h
//  Classmates
//
//  Created by Jessica Malesh on 7/13/16.
//  Copyright © 2016 Jess Malesh. All rights reserved.
//

@import UIKit;
@class Student;

typedef void(^StoreCompletion)();



@interface Store : NSObject

//create singleton
+ (instancetype)shared;

- (void)addStudentsFromCloudKit:(NSArray *)students;


//helper methods
- (NSArray *)allStudents;
- (Student *)studentForIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)count;

- (void)add: (Student *)student completion:(StoreCompletion)completion;
- (void)remove: (Student *)student completion:(StoreCompletion)completion;
- (void)removeStudentAtIndexPath:(NSIndexPath *)indexPath completion:(StoreCompletion)completion;
- (void)save;


@end
