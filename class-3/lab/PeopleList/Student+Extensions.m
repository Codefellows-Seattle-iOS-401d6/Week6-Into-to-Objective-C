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
