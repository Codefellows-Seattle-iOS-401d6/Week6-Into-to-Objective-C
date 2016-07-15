//
//  Student+Extension.m
//  studentAddressBook
//
//  Created by hannah gaskins on 7/13/16.
//  Copyright © 2016 hannah gaskins. All rights reserved.
//

#import "Student+Extension.h"
#import "NSString+Extension.h"

@implementation Student (Extension)

+ (void)studentsFromRecords:(NSArray<CKRecord *> *)records completion:(StudentCompletion)completion
{
    //
    if (!records || records.count == 0) {
        completion(nil);
    }
    else {
        //convert from Ckrecod to student on the background
        
        [[[NSOperationQueue alloc]init]addOperationWithBlock:^{
            
            NSMutableArray *students = [[NSMutableArray alloc]init];
            
            // for each CKRecord create own student model object
            for (CKRecord *record in records) {
                
                //
                NSString *firstName = record[@"firstName"];
                NSString *lastName = record[@"lastName"];
                NSString *email = record[@"email"];
                NSString *phone = record[@"phone"];
                
                [students addObject:[[Student alloc]initWithFirstName:firstName lastName:lastName email:email phone:phone]];
            }
            
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
