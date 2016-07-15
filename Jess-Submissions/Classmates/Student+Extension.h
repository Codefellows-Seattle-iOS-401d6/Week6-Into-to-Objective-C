//
//  Student+Extension.h
//  Classmates
//
//  Created by Jessica Malesh on 7/13/16.
//  Copyright © 2016 Jess Malesh. All rights reserved.
//

@import CloudKit;
#import "Student.h"


typedef void(^StudentCompletion)(NSArray<Student *> *students);


@interface Student (Extension)

+ (void)studentsFromRecords:(NSArray<CKRecord *> *)records completion:(StudentCompletion)completion;
- (BOOL)isValid;

@end
