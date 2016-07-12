//
//  Employee.h
//  LabClass1Week6
//
//  Created by Erin Roby on 7/11/16.
//  Copyright © 2016 Erin Roby. All rights reserved.
//

#import "Person.h"

@interface Employee : Person

{
    NSString *_title;
}

- (void)setTitle:(NSString *)title;
- (NSString *)title;

@end
