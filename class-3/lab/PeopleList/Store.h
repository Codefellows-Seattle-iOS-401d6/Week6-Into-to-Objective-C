//
//  Store.h
//  PeopleList
//
//  Created by Derek Graham on 7/13/16.
//  Copyright © 2016 Derek Graham. All rights reserved.
//

@import Foundation;
@class Student;

typedef void(^StoreCompletion)();

//typedef void(^StoreCompletion)();

@interface Store : NSObject

+ (instancetype)shared;

- (void) addStudentsFromCloudKit: (NSArray *)students;
- (NSArray *)allStudents;
- (Student *)studentForIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)count;

- (void)add:(Student *)student completion:(StoreCompletion)completion;
- (void)remove:(Student *)student completion:(StoreCompletion)completion;
- (void)removeStudentAtIndexPath:(NSIndexPath *)indexPath completion:(StoreCompletion)completion;
- (void)save;

@end
