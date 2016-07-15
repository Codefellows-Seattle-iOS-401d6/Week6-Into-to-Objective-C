//
//  CloudService.h
//  Classmates
//
//  Created by Jessica Malesh on 7/14/16.
//  Copyright © 2016 Jess Malesh. All rights reserved.
//

@import Foundation;
@import CloudKit;
@class Student;



typedef enum : NSUInteger
{
    CloudOperationSave = 0,
    CloudOperationRetrive,
    CloudOperationDelete,
    
} CloudOperation;

typedef void(^CloudServiceCompletion)(BOOL success, NSArray<Student *> *students);

@interface CloudService : NSObject

+ (instancetype)shared;

//helper to retrieve all students from cloudkit
- (void)enqueueOperation:(CloudServiceCompletion)completion;
- (void)enqueueOperation:(CloudOperation)operation student: (Student *)student completion:(CloudServiceCompletion)completion;





@end
