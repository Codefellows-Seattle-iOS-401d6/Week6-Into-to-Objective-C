//
//  Student+Extension.h
//  WednesdayObjCTablesLab
//
//  Created by Rick  on 7/13/16.
//  Copyright © 2016 Rick . All rights reserved.
//

#import "Student.h"
@import CloudKit;

typedef void(^StudentCompletion)(NSArray <Student *> *);

@interface Student (Extension)

- (BOOL)isValid;
+ (void)studentsFromRecords:(NSArray <CKRecord *> *)record completion:(StudentCompletion)completion;

@end
