//
//  CloudService.m
//  PeopleList
//
//  Created by Derek Graham on 7/14/16.
//  Copyright © 2016 Derek Graham. All rights reserved.
//

@import CloudKit;
#import "CloudService.h"
#import "Student.h"
#import "Student+Extensions.h"

static NSString *const StudentRecordType = @"Student";

@interface CloudService ()

@property (strong, nonatomic) CKContainer *container;
@property (strong, nonatomic) CKDatabase *database;

@end

@implementation CloudService

+ (instancetype)shared
{
    static CloudService *shared;
    
    static dispatch_once_t onceToken;
dispatch_once(&onceToken, ^{
    shared = [[[self class]alloc]init];
});
    return shared;

}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _container = [CKContainer defaultContainer];
        _database = [_container privateCloudDatabase];
    }
    return self;
}




- (void)enqueueOperation:(CloudServiceCompletion)completion
{
    [self get: completion];
}

- (void)enqueueOperation:(CloudOps)operation student:(Student *)student completion:(CloudServiceCompletion)completion
{
    if (operation == CloudOpsSave) {
        [self save:student completion:completion];
    }
    if (operation == CloudOpsGet)
    {
        [self get: completion];
    }
    
    if (operation == CloudOpsDel) {
        [self delete: student completion:completion];
    }
}
#pragma mark - Helper Methods

- (void)get:(CloudServiceCompletion)completion
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"TRUEPREDICATE"];
    CKQuery *query = [[CKQuery alloc]initWithRecordType:StudentRecordType predicate:predicate];
    
    [self.database performQuery:query inZoneWithID:nil completionHandler:^(NSArray<CKRecord *> * _Nullable results, NSError * _Nullable error) {
        
        
        [Student studentsFromRecords:results completion:^(NSArray<Student *> *students) {
            completion(YES, students);
        }];
        
    }];
}

- (void)save:(Student *)student completion:(CloudServiceCompletion)completion
{
    CKRecord *record = [[CKRecord alloc]initWithRecordType:StudentRecordType];
    record[@"firstName"] = student.firstName;
    record[@"lastName"] = student.lastName;

    record[@"email"] = student.email;

    record[@"phone"] = student.phone;

    [self.database saveRecord:record completionHandler:^(CKRecord * _Nullable record, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error saving to CloudKit. Error: %@", [error localizedDescription]);
        }
        
        if (!error && record) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(YES, @[student]);
            });
        }
    }];
}

- (void)delete:(Student *)student completion:(CloudServiceCompletion)completion
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"email == %@", student.email ];
        
    CKQuery *query = [[CKQuery alloc]initWithRecordType:StudentRecordType predicate:predicate];
        [self.database performQuery:query inZoneWithID:nil
                  completionHandler:^(NSArray<CKRecord *> * _Nullable results, NSError * _Nullable error) {
                      
                      if (results && !error) {
                          for (CKRecord *record in results ) {
                              [self.database deleteRecordWithID:record.recordID completionHandler:^(CKRecordID * _Nullable recordID, NSError * _Nullable error) {
                                  
                                  if(error) {
                                      NSLog(@"Error deleting student recoard. error: %@", [error localizedDescription]);
                                  }
                                  else {
                                      [[NSOperationQueue mainQueue]addOperationWithBlock:^{
                                          completion(YES,@[student]) ;
                                      }];
                                  }
                              }];
                          }
                      }
                  }];
}

@end
