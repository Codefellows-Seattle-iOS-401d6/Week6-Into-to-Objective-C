//
//  InputViewController.h
//  WednesdayObjCTablesLab
//
//  Created by Rick  on 7/13/16.
//  Copyright © 2016 Rick . All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^InputViewControllerCompletion)();

@interface InputViewController : UIViewController
@property (copy, nonatomic) InputViewControllerCompletion completion;

+ (NSString *)identifier;

@end
