//
//  CloudService.m
//  WednesdayObjCTablesLab
//
//  Created by Rick  on 7/14/16.
//  Copyright © 2016 Rick . All rights reserved.
//

#import "CloudService.h"
#import "Student+Extension.h"

static NSString *const StudentRecordType = @"Student";

@interface CloudService()

@property (strong, nonatomic) CKContainer *container;
@property (strong, nonatomic) CKDatabase *database;

@end


@implementation CloudService

+ (instancetype)shared{
    static CloudService *shared;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[[self class]alloc]init];
    });
    return shared;
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _container = [CKContainer defaultContainer];
        _database = [_container privateCloudDatabase];
    }
    return self;
}

- (void)enqueueOperation:(CloudServiceCompletion)completion{
    
}

-(void)enqueueOperation:(CloudOperation)operation student:(Student *)student completion:(CloudServiceCompletion)completion {
    
}

#pragma Mark - Helper Functions

- (void)save:(Student *)student completion:(CloudServiceCompletion)completion{
    CKRecord *record = [[CKRecord alloc]initWithRecordType:StudentRecordType];
    record[@"firstName"] = student.firstName;
    record[@"lastName"] = student.lastName;
    record[@"email"] = student.email;
    record[@"course"] = student.course;
    
    [self.database saveRecord:record completionHandler:^(CKRecord * _Nullable record, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error saving to Cloudkit. Error %@", [error localizedDescription]);
        }
        if (!error && record) {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(YES, @[student]);
            });
        }
    }];
}

- (void)delete:(Student *)student completion:(CloudServiceCompletion)completion {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"email == %@", student.email];
    CKQuery *query = [[CKQuery alloc]initWithRecordType:StudentRecordType predicate:predicate];
    
    [self.database performQuery:query inZoneWithID:nil completionHandler:^(NSArray<CKRecord *> * _Nullable results, NSError * _Nullable error) {
        if (results && !error) {
            for (CKRecord *record in results) {
                [self.database deleteRecordWithID:record.recordID completionHandler:^(CKRecordID * _Nullable recordID, NSError * _Nullable error) {
                    if (error) {
                        NSLog(@"Error deleting student record.  Error: %@", [error localizedDescription]);
                    }
                    
                    else {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            completion(YES, @[student]);
                        });
                    }
                }];
            }
        }
    }];
}

- (void)retrieve:(CloudServiceCompletion)completion; {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"TRUECREDIT"];
    CKQuery *query = [[CKQuery alloc]initWithRecordType:StudentRecordType predicate:predicate];
    
    [self.database performQuery:query inZoneWithID:nil completionHandler:^(NSArray<CKRecord *> * _Nullable results, NSError * _Nullable error) {
        [Student studentsFromRecords:results completion:^(NSArray<Student *> *students) {
            completion(YES, students);
        }];
    }];
}

@end
