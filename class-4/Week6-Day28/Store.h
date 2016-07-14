//
//  Store.h
//  Week6-Day28
//
//  Created by Sean Champagne on 7/13/16.
//  Copyright © 2016 Sean Champagne. All rights reserved.
//

@import UIKit;
@class Student;

@interface Store : NSObject

typedef void(^StoreCompletion)();

+ (instancetype)shared;

-(NSArray *)allStudents;
-(Student *)studentForIndexPath:(NSIndexPath *)indexPath;
-(NSInteger)count;

-(void)add:(Student *)student completion:(StoreCompletion)completion;
-(void)remove:(Student *)student completion:(StoreCompletion)completion;
-(void)removeStudentAtIndexPath:(NSIndexPath *)indexPath completion:(StoreCompletion)completion;
-(void)addStudentsFromCloudKit:(NSArray *)students;
-(void)save;

@end
