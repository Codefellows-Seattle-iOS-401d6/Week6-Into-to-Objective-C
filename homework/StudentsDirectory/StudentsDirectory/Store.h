//
//  Store.h
//  StudentsDirectory
//
//  Created by Sung Kim on 7/13/16.
//  Copyright © 2016 Sung Kim. All rights reserved.
//

@import UIKit;
@class Student;

typedef void(^StoreCompletion)();

@interface Store : NSObject

+ (instancetype)shared;

- (void)addStudentsFromCloudKit:(NSArray *)students;

- (NSArray *)allStudents;
- (Student *)studentForIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)count;

//because we communicating with cloudkit -> we should wait for the completion of cloudkit save/remove and then update our local model
- (void)add:(Student *)student completion:(StoreCompletion)completion;
- (void)remove:(Student *)student completion:(StoreCompletion)completion;
- (void)removeStudentAtIndexPath:(NSIndexPath *)indexPath completion:(StoreCompletion)completion;
- (void)save;

@end
