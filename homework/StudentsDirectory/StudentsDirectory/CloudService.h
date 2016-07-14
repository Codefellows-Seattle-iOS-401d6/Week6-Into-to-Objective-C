//
//  CloudService.h
//  StudentsDirectory
//
//  Created by Sung Kim on 7/14/16.
//  Copyright © 2016 Sung Kim. All rights reserved.
//

@import Foundation;
@import CloudKit;
@class Student;

typedef enum : NSUInteger
{
    //by default the value will start at zero, but if you wanted the number to be something else this is how you would assign it and any enum following will be incremented by 1
    CloudOperationSave = 0,
    //CloudOperationRetrieve is now 1
    CloudOperationRetrieve,
    //CloudOperationDelete is now 2
    CloudOperationDelete,
    
}CloudOperation;

typedef void(^CloudServiceCompletion)(BOOL success, NSArray<Student *> *students);

@interface CloudService : NSObject

+ (instancetype)shared;

- (void)enqueueOperation:(CloudServiceCompletion)completion;

- (void)enqueueOperation:(CloudOperation)operation student: (Student *)student completion:(CloudServiceCompletion)completion;



@end
