//
//  AddViewController.m
//  StudentsDirectory
//
//  Created by Sung Kim on 7/13/16.
//  Copyright © 2016 Sung Kim. All rights reserved.
//

#import "AddViewController.h"
#import "Student.h"
#import "Student+Extension.h"
#import "Store.h"

@interface AddViewController ()

@property (strong, nonatomic) Student *student;

@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;

- (IBAction)saveSelected:(UIButton *)sender;

@end

@implementation AddViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

+ (NSString *)identifier
{
    return NSStringFromClass(self);
}

- (Student *)student
{
    if (!_student) {
        _student = [[Student alloc]init];
    }
    return _student;
}

//providing feedback to the user when they do not fill out all the fields
- (void)showAlertView
{
    NSString *title = @"Err...";
    NSString *message = @"Please fill out all required information.";
    
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:title
                                                                        message:message
                                                                 preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault
                                                     handler:nil];
    [controller addAction:okAction];
    [self presentViewController:controller animated:YES completion:nil];
}

- (IBAction)saveSelected:(UIButton *)sender
{
    self.student.firstName = self.firstNameField.text;
    self.student.lastName = self.lastNameField.text;
    self.student.email = self.emailField.text;
    self.student.phone = self.phoneField.text;
    
    
    if (self.student.isValid && self.completion) {
//        [[Store shared]add:self.student];
        [[Store shared]add:self.student completion:^{
            dispatch_async(dispatch_get_main_queue(), ^{
                [self completion]();
                [self.navigationController popViewControllerAnimated:YES];
            });
        }];
    }
    else {
        [self showAlertView];
    }
}
@end
