//
//  LoginAPIModel.h
//  Copyright © 2016 ArtyGeek. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface LoginAPIModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString *login;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *deviceType;
@property (nonatomic, strong) NSString *deviceId;

@end
