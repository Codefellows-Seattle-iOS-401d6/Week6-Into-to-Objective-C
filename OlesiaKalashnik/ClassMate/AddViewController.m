//
//  AddViewController.m
//  ClassMate
//
//  Created by Olesia Kalashnik on 7/13/16.
//  Copyright © 2016 Olesia Kalashnik. All rights reserved.
//

#import "AddViewController.h"
#import "Store.h"
#import "Student+Extension.h"
#import "CloudService.h"


@interface AddViewController ()

@property (strong, nonatomic) Student *student;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *surname;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;

- (IBAction)save:(UIButton *)sender;

@end

@implementation AddViewController

+ (NSString *) identifier {
    return NSStringFromClass(self);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor clearColor]];
    UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"texture"]];
    self.view.backgroundColor = [UIColor colorWithPatternImage:backgroundView.image];
    
    self.navigationController.navigationBar.tintColor = [UIColor purpleColor];
    [self.navigationItem.backBarButtonItem setTintColor: [UIColor greenColor]];
    self.saveButton.layer.cornerRadius = 3;
    
}


-(Student *)student {
    if (! _student) {
        _student = [[Student alloc]init];
    }
    return _student;
}

-(void)presentAlert {
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Invalid Contact Information" message:@"Please enter valid contact info" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}


- (IBAction)save:(UIButton *)sender {
    self.student.name = self.name.text;
    self.student.surname = self.surname.text;
    self.student.email = self.email.text;
    self.student.phoneNumber = self.phoneNumber.text;

    
    if (self.student.isValid && self.completion) {
        [[Store shared]add:self.student completion:^{
            [self completion]();
            [self.navigationController popViewControllerAnimated:YES];
        }];
    }
    else {
        [self presentAlert];
    }
}

@end
