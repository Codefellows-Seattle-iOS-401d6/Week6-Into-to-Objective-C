//
//  CloudService.h
//  Classmates
//
//  Created by Erin Roby on 7/14/16.
//  Copyright © 2016 Erin Roby. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CloudKit;
@class Student;

typedef enum: NSUInteger {
    CloudOperationSave = 0, // default is zero and increment by one, but you can be explicit and say 100.
    CloudOperationRetrieve,
    CloudOperationDelete,
} CloudOperation;

typedef void(^CloudServiceCompletion)(BOOL success, NSArray<Student *> *students); // <Student *> is to make it work with Swift.

@interface CloudService : NSObject

+ (instancetype)shared;

- (void)enqueueOperation:(CloudServiceCompletion)completion;
- (void)enqueueOperation:(CloudOperation)operation student: (Student *)student completion:(CloudServiceCompletion)completion;


@end
