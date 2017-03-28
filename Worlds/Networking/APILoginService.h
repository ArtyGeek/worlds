//
//  APILoginService.h
//  Copyright © 2016 ArtyGeek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APINetworkingService.h"

@class UserAPIModel;

extern NSString * _Nonnull const kPathWorlds;

typedef void(^userHandler)(UserAPIModel *_Nonnull user);

@interface APILoginService : APINetworkingService

- (void)POSTWorldsWithLogin:(NSString * _Nonnull)login password:(NSString * _Nonnull)password success:(_Nonnull userHandler)userHandler failure:(_Nonnull errorHandler)failure;

@end
