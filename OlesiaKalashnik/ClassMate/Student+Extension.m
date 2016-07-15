//
//  Student+Extension.m
//  ClassMate
//
//  Created by Olesia Kalashnik on 7/13/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

#import "Student+Extension.h"
#import "NSString+Extension.h"
@import CloudKit;

@implementation Student (Extension)

+(void)studentsFromRecords:(NSArray<CKRecord*> *)records completion:(StudentCompletion)completion {
    if (!records || records.count == 0) {
        completion(nil);
    } else {
        [[[NSOperationQueue alloc]init] addOperationWithBlock: ^{
            NSMutableArray *students = [[NSMutableArray alloc]init];
            for (CKRecord *record in records) {
                
                NSString *name = record[@"name"];
                NSString *surname = record[@"surname"];
                NSString *email = record[@"email"];
                NSString *phoneNumber = record[@"phoneNumber"];
                [students addObject:[[Student alloc]initWithName:name surname:surname email:email phoneNumber:phoneNumber]];
            }
            
            [[NSOperationQueue mainQueue]addOperationWithBlock:^{
                completion(students);
            }];
        }];
    }
}

-(BOOL)isValid {
    return (self.name.length > 0 && self.surname.length > 0 && self.email.isValidEmail);
}

@end
