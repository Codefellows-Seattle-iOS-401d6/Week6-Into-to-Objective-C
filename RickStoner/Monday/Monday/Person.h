//
//  Person.h
//  Monday
//
//  Created by Rick  on 7/11/16.
//  Copyright © 2016 Rick . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

{
    NSString *_name;
}

- (instancetype)initWithName: (NSString *)name;

- (void)setName:(NSString *)name;
- (NSString *)name;

- (void)talk;
+ (Person *)person;


@end
