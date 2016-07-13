//
//  AddViewController.m
//  PeopleList
//
//  Created by Derek Graham on 7/13/16.
//  Copyright © 2016 Derek Graham. All rights reserved.
//

#import "AddViewController.h"
#import "Student.h"
#import "Store.h"


@interface AddViewController ()

@property (strong, nonatomic) Student *student;

@property (weak, nonatomic) IBOutlet UITextField *firstNameUserField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameUserField;

- (IBAction)saveButtonSelected:(id)sender;

@end

@implementation AddViewController

+ (NSString *)identifier
{
    return NSStringFromClass(self);
}

- (Student *)student{
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveButtonSelected:(id)sender {
    self.student.firstName = self.firstNameUserField.text;
    self.student.lastName = self.lastNameUserField.text;
    self.student.email = self.emailField.text;
    self.student.phone = self.phoneField.text;
    
    if (self.student.isValid && self.completion)
    {
        [[Store shared]add: self.student];
        [self completion];
        
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}
@end











