//
//  Store.m
//  PeopleList
//
//  Created by Derek Graham on 7/13/16.
//  Copyright © 2016 Derek Graham. All rights reserved.
//

#import "Store.h"
#import "Student.h"
#import "NSString+Extension.h"
#import "CloudService.h"
@import UIKit;

@interface Store ()

@property (copy, nonatomic) NSMutableArray *students;

@end

@implementation Store

+ (instancetype)shared
{
    static Store *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[[self class]alloc]init];
    });
    return shared;
}

- (instancetype) init
{
    self = [super init];
    if (self) {
        _students = [NSKeyedUnarchiver unarchiveObjectWithData:[NSData dataWithContentsOfFile:[NSString archivePath]]];
        
        if (!_students) {
            _students = [[NSMutableArray alloc] init];
        }
    }
    return self;
}

- (NSArray *)allStudents
{
    return self.students;
}


- (void)addStudentsFromCloudKit:(NSArray *)students
{
    if (students.count == 0 ) {
        self.students = [[NSMutableArray alloc]initWithArray:students];
    } else {
        for (Student *student in students){
            NSString *email = student.email;
            BOOL found = NO;
            for (Student *localStudent in self.students) {
                if ([email compare:localStudent.email] == NSOrderedSame){
                    found = YES;
                    break;
                }
            }
            if (!found){
                [self.students addObject:student];
            }
        }
    }
}
//may return nill
- (Student *)studentForIndexPath:(NSIndexPath *)indexPath
{
    return self.students[indexPath.row];
}

- (NSInteger)count
{
    return self.students.count;
}

- (void)add:(Student *)student completion:(StoreCompletion)completion
{
    if (![self.students containsObject:student]) {
//        
//        [self.students addObject:student];
////        [self save];
        [[CloudService shared] enqueueOperation:CloudOpsSave student:student completion:^(BOOL success, NSArray<Student *> *students) {
            if (success){
                [self.students addObject:student];
                NSLog(@"%@, %@, %@, %@", student.firstName, student.lastName, student.email, student.phone);
                [self save];
                completion();
                
            }
        }];
        
    }
    
    
}

- (void)remove:(Student *)student completion:(StoreCompletion)completion
{
    if ([self.students containsObject:student]) {
        
        [[CloudService shared]enqueueOperation:CloudOpsDel student:student completion:^(BOOL success, NSArray<Student *> *students) {
            if (success) {
                [self.students removeObject:student];
                [self save];
                completion();
            }
        }];
        
//        [self.students removeObject:student];
//        [self save];
    }
}
- (void)removeStudentAtIndexPath:(NSIndexPath *)indexPath completion:(StoreCompletion)completion
{
    
    [self remove:[self studentForIndexPath:indexPath]completion:completion ];
//    [self remove:[self studentForIndexPath:indexPath]];
//    [self save];
}

- (void)save
{
    [NSKeyedArchiver archiveRootObject:self.students toFile:[NSString archivePath]];
    NSLog(@"%@", [NSString archivePath]);
}


@end
