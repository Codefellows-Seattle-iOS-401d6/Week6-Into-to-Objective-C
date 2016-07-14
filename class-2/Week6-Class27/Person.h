//
//  Person.h
//  Week6-Class27
//
//  Created by Sean Champagne on 7/12/16.
//  Copyright © 2016 Sean Champagne. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

{
    NSString *_name;
    NSString *_email;
}

-(void)setName:(NSString *)name;
-(NSString *)name;

-(void)setEmail:(NSString *)email;
-(NSString *)email;

-(NSString *)description;

@end
