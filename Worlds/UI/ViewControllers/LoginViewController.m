//
//  LoginViewController.m
//  Copyright © 2016 ArtyGeek. All rights reserved.
//

#import "LoginViewController.h"
#import "APILoginService.h"
#import "WorldAPIModel.h"
#import "UserAPIModel.h"
#import "User.h"
#import "NSString+Validation.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@property (nonatomic, weak) APILoginService *apiService;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fillLogin];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fillLogin {
    User *user = [User sharedUser];
    _nameField.text = user.userName;
    _passwordField.text = user.password;
}

#pragma mark - IBActions

- (IBAction)onLoginButtonTap:(id)sender {
    NSString *userName = _nameField.text;
    NSString *password = _passwordField.text;
    
    if ([userName isEmpty] || [password isEmpty]) {
        [self showAlertWithTitle:nil message:@"Please fill all fields"];
        return;
    }
    
    [self loginWithUsername:userName password:password];
}

#pragma mark - Private methods

- (void)loginWithUsername:(NSString *)userName password:(NSString *)password {
    [[APILoginService sharedService] POSTWorldsWithLogin:userName password:password success:^(UserAPIModel *_Nonnull receivedUser) {
        
        User *user = [User sharedUser];
        [user setUsername:userName password:password];
        [user setAvailableWorlds:receivedUser.availableWorlds];
        
        [self performSegueWithIdentifier:@"segueToWorlds" sender:self];
        
    } failure:^(NSError * _Nonnull error, APIResponseStatus status) {
        [self showAlertWithTitle:@"Error" message:error.localizedDescription];
    }];
}

#pragma mark - Helpers

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message {
    [[[UIAlertView alloc] initWithTitle:title
                                message:message
                               delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil]
     show];
}

@end
