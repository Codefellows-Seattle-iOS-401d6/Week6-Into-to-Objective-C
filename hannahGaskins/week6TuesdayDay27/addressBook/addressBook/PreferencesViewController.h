//
//  PreferencesViewController.h
//  addressBook
//
//  Created by hannah gaskins on 7/12/16.
//  Copyright © 2016 hannah gaskins. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PreferencesViewControllerCompletion)();

@interface PreferencesViewController : UIViewController

@property (copy, nonatomic) PreferencesViewControllerCompletion completion;


@end
