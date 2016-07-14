//
//  SavantProtocol.h
//  week6-day1-lab
//
//  Created by Derek Graham on 7/11/16.
//  Copyright © 2016 Derek Graham. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SavantProtocol <NSObject>

@required
//- (void) spewTypeFromID;
- (void) spewTypeFromID: (id)spewType;

@optional
- (void) talk;
- (void) recitePi;

@end
