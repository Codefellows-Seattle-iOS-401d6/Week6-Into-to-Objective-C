//
//  Student+Extension.m
//  ClassMate
//
//  Created by Olesia Kalashnik on 7/13/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

#import "Student+Extension.h"
#import "NSString+Extension.h"

@implementation Student (Extension)

-(BOOL)isValid {
    return (self.name.length > 0 && self.surname.length > 0 && self.email.isValidEmail);
}

@end
