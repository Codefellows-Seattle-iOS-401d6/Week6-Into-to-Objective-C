//
//  MyProtocol.h
//  Homework1Week6
//
//  Created by Olesia Kalashnik on 7/11/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

#import <Foundation/Foundation.h>

//Task3
@protocol MyProtocol <NSObject>

@required
- (void)print;
- (NSObject)reverse;
- (NSObject)count;

@optional
- (id)append:(id);

@end
