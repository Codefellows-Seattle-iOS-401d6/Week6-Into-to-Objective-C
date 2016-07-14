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
- (IBAction)saveButton:(UIButton *)sender;


@end

@implementation InputViewController

+ (NSString *)identifier {
    return NSStringFromClass(self);
}

- (Student *)student {
    if (!_student) {
        _student = [[Student alloc]init];
    }
    
    return _student;
}

- (void)viewDidLoad{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

- (IBAction)saveButton:(UIButton *)sender {
    self.student.firstName = self.firstNameField.text;
    self.student.lastName = self.lastNameField.text;
    self.student.email = self.emailField.text;
    self.student.course = self.courseField.text;
    
    if (self.student.isValid && self.completion) {
        [[Store shared]add:self.student completion:^{
            [self completion]();
            [self.navigationController popViewControllerAnimated:YES];
        }];
    } else {
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"Error"
                                      message:@"Please fill out all fields and ensure you have a valid email Address"
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* confirm = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
        
        [alert addAction:confirm];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

@end
