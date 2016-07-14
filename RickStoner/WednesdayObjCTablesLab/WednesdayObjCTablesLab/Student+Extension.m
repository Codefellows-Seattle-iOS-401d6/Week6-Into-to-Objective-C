//
//  Student+Extension.m
//  WednesdayObjCTablesLab
//
//  Created by Rick  on 7/13/16.
//  Copyright © 2016 Rick . All rights reserved.
//

#import "Student+Extension.h"
#import "NSString+Extension.h"

@implementation Student (Extension)

+(void)studentsFromRecords:(NSArray<CKRecord *> *)records completion:(StudentCompletion)completion {
    if (!records || records.count == 0) {
        completion(nil);
    } else {
        [[[NSOperationQueue alloc]init]addOperationWithBlock:^{
            NSMutableArray *students = [[NSMutableArray alloc]init];
            for (CKRecord *record in records) {
                NSString *firstName = record[@"firstName"];
                NSString *lastName = record[@"lastName"];
                NSString *email = record[@"email"];
                NSString *course = record[@"course"];
                
                [students addObject:[[Student alloc]initWithFirstName:firstName lastName:lastName email:email course:course]];
            }
            [[NSOperationQueue mainQueue]addOperationWithBlock:^{
                completion(students);
            }];
        }];
    }
}

- (BOOL)isValid //verifies user input of email, first name, and last name
{
    if (self.firstName.length > 0 && self.lastName.length > 0 && self.email.isValidEmail) {
        return YES;
    }
    
    else {
        return NO;
    }
}


@end
