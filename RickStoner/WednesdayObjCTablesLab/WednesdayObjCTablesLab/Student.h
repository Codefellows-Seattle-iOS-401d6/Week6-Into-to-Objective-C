//
//  Student.h
//  WednesdayObjCTablesLab
//
//  Created by Rick  on 7/13/16.
//  Copyright © 2016 Rick . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

{
    NSString *_firstName;
    NSString *_lastName;
    NSString *_email;
    NSString *_course;
}

#pragma mark - Designated Initializer

- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName
                            email:(NSString *)email
                            course:(NSString *)course;

#pragma mark - Getter/Setters

- (NSString *)firstName;
- (NSString *)lastName;
- (NSString *)email;
- (NSString *)course;

- (void)setFirstName:(NSString *)firstName;
- (void)setLastName:(NSString *)lastName;
- (void)setEmail:(NSString *)email;
- (void)setCourse:(NSString *)course;

@end
