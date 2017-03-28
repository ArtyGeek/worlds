//
//  APINetworkingService.h
//  Copyright © 2016 ArtyGeek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIServiceProtocol.h"

@interface APINetworkingService : NSObject <APIServiceProtocol>

+ (id)sharedService;

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end
