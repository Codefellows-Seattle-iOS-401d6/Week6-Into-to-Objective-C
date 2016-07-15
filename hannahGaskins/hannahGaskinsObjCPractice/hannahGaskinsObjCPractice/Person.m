//
//  Person.m
//  hannahGaskinsObjCPractice
//
//  Created by hannah gaskins on 7/11/16.
//  Copyright © 2016 hannah gaskins. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)setHeight:(float)height {
    // check current variable to the param we pass in
    if (_height != height) {
        _height = height;
    }
}
-(float)height {
    return _height;
}

-(void)setWeight:(float)weight {
    if (_weight != weight) {
        _weight = weight;
    }
}
-(float)weight {
    return _weight;
}

-(NSString *)description {
    return @"Person";
}

@end
