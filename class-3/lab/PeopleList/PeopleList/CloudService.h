//
//  CloudService.h
//  PeopleList
//
//  Created by Derek Graham on 7/14/16.
//  Copyright © 2016 Derek Graham. All rights reserved.
//

@import Foundation;
@import CloudKit;
@class Student;

typedef enum : NSUInteger
{
    CloudOpsSave = 0,
    CloudOpsGet,
    CloudOpsDel
} CloudOps;

typedef void(^CloudServiceCompletion)(BOOL success, NSArray<Student *> *students);


@interface CloudService : NSObject

+(instancetype)shared;

- (void)enqueueOperation:(CloudServiceCompletion)completion;
- (void)enqueueOperation:(CloudOps)operation student: (Student *)student completion:(CloudServiceCompletion)completion;



@end
