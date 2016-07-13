//
//  AddViewController.h
//  Classmates
//
//  Created by Jessica Malesh on 7/13/16.
//  Copyright © 2016 Jess Malesh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^AddViewControllerCompletion)();

@interface AddViewController : UIViewController

@property (copy, nonatomic) AddViewControllerCompletion completion;

+ (NSString *)identifier;

@end
