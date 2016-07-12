//
//  Card.h
//  AddressBook
//
//  Created by Olesia Kalashnik on 7/12/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject {
    //instance variables
    NSString *_name;
    NSString *_lastName;
    NSString *_email;
    NSString *_address;
}

//public properties and methods
-(NSString *)name;
-(NSString *)lastName;
-(NSString *)email;
-(NSString *)address;
-(NSString *)description;
-(void)setName:(NSString *)name;
-(void)setLastName:(NSString *)lastName;
-(void)setEmail:(NSString *)email;
-(void)setAddress:(NSString *)address;

@end
