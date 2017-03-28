//
//  WorldAPIModel.m
//  Copyright © 2016 ArtyGeek. All rights reserved.
//

#import "WorldAPIModel.h"

@implementation WorldStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"statusDescription" : @"description",
             @"id"                : @"id"
             };
}

@end

@implementation WorldAPIModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"country"  : @"country",
             @"id"       : @"id",
             @"language" : @"language",
             @"name"     : @"name",
             @"mapURL"   : @"mapURL",
             @"status"   : @"worldStatus"
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[WorldStatus class]];
}

@end
