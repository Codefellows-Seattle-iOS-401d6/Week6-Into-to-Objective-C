//
//  Person.h
//  Class-26-Lab
//
//  Created by Sung Kim on 7/11/16.
//  Copyright © 2016 Sung Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSNumber *arms;

//{
//    NSString *_name;
//    NSNumber *_arms;
//    
//}

-(instancetype)initWithNameAndArmCount:(NSString *)name :(NSNumber *)arms;

-(void)talk;
+(BOOL)canBreathe;
+(Person *)person;

@end