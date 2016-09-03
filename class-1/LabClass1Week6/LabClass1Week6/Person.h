//
//  Person.h
//  LabClass1Week6
//
//  Created by Erin Roby on 7/11/16.
//  Copyright © 2016 Erin Roby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

{
    NSString *_name;
}

- (instancetype)initWithName:(NSString *)name;

- (void)setName:(NSString *)name;
- (NSString *)name;

+ (Person *)person;

@end
