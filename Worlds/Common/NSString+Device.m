//
//  NSString+Device.m
//  Copyright © 2016 ArtyGeek. All rights reserved.
//

#import "NSString+Device.h"

@implementation NSString (Device)

+ (NSString *)deviceType {
    return [NSString stringWithFormat:@"%@ - %@ %@", [[UIDevice currentDevice] model], [[UIDevice currentDevice] systemName], [[UIDevice currentDevice] systemVersion]];
}

+ (NSString *)deviceId {
    return [[NSUUID UUID] UUIDString];
}

@end
