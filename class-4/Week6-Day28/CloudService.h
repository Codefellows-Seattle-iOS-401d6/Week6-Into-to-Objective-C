//
//  CloudService.h
//  Week6-Day28
//
//  Created by Sean Champagne on 7/14/16.
//  Copyright © 2016 Sean Champagne. All rights reserved.
//

@import Foundation;
@import CloudKit;
@class Student;

typedef enum : NSUInteger
{
    CloudOperationSave,
    CloudOperationRetrieve,
    CloudOperationDelete,
} CloudOperation;


typedef void(^CloudServiceCompletion)(BOOL success, NSArray <Student *> *students);

@interface CloudService : NSObject

+ (instancetype)shared;

- (void)enqueueOperation:(CloudServiceCompletion)completion;
- (void)enqueueOperation:(CloudOperation)operation student: (Student *)student completion:(CloudServiceCompletion)completion;

@end
