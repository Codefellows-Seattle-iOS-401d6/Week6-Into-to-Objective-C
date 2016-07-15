//
//  AddViewController.m
//  PeopleList
//
//  Created by Derek Graham on 7/13/16.
//  Copyright © 2016 Derek Graham. All rights reserved.
//

#import "AddViewController.h"
#import "Store.h"
#import "Student+Extensions.h"


@interface AddViewController ()

@property (strong, nonatomic) Student *student;

@property (weak, nonatomic) IBOutlet UITextField *firstNameUserField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameUserField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;

- (IBAction)saveButtonSelected:(id)sender;

@end

@implementation AddViewController

+ (NSString *)identifier
{
    return NSStringFromClass(self);
}

- (Student *)student
{
    if (! _student){
        _student = [[Student alloc]init];
    }
    return _student;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showAlertView
{
    NSString *title = @"Error";
    NSString *message = @"complet the form";
    
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil   ];
    
    [controller addAction:okAction];
    [self presentViewController:controller animated:YES completion:nil];
    
}

- (IBAction)saveButtonSelected:(id)sender {
    self.student.firstName = self.firstNameUserField.text;
    self.student.lastName = self.lastNameUserField.text;
    self.student.email = self.emailField.text;
    self.student.phone = self.phoneField.text;
    
    if (self.student.isValid && self.completion)
    {
        [[Store shared]add:self.student completion:^{
            
            [self completion]();
            [self.navigationController popViewControllerAnimated:YES];
        }];
        
    } else {
        [self showAlertView];
        
    }
    
}
@end











