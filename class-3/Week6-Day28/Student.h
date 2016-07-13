//
//  Student.h
//  Week6-Day28
//
//  Created by Sean Champagne on 7/13/16.
//  Copyright © 2016 Sean Champagne. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
{
    NSString *_firstName;
    NSString *_lastName;
    NSString *_email;
    NSString *_phone;
}

@property (strong, nonatomic) NSString *firstName;

#pragma mark - designated initializer.

-(instancetype)initWithFirstName:(NSString *)firstName
                        lastName:(NSString *)lastName
                           email:(NSString *)email
                           phone:(NSString *)phone;

#pragma mark - Setters/Getters

- (void)setFirstName:(NSString *)firstName;
- (NSString *)firstName;

- (void)setLastName:(NSString *)lastName;
- (NSString *)lastName;

- (void)setEmail:(NSString *)email;
- (NSString *)email;

- (void)setPhone:(NSString *)phone;
- (NSString *)phone;

@end
