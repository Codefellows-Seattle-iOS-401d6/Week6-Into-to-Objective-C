//
//  Student+Extension.h
//  Week6-Day28
//
//  Created by Sean Champagne on 7/13/16.
//  Copyright © 2016 Sean Champagne. All rights reserved.
//

#import "Student.h"
@import CloudKit;

typedef void(^StudentCompletion)(NSArray<Student *> *students);


@interface Student (Extension)

+ (void)studentsFromRecords:(NSArray<CKRecord *> *)records completion: (StudentCompletion)completion;
-(BOOL)isValid;

@end
