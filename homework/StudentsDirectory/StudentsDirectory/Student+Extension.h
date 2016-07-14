//
//  Student+Extension.h
//  StudentsDirectory
//
//  Created by Sung Kim on 7/13/16.
//  Copyright © 2016 Sung Kim. All rights reserved.
//

@import CloudKit;
#import "Student.h"

typedef void(^StudentCompletion)(NSArray<Student *> *students);

@interface Student (Extension)

//takes in an array of CKRecord and converts into a Student record
+ (void)studentsFromRecords:(NSArray<CKRecord *> *)records completion:(StudentCompletion)completion;

- (BOOL)isValid;

@end
