//
//  Store.h
//  Classmates
//
//  Created by Erin Roby on 7/13/16.
//  Copyright © 2016 Erin Roby. All rights reserved.
//


@import UIKit;
@class Student;

typedef void(^StoreCompletion)();

@interface Store : NSObject

+ (instancetype)shared;

- (void)addStudentfromCloudKit:(NSArray *)students;

- (NSArray *)allStudents;
- (Student *)studentForIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)count;

-(void)add:(Student *)student completion:(StoreCompletion)completion;
-(void)remove:(Student *)student completion:(StoreCompletion)completion;
-(void)removeStudentAtIndexPath:(NSIndexPath *)indexPath completion:(StoreCompletion)completion;
-(void)save;

@end
