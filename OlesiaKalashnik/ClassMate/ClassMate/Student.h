//
//  Student.h
//  ClassMate
//
//  Created by Olesia Kalashnik on 7/13/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
{
    NSString *_name;
    NSString *_surname;
    NSString *_email;
    NSString *_phoneNumber;
}

-(instancetype)initWithName:(NSString *)name
                    surname:(NSString *)surname
                      email:(NSString *)email
                phoneNumber:(NSString *)phoneNumber;

- (void)setName:(NSString *)name;
- (NSString *)name;
- (void)setSurname:(NSString *)surname;
- (NSString *)surname;
- (void)setEmail:(NSString *)email;
- (NSString *)email;
- (void)setPhoneNumber:(NSString *)phoneNumber;
- (NSString *)phoneNumber;
- (BOOL)isEqual:(Student *)student;
@end
