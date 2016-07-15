//
//  AddViewController.h
//  studentAddressBook
//
//  Created by hannah gaskins on 7/13/16.
//  Copyright © 2016 hannah gaskins. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^AddViewControllerCompletion)();

@interface AddViewController : UIViewController

@property (copy, nonatomic) AddViewControllerCompletion completion;

+ (NSString *)identifier;

@end
