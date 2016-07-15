//
//  CloudService.h
//  ClassMates
//
//  Created by hannah gaskins on 7/14/16.
//  Copyright © 2016 Michael Babiy. All rights reserved.
//

@import Foundation;
@import CloudKit;
@class Student; // forward declaration of Student class

typedef enum : NSUInteger
{
    // defining own enum here
    CloudOperationSave = 0,
    CloudOperationRetreive,
    CloudOperationDelete,
    
}CloudOperation; // CO is the name of the typedef

typedef void(^CloudServiceCompletion)(BOOL success, NSArray<Student *> *students);

@interface CloudService : NSObject

+ (instancetype)shared;

// to retrieve all students
- (void)enqueueOperation:(CloudServiceCompletion)completion;
// to be more specific about ooperation - which operation and which student
- (void)enqueueOperation:(CloudOperation)operation student: (Student *)student completion:(CloudServiceCompletion)completion;


@end
