//
//  Person.h
//  MRClecture
//
//  Created by Derek Graham on 7/12/16.
//  Copyright © 2016 Derek Graham. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

{
NSString *_firstName;
NSString *_lastName;
NSString *_email;
}


-(void)setFirstName:(NSString *)firstName;
-(NSString *)firstName;

-(void)setLastName:(NSString *)lastName;
-(NSString *)lastName;

-(void)setEmail:(NSString *)email;
-(NSString *)email;

-(NSString *)getKey;

-(NSString *)description;


@end
