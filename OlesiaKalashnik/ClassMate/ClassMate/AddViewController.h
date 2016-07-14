//
//  AddViewController.h
//  ClassMate
//
//  Created by Olesia Kalashnik on 7/13/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"

typedef void(^AddVCCompletion)();

@interface AddViewController : UIViewController

+ (NSString * )identifier;
@property (copy, nonatomic)AddVCCompletion completion;

@end
