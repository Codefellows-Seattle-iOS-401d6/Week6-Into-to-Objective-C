//
//  AddViewController.h
//  StudentsDirectory
//
//  Created by Sung Kim on 7/13/16.
//  Copyright © 2016 Sung Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^AddViewControllerCompletion)();

@interface AddViewController : UIViewController

@property (copy, nonatomic) AddViewControllerCompletion completion;

+ (NSString *)identifier;

@end
