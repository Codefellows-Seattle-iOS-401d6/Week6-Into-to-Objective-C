//
//  Store.h
//  Classmates
//
//  Created by Jessica Malesh on 7/13/16.
//  Copyright © 2016 Jess Malesh. All rights reserved.
//

@import UIKit;
@class Student;

//typedef void(^StoreCompletion)();



@interface Store : NSObject

//create singleton
+ (instancetype)shared;

/*
 
    Get an array of all students. To interact with datastore
    please use add:, remove:, removeAt....
 
*/

//helper methods
- (NSArray *)allStudents;
- (Student *)studentForIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)count;

- (void)add: (Student *)student;
- (void)remove: (Student *)student;
- (void)removeStudentAtIndexPath:(NSIndexPath *)indexPath;
- (void)save;







@end
