//
//  Student.m
//  WednesdayObjCTablesLab
//
//  Created by Rick  on 7/13/16.
//  Copyright © 2016 Rick . All rights reserved.
//

#import "Student.h"

@interface Student() <NSCoding>

@end

@implementation Student

- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName
                            email:(NSString *)email
                            course:(NSString *)course;

{
    self = [super init];
    
    if (self) {
        _firstName = firstName;
        _lastName = lastName;
        _email = email;
        _course = course;
    }
    
    return self;
}

- (NSString *)firstName {
    return _firstName;
}

- (NSString *)lastName {
    return _lastName;
}

- (NSString *)email {
    return _email;
}

- (NSString *)course {
    return _course;
}

- (void)setFirstName:(NSString *)firstName {
    if (_firstName != firstName) {
        _firstName = [firstName copy];
    }
}

- (void)setLastName:(NSString *)lastName {
    if (_lastName != lastName) {
        _lastName = [lastName copy];
    }
}

- (void)setEmail:(NSString *)email {
    if (_email != email) {
        _email = [email copy];
    }
}

- (void)setCourse:(NSString *)course {
    if (_course != course) {
        _course = [course copy];
    }
}

#pragma mark - NSCoding 

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    NSString *firstName = [aDecoder decodeObjectForKey:@"firstName"];
    NSString *lastName = [aDecoder decodeObjectForKey:@"lasttName"];
    NSString *email = [aDecoder decodeObjectForKey:@"email"];
    NSString *course = [aDecoder decodeObjectForKey:@"course"];
    
    return [self initWithFirstName:firstName lastName:lastName email:email course:course];
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.firstName forKey:@"firstName"];
    [aCoder encodeObject:self.lastName forKey:@"lastName"];
    [aCoder encodeObject:self.email forKey:@"email"];
    [aCoder encodeObject:self.course forKey:@"course"];
    
}

@end
