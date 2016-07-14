//
//  Store.m
//  WednesdayObjCTablesLab
//
//  Created by Rick  on 7/13/16.
//  Copyright © 2016 Rick . All rights reserved.
//

#import "Store.h"
#import "Student.h"
#import "NSString+Extension.h"

@interface Store ()

@property (copy, nonatomic) NSMutableArray *students;

@end

@implementation Store

+ (instancetype)shared {
    
    static Store *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[[self class]alloc]init];
    });
    return shared;
}

- (NSArray *)allStudents {
    return self.students;
}

- (NSInteger)count {
    return self.students.count;
}

- (Student *)studentForIndexPath:(NSIndexPath *)indexPath {
    return self.students[indexPath.row];
}


- (instancetype)init {
    self = [super init];
    
    if (self) {  //checks to see if anything is saved in NSKeyArchive, it not creates empty array
        _students = [NSKeyedUnarchiver unarchiveObjectWithData:[NSData dataWithContentsOfFile:[NSString archivePath]]];
        if (!_students) {
            _students = [[NSMutableArray alloc]init];
        }
    }
    return self;
}

- (void)add:(Student *)student {
    if (![self.students containsObject:student]) {
        [self.students addObject:student];
    }
}
- (void)remove:(Student *)student{
    if ([self.students containsObject:student]) {
        [self.students removeObject:student];
    }
}

- (void)removeStudentAtIndexPath:(NSIndexPath *)indexPath {
    [self remove:[self studentForIndexPath:indexPath]];
}

- (void)save { //saves to path determined by NSString extension
    [NSKeyedArchiver archiveRootObject:self.students toFile:[NSString archivePath]];
}

@end