//
//  Person.h
//  Week6-Class26
//
//  Created by Sean Champagne on 7/11/16.
//  Copyright © 2016 Sean Champagne. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(copy, nonatomic) NSString *name;

-(void)setName:(NSString *)name; //setter
-(NSString *)name; //getter

@end
