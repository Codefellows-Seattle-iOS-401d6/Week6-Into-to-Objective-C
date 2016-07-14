//
//  Person.h
//  week6-day1-lab
//
//  Created by Derek Graham on 7/11/16.
//  Copyright © 2016 Derek Graham. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property id personType;

- (instancetype) init: (id *) id;
- (instancetype) initWithString: (NSString *) typeID;
- (instancetype) initWithArray: (NSArray *) typeID;
- (instancetype) initWithNumber: (NSNumber *) typeID;

- (void) printType;


@end
