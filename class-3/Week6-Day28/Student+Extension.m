//
//  Student+Extension.m
//  Week6-Day28
//
//  Created by Sean Champagne on 7/13/16.
//  Copyright © 2016 Sean Champagne. All rights reserved.
//

#import "Student+Extension.h"
#import "NSString+Extension.h"

@implementation Student (Extension)

-(BOOL)isValid
{
    if (self.firstName.length > 0 && self.lastName.length > 0 && self.email.isValidEmail)
    {
        return YES;
    } else {
        return NO;
    }
}

@end
