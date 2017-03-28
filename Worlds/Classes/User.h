//
//  User.h
//  Copyright © 2016 ArtyGeek. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WorldAPIModel;

@interface User : NSObject

+ (id)sharedUser;

@property (nonatomic, strong, readonly) NSString *userName;
@property (nonatomic, strong, readonly) NSString *password;

@property (nonatomic, strong) NSArray<WorldAPIModel *> *availableWorlds;

- (void)setUsername:(NSString *)userName password:(NSString *)password;
- (void)clear;

@end
