//
//  CloudService.h
//  WednesdayObjCTablesLab
//
//  Created by Rick  on 7/14/16.
//  Copyright © 2016 Rick . All rights reserved.
//

#import <Foundation/Foundation.h>
@import CloudKit;
@class Student;

typedef enum : NSUInteger {
    CloudOperationSave,
    CloudOperationRetrieve,
    CloudOperationDelete,
} CloudOperation;

typedef void(^CloudServiceCompletion)(BOOL success, NSArray<Student *> *students);

@interface CloudService : NSObject

+ (instancetype)shared;

- (void)enqueueOperation:(CloudServiceCompletion)completion;
- (void)enqueueOperation:(CloudOperation)operation student: (Student *)student completion: (CloudServiceCompletion)completion;



@end
