//
//  Student+Extension.h
//  ClassMate
//
//  Created by Olesia Kalashnik on 7/13/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

#import "Student.h"
@import CloudKit;

typedef void(^StudentCompletion)(NSArray<Student *> *students);

@interface Student (Extension)
+(void)studentsFromRecords:(NSArray<CKRecord*> *)records completion:(StudentCompletion)completion;

-(BOOL)isValid;
@end
