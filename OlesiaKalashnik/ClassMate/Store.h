//
//  Store.h
//  ClassMate
//
//  Created by Olesia Kalashnik on 7/13/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

@import Foundation;
@class Student;

typedef void(^StoreComp)();

@interface Store : NSObject

+ (instancetype)shared;

- (NSArray *)allStudents;
- (Student *)studentForIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)count;
-(void)addStudentsFromCloud:(NSArray *)students;

- (void)add:(Student *)student completion:(StoreComp)completion;
- (void)remove:(Student *)student completion:(StoreComp)completion;
- (void)removeAtIndexPath:(NSIndexPath *)indexPath completion:(StoreComp)completion;
- (void) save;


@end