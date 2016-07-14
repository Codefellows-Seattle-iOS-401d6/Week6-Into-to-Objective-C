//
//  InputViewController.m
//  WednesdayObjCTablesLab
//
//  Created by Rick  on 7/13/16.
//  Copyright © 2016 Rick . All rights reserved.
//

#import "InputViewController.h"
#import "Student+Extension.h"
#import "Store.h"

@interface InputViewController ()
@property (strong, nonatomic) Student *student;

@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *courseField;
- (IBAction)saveButton:(id)sender;


@end

@implementation InputViewController

+ (NSString *)identifier {
    return NSStringFromClass(self);
}

- (IBAction)saveButton:(id)sender {
}
@end
