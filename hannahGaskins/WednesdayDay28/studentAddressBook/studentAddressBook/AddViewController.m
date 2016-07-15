//
//  AddViewController.m
//  studentAddressBook
//
//  Created by hannah gaskins on 7/13/16.
//  Copyright © 2016 hannah gaskins. All rights reserved.
//

#import "AddViewController.h"
#import "Student+Extension.h"
#import "Store.h"

@interface AddViewController ()

@property (strong, nonatomic) Student *student;

@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;

- (IBAction)saveButtonSelected:(UIButton *)sender;

@end

@implementation AddViewController

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

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)showAlertView
{
    NSString *title = @"Err...";
    NSString *message = @"please fill out all required info.";
    
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:title
                                                                        message:message
                                                                 preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    
    // add action to controller
    [controller addAction:okAction];
    [self presentViewController:controller animated:YES completion:nil];
}

- (IBAction)saveButtonSelected:(UIButton *)sender
{
    self.student.firstName = self.firstNameField.text;
    self.student.lastName = self.lastNameField.text;
    self.student.email = self.emailField.text;
    self.student.phone = self.phoneField.text;
    
    if (self.student.isValid && self.completion) {
        [[Store shared]add:self.student completion:^{
            [self completion]();
            [self.navigationController popViewControllerAnimated:YES];
        }];
    }
    
    else {
        [self showAlertView];
    }
}
@end