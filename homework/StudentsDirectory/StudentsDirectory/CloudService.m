//
//  CloudService.m
//  StudentsDirectory
//
//  Created by Sung Kim on 7/14/16.
//  Copyright © 2016 Sung Kim. All rights reserved.
//

#import "CloudService.h"
#import "Student+Extension.h"

//this is the name of my record type on cloudkit, so we are creating a constant that will represent that
static NSString *const StudentRecordType = @"Student";

//extension
@interface CloudService ()

//two things we need in cloudkit, the container and the database -> these need to be initalized with a value in the initializer below
@property (strong, nonatomic) CKContainer *container;
@property (strong, nonatomic) CKDatabase *database;

@end

@implementation CloudService

//creating the singleton
+ (instancetype)shared
{
    static CloudService *shared;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[[self class]alloc]init];
    });
    
    return shared;
}

//this is being initialized above in the [[[self class]alloc]init];
- (instancetype)init
{
    self = [super init];
    //initializing our container and database
    if (self) {
        _container = [CKContainer defaultContainer];
        _database = [_container privateCloudDatabase];
    }
    return self;
}

- (void)enqueueOperation:(CloudServiceCompletion)completion
{
    [self retrieve:completion];
}

- (void)enqueueOperation:(CloudOperation)operation student:(Student *)student completion:(CloudServiceCompletion)completion
{
    if (operation == CloudOperationSave) {
        [self save:student completion:completion];
    }
    
    if (operation == CloudOperationRetrieve) {
        [self retrieve:completion];
    }
    
    if (operation == CloudOperationDelete) {
        [self delete:student completion:completion];
    }
}

#pragma mark - Helper Methods
//these are the helper methods that we will allow users to use in order to interact with the cloudkit

//the following is relatively boilerplate code
- (void)retrieve:(CloudServiceCompletion)completion
{
    //create the predicate
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"TRUEPREDICATE"];
    //create the query
    CKQuery *query = [[CKQuery alloc]initWithRecordType:StudentRecordType
                                              predicate:predicate];
    //execute query on the database
    [self.database performQuery:query
                   inZoneWithID:nil
              completionHandler:^(NSArray<CKRecord *> * _Nullable results, NSError * _Nullable error) {
                  [Student studentsFromRecords:results
                                    completion:^(NSArray<Student *> *students) {
                                        completion(YES, students);
                                    }];
              }];
}

- (void)save:(Student *)student completion:(CloudServiceCompletion)completion
{
    //creating the CKRecord from the student
    CKRecord *record = [[CKRecord alloc]initWithRecordType:StudentRecordType];
    record[@"firstName"] = student.firstName;
    record[@"lastName"] = student.lastName;
    record[@"email"] = student.email;
    record[@"phone"] = student.phone;
    
    //saving to cloudkit....MAYBE check for duplicate email address on save
    [self.database saveRecord:record
            completionHandler:^(CKRecord * _Nullable record, NSError * _Nullable error) {
                if (error) {
                    NSLog(@"Error saving to CloudKit. Error: %@", [error localizedDescription]);
                }
                if (!error && record) {
                    //give some feedback as to WHICH student you just saved
//                    dispatch_async(dispatch_get_main_queue(), ^{
                        completion(YES, @[student]);
//                    });
                }
            }];
}

- (void)delete:(Student *)student completion:(CloudServiceCompletion)completion
{
    //we first must make sure that cloudkit has the object we want to delete. we are using the email address as the identifier
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"email == %@", student.email];
    //create the query
    CKQuery *query = [[CKQuery alloc]initWithRecordType:StudentRecordType
                                               predicate:predicate];
    //execute query onto the database (cloudkit)
    [self.database performQuery:query
                   inZoneWithID:nil
              completionHandler:^(NSArray<CKRecord *> * _Nullable results, NSError * _Nullable error) {
                  //get the record
                  //delete the record
                  if (results && !error) {
                      for (CKRecord *record in results) {
                          [self.database deleteRecordWithID:record.recordID
                                          completionHandler:^(CKRecordID * _Nullable recordID, NSError * _Nullable error) {
                                              if (error) {
                                                  NSLog(@"Error deleting student record. Error: %@", [error localizedDescription]);
                                              }
                                              else {
                                                  //we are going to use this completion to help us delete the student in our model singleton (student record array)
                                                  [[NSOperationQueue mainQueue]addOperationWithBlock:^{
                                                      completion(YES, @[student]);
                                                  }];
                                              }
                                          }];
                      }
                  }
              }];
}


@end
