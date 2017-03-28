//
//  NSString+Validation.m
//  Copyright © 2016 ArtyGeek. All rights reserved.
//

#import "NSString+Validation.h"

@implementation NSString (Validation)

- (BOOL)isEmpty {
    NSString *regExPattern = @"^\\s*$";
    NSRegularExpression *regExp = [NSRegularExpression regularExpressionWithPattern:regExPattern
                                                                            options:NSRegularExpressionCaseInsensitive
                                                                              error:nil];
    NSTextCheckingResult *match = [regExp firstMatchInString:self options:0 range:NSMakeRange(0, [self length])];
    return (match != nil);
}

@end
