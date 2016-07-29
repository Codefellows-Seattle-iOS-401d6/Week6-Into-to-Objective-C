//
//  Person.h
//  Monday
//
//  Created by Jessica Malesh on 7/11/16.
//  Copyright © 2016 Jess Malesh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString *_firstName;
    NSString *_lastName;
    
    
}

- (instancetype)initWith: (NSString *)firstName lastName: (NSString *)lastName;

- (void)setFirstName: (NSString *)firstName;
- (NSString *)firstName;

- (void)setLastName: (NSString *)lastName;
- (NSString *)lastName;


@end

@interface Employee : Person
{
    NSString *_jobTitle;
    
}

- (instancetype)initWith: (NSString *)jobTitle;

- (void)setJobTitle: (NSString *)jobTitle;
- (NSString *)jobTitle;

@end