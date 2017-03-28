//
//  User.m
//  Copyright © 2016 ArtyGeek. All rights reserved.
//

#import "User.h"
#import <SAMKeychain.h>

NSString *const kServiceName = @"com.artygeek.keychain";

@implementation User

@synthesize userName = _userName, password = _password;

+ (id)sharedUser {
    static id sharedUser = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedUser = [[self alloc] init];
    });
    return sharedUser;
}

/*
 Saving username and password to keychain in case we'll need to fetch data from server after being logged in
 */
- (void)setUsername:(NSString *)userName password:(NSString *)password {
    [self clear];
    _userName = userName;
    _password = password;
    
    [SAMKeychain setPassword:password
                  forService:kServiceName
                     account:userName];
}

- (NSString *)userName {
    if (!_userName) {
        _userName = [self fetchAccountName];
    }
    
    return _userName;
}

- (NSString *)password {
    if (!_password) {
        _password = [SAMKeychain passwordForService:kServiceName account:self.userName];
    }
    return _password;
}

- (void)clear {
    _userName = nil;
    _password = nil;
    NSString *accountName = [self fetchAccountName];
    [SAMKeychain deletePasswordForService:kServiceName account:accountName];
}

#pragma makr - Helpers

- (NSString *)fetchAccountName {
    NSArray *accounts = [SAMKeychain accountsForService:kServiceName];
    NSString *accountName = nil;
    if (accounts.count > 0) {
        NSDictionary *account = [accounts firstObject];
        accountName = account[kSAMKeychainAccountKey];
    }
    return accountName;
}

@end
