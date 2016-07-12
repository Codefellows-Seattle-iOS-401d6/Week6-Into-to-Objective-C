//
//  Person.h
//  Homework1Week6
//
//  Created by Olesia Kalashnik on 7/11/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

#import <Foundation/Foundation.h>

//Task4
@interface Person : NSObject
@property (copy, nonatomic, nonnull) NSString *firstName;
@property (copy, nonatomic, nonnull) NSString *lastName;

- (nonnull instancetype)initWithName:(nonnull NSString *)name surname: (nonnull NSString *) surname;

@end
