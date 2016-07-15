//
//  Person.h
//  hannahGaskinsObjCPractice
//
//  Created by hannah gaskins on 7/11/16.
//  Copyright © 2016 hannah gaskins. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

{
    float _height;
    float _weight;
}

// setters/getters for Person

-(void)setHeight:(float)height; //setter
-(float)height; // getter

-(void)setWeight:(float)weight;
-(float)weight;

@end