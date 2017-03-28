//
//  APINetworkingService.m
//  Copyright © 2016 ArtyGeek. All rights reserved.
//

#import "APINetworkingService.h"
#import <AFHTTPSessionManager.h>

NSString *const kBaseURL = @"http://backend/WebObjects/";

@implementation APINetworkingService

+ (id)sharedService {
    static id sharedService = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedService = [[self alloc] init];
    });
    return sharedService;
}

- (instancetype)init {
    if (self = [super init]) {
        _manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]];
    }
    return self;
}

#pragma mark - APIServiceProtocol

- (void)POST:(NSString *)URLString parameters:(NSDictionary *)parameters success:(successHandler)successHandler failure:(errorHandler)failureHandler {
    [_manager POST:URLString
        parameters:parameters
          progress:nil
           success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
               
               APIResponseStatus status = [self responseStatusWithTask:task];
               
               if ([responseObject isKindOfClass:[NSDictionary class]]) {
                   successHandler(responseObject, status);
               } else {
                   successHandler(nil, status);
               }
           }
           failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
               APIResponseStatus status = [self responseStatusWithTask:task];
               failureHandler(error, status);
           }];
}

#pragma mark - Private methods

- (APIResponseStatus)responseStatusWithTask:(NSURLSessionTask *)task {
    APIResponseStatus status = APIResponseStatusUnknown;
    
    NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
    if (response) {
        switch (response.statusCode) {
            case 200:
                status = APIResponseStatusOK;
                break;
            case 400:
                status = APIResponseStatusBadRequest;
                break;
            case 401:
                status = APIResponseStatusUnauthorized;
                break;
            case 404:
                status = APIResponseStatusNotFound;
                break;
            case 505:
                status = APIResponseStatusInternalServerError;
                break;
                
            default:
                status = APIResponseStatusUnknown;
                break;
        }
    }
    
    return status;
}

@end
