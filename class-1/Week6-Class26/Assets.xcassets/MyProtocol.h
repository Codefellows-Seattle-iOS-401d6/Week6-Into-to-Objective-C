//
//  MyProtocol.h
//  Week6-Class26
//
//  Created by Sean Champagne on 7/11/16.
//  Copyright © 2016 Sean Champagne. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MyProtocol <NSObject>

@required
-(void)doThisThing;

@optional
-(void)maybeDoThisThing;

@end
