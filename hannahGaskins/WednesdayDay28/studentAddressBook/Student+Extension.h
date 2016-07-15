//
//  Student+Extension.h
//  studentAddressBook
//
//  Created by hannah gaskins on 7/13/16.
//  Copyright © 2016 hannah gaskins. All rights reserved.
//

@import CloudKit;
#import "Student.h"

typedef void(^StudentCompletion)(NSArray<Student *> *students);

@interface Student (Extension)

- (BOOL)isValid;

// takes array of CKRecord and returns and array of Student
+ (void)studentsFromRecords:(NSArray<CKRecord *> *)records completion: (StudentCompletion)completion;

- (BOOL)isValid;

@end
