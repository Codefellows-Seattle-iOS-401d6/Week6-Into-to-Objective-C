//
//  Student+Extension.m
//  StudentsDirectory
//
//  Created by Sung Kim on 7/13/16.
//  Copyright © 2016 Sung Kim. All rights reserved.
//

#import "Student+Extension.h"
#import "NSString+Extension.h"

@implementation Student (Extension)

//if array is nil and empty we do nothing
+ (void)studentsFromRecords:(NSArray<CKRecord *> *)records completion:(StudentCompletion)completion
{
    //if array is nil and empty we do nothing
    if (!records || records.count == 0) {
        completion(nil);
    }
    //conversion from CKRecord to Student record will happen on the background thread, then we return to the main thread
    else {
        [[[NSOperationQueue alloc]init]addOperationWithBlock:^{
            //initialize the Student array (record)
            NSMutableArray *students = [[NSMutableArray alloc]init];
            //convert one record at a time
            for (CKRecord *record in records) {
                //getting data from the CKRecords
                NSString *firstName = record[@"firstName"];
                NSString *lastName = record[@"lastName"];
                NSString *email = record[@"email"];
                NSString *phone = record[@"phone"];
                
                //initialize a student with the retrieved properties
                Student *student = [[Student alloc]initWithFirstName:firstName lastName:lastName email:email phone:phone];
                
                //add the student object to the students record
                [students addObject:student];
            }
            //go back to the main queue with a completion passing in our students record
            [[NSOperationQueue mainQueue]addOperationWithBlock:^{
                completion(students);
            }];
        }];
    }
}

- (BOOL)isValid
{
    if (self.firstName.length > 0 && self.lastName.length > 0 && self.email.isValidEmail) {
        return YES;
    }
    else {
        return NO;
    }
}

@end
