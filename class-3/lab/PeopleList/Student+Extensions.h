//
//  Student+Extensions.h
//  PeopleList
//
//  Created by Derek Graham on 7/13/16.
//  Copyright © 2016 Derek Graham. All rights reserved.
//

@import CloudKit;
#import "Student.h"


typedef void(^StudentCompletion)(NSArray <Student *> *students);

@interface Student (Extensions)


+ (void)studentsFromRecords: (NSArray<CKRecord *> *)records completion:(StudentCompletion)completion;
- (BOOL)isValid;


@end
