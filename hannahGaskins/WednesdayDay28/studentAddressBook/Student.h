//
//  Student.h
//  studentAddressBook
//
//  Created by hannah gaskins on 7/13/16.
//  Copyright © 2016 hannah gaskins. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Student : NSObject
{
    // 4 variables defined here
    NSString *_firstName;
    NSString *_lastName;
    NSString *_email;
    NSString *_phone;
}

#pragma mark - Designated Initializer

- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName
                            email:(NSString *)email
                            phone:(NSString *)phone;

#pragma mark  - setters/getters

- (void)setFirstName:(NSString *)firstName;
- (NSString *)firstName;

- (void)setLastName:(NSString *)lastName;
- (NSString *)lastName;

- (void)setEmail:(NSString *)email;
- (NSString *)email;

- (void)setPhone:(NSString *)phone;
- (NSString *)phone;

@end
