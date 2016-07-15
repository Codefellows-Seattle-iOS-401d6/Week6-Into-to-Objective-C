//
//  Student.m
//  ClassMate
//
//  Created by Olesia Kalashnik on 7/13/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

#import "Student.h"

@interface Student () <NSCoding>

@end

@implementation Student
- (instancetype)initWithName:(NSString *)name
                     surname:(NSString *)surname
                       email:(NSString *)email
                 phoneNumber:(NSString *)phoneNumber {
    self = [super init];
    if (self) {
        _name = name;
        _surname = surname;
        _email = email;
        _phoneNumber = phoneNumber;
    }
    return self;
}


- (void)setName:(NSString *)name {
    if (_name != name) {
        _name = [name copy];
    }
}

- (NSString *)name {
    return _name;
}
- (NSString *)surname {
    return _surname;
}

- (void)setSurname:(NSString *)surname {
    if (_surname != surname) {
        _surname = [surname copy];
    }
}

- (void)setEmail:(NSString *)email {
    if (_email != email) {
        _email = [email copy];
    }
}

- (NSString *)email {
    return _email;
}

- (void)setPhoneNumber:(NSString *)phoneNumber {
    if (_phoneNumber != phoneNumber) {
        _phoneNumber = [phoneNumber copy];
    }
}

-(NSString *)phoneNumber {
    return _phoneNumber;
}

- (BOOL)isEqual:(Student *)student {
    return [self.email isEqualToString:student.email];
}

//NSCoding
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    NSString * name = [aDecoder decodeObjectForKey:@"name"];
    NSString * surname = [aDecoder decodeObjectForKey:@"surname"];
    NSString * email = [aDecoder decodeObjectForKey:@"email"];
    NSString * phoneNumber = [aDecoder decodeObjectForKey:@"phoneNumber"];
    
    return [self initWithName:name surname:surname email:email phoneNumber:phoneNumber];
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
//    [aCoder encodeObject:self.name forKey:@"name"];
//    [aCoder encodeObject:self.surname forKey:@"surname"];
//    [aCoder encodeObject:self.email forKey:@"email"];
//    [aCoder encodeObject:self.phoneNumber forKey:@"phoneNumber"];
}

@end
