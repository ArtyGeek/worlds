//
//  APIServiceProtocol.h
//  Copyright © 2016 ArtyGeek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import <Mantle.h>

typedef NS_ENUM(NSInteger, APIResponseStatus) {
    APIResponseStatusOK,
    APIResponseStatusUnauthorized,
    APIResponseStatusBadRequest,
    APIResponseStatusNotFound,
    APIResponseStatusInternalServerError,
    APIResponseStatusUnknown
};

typedef void(^successHandler)(NSDictionary * _Nullable responseObject, APIResponseStatus status);
typedef void(^errorHandler)(NSError * _Nonnull error, APIResponseStatus status);

@protocol APIServiceProtocol <NSObject>

- (void)POST:(NSString * _Nonnull)URLString parameters:(NSDictionary * _Nullable)parameters success:(_Nonnull successHandler)success failure:(_Nonnull errorHandler)failure;

@end
