//
//  PersonProtocol.h
//  Class-26-Lab
//
//  Created by Sung Kim on 7/11/16.
//  Copyright © 2016 Sung Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PersonProtocol <NSObject>

@required
-(void)eyeCount;

@optional
-(void)employmentStatus;
@end
