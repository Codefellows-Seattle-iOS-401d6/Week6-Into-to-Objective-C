//
//  Student+Extension.h
//  Classmates
//
//  Created by Erin Roby on 7/13/16.
//  Copyright © 2016 Erin Roby. All rights reserved.
//

@import CloudKit;
#import "Student.h"

typedef void(^StudentCompletion)(NSArray<Student *> *students);

@interface Student (Extension)

+ (void)studentsFromRecords:(NSArray *)records completion:(StudentCompletion)completion;

- (BOOL)isValid;

@end
