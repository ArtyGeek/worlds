//
//  UserAPIModel.m
//  Copyright © 2016 ArtyGeek. All rights reserved.
//

#import "UserAPIModel.h"

@implementation UserAPIModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"availableWorlds" : @"allAvailableWorlds"};
}

+ (NSValueTransformer *)availableWorldsJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[WorldAPIModel class]];
}

@end
