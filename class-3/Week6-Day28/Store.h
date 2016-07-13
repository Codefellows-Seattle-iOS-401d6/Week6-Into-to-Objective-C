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

+ (instancetype)shared;

-(NSArray *)allStudents;
-(Student *)studentForIndexPath:(NSIndexPath *)indexPath;
-(NSInteger)count;

-(void)add:(Student *)student;
-(void)remove:(Student *)student;
-(void)removeStudentAtIndexPath:(NSIndexPath *)indexPath;
-(void)save;

@end
