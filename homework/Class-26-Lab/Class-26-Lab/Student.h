//
//  Student.h
//  Class-26-Lab
//
//  Created by Sung Kim on 7/11/16.
//  Copyright © 2016 Sung Kim. All rights reserved.
//

#import "Person.h"

@interface Student : Person

@property (copy) NSString *school;

-(instancetype)initWithNameAndSchool:(NSString *)name :(NSString *)school;

-(void)attending;


@end
