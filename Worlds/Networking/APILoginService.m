//
//  APILoginService.m
//  Copyright © 2016 ArtyGeek. All rights reserved.
//

#import "APILoginService.h"
#import "LoginAPIModel.h"
#import "UserAPIModel.h"
#import "NSString+Device.h"

NSString *const kPathWorlds = @"Server.woa/wa/worlds";

@implementation APILoginService

- (instancetype)init {
    if (self = [super init]) {
        [self.manager setResponseSerializer:[AFPropertyListResponseSerializer new]];
    }
    return self;
}

- (void)POSTWorldsWithLogin:(NSString *)login password:(NSString *)password success:(userHandler)userHandler failure:(errorHandler)failure {
    LoginAPIModel *loginModel = [[LoginAPIModel alloc] init];
    loginModel.login = login;
    loginModel.password = password;
    loginModel.deviceType = [NSString deviceType];
    loginModel.deviceId = [NSString deviceId];
    
    NSDictionary *parameters = [loginModel dictionaryValue];
    
    [self POST:kPathWorlds parameters:parameters success:^(NSDictionary * _Nullable responseObject, APIResponseStatus status) {
        
        NSError *error = nil;
        UserAPIModel *user = [MTLJSONAdapter modelOfClass:[UserAPIModel class] fromJSONDictionary:responseObject error:&error];
        
        if (!error) {
            userHandler(user);
        } else {
            NSLog(@"Error: %@", error.localizedDescription);
            failure(error, status);
        }
        
    } failure:failure];
}

@end
