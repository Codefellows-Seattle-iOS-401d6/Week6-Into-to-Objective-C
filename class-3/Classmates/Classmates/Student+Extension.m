//
//  Student+Extension.m
//  Classmates
//
//  Created by Erin Roby on 7/13/16.
//  Copyright © 2016 Erin Roby. All rights reserved.
//

#import "Student+Extension.h"
#import "NSString+Extension.h"

@implementation Student (Extension)

+ (void)studentsFromRecords:(NSArray *)records completion:(StudentCompletion)completion {
    if (!records || records.count == 0) {
        completion(nil);
    } else {
        [[[NSOperationQueue alloc]init]addOperationWithBlock:^{
            NSMutableArray *students = [[NSMutableArray alloc]init];
            for (CKRecord *record in records) {
                NSString *firstName = record[@"firstName"];
                NSString *lastName = record[@"lastName"];
                NSString *email = record[@"email"];
                NSString *phone = record[@"phone"];
               
                // Add new student here:
                
                Student *student = [[Student alloc]initWithFirstName:firstName lastName:lastName email:email phone:phone];
                
                [students addObject:student];
            }
            
            [[NSOperationQueue mainQueue]addOperationWithBlock:^{
                completion(students);
            }];
        }];
    }
}

- (BOOL)isValid {
    if (self.firstName.length > 0 && self.lastName.length > 0 && self.email.isValidEmail) {
        return YES;
    } else {
        return NO;
    }
}

@end
