//
//  Store.h
//  StudentsDirectory
//
//  Created by Sung Kim on 7/13/16.
//  Copyright © 2016 Sung Kim. All rights reserved.
//

@import UIKit;

@class Student;

@interface Store : NSObject

+ (instancetype)shared;

- (NSArray *)allStudents;

- (Student *)studentForIndexPath:(NSIndexPath *)indexPath;

- (NSInteger)count;

- (void)add:(Student *)student;
- (void)remove:(Student *)student;
- (void)removeStudentAtIndexPath:(NSIndexPath *)indexPath;
- (void)save;

@end
