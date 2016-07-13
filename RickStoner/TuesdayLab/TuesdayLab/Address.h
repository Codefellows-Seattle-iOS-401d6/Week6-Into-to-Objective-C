//
//  Address.h
//  TuesdayLab
//
//  Created by Rick  on 7/12/16.
//  Copyright © 2016 Rick . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Address : NSObject

{
    NSString *_name;
    NSString *_city;
    NSString *_state;
    
}

- (void)setName:(NSString *)name;
- (void)setCity:(NSString *)city;
- (void)setState:(NSString *)state;

-(NSString *)description;
- (void)dealloc;

@end
