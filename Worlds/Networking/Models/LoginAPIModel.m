//
//  LoginAPIModel.m
//  Copyright © 2016 Andrii Sych. All rights reserved.
//

#import "LoginAPIModel.h"

@implementation LoginAPIModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"login"       : @"login",
             @"password"    : @"password",
             @"deviceType"  : @"deviceType",
             @"deviceId"    : @"deviceId"
             };
}

@end
