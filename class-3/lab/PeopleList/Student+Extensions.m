//
//  Student+Extensions.m
//  PeopleList
//
//  Created by Derek Graham on 7/13/16.
//  Copyright © 2016 Derek Graham. All rights reserved.
//

#import "Student+Extensions.h"
#import "NSString+Extension.h"

@implementation Student (Extensions)

+ (void)studentsFromRecords: (NSArray<CKRecord *> *)records completion:(StudentCompletion)completion;
{
    if (!records || records.count == 0){
        completion(nil);
    } else {
        [[[NSOperationQueue alloc]init]addOperationWithBlock:^{
            
            
            NSMutableArray *students = [[NSMutableArray alloc]init];
            
            for (CKRecord *record in records) {
                NSString *firstName = record[@"firstName"];
                NSString *lastName = record[@"lastName"];
                NSString *email = record[@"email"];
                NSString *phone = record[@"phone"];
                
                [students addObject: [[Student alloc]initWithFirstName:firstName lastName:lastName email:email phone:phone]];
                
            }
            
            [[NSOperationQueue mainQueue]addOperationWithBlock:^{
                completion(students);
            }];
        }];

    }
    
    
}

- (BOOL)isValid
{
    if (self.firstName.length > 0 && self.lastName.length > 0 && self.email.isValidEmail)
    {
        return YES;
    } else
    {
        return NO;
       }
    
   
}


@end
