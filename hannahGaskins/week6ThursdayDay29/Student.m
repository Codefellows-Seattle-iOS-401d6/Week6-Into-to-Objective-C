//
//  Student.m
//  studentAddressBook
//
//  Created by hannah gaskins on 7/13/16.
//  Copyright © 2016 hannah gaskins. All rights reserved.
//

#import "Student.h"

// extending class
@interface Student ()<NSCoding>

@end

@implementation Student

- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName
                            email:(NSString *)email
                            phone:(NSString *)phone;

{
    self = [super init];
    
    if (self) {
        _firstName = firstName;
        _lastName = lastName;
        _email = email;
        _phone = phone;
    }
    return self;
}

- (instancetype)init
{
    return [self initWithFirstName:@"" lastName:@"" email:@"" phone:@""];
}

#pragma mark  - setters/getters

- (void)setFirstName:(NSString *)firstName
{
    if (_firstName != firstName) {
        _firstName = [firstName copy];
    }
}
- (NSString *)firstName
{
    return _firstName;
}

- (void)setLastName:(NSString *)lastName
{
    if (_lastName != lastName) {
        _lastName = [lastName copy];
    }
}
- (NSString *)lastName
{
    return _lastName;
}

- (void)setEmail:(NSString *)email
{
    if (_email != email) {
        _email = [email copy];
    }
}
- (NSString *)email
{
    return _email;
}

- (void)setPhone:(NSString *)phone
{
    if (_phone != phone) {
        _phone = [phone copy];
    }
}
- (NSString *)phone
{
    return _phone;
}


#pragma mark - NSCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    NSString *firstName = [aDecoder decodeObjectForKey:@"firstName"];
    NSString *laststName = [aDecoder decodeObjectForKey:@"lasttName"];
    NSString *email = [aDecoder decodeObjectForKey:@"email"];
    NSString *phone = [aDecoder decodeObjectForKey:@"phone"];

    return [self initWithFirstName:firstName lastName:laststName email:email phone:phone];
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.firstName forKey:@"firstName"];
    [aCoder encodeObject:self.lastName forKey:@"lastName"];
    [aCoder encodeObject:self.email forKey:@"email"];
    [aCoder encodeObject:self.phone forKey:@"phone"];
}
@end
