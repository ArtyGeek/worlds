//
//  WorldAPIModel.h
//  Copyright © 2016 ArtyGeek. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface WorldStatus : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSString *statusDescription;
@property (nonatomic, copy, readonly) NSString *id;

@end

@interface WorldAPIModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSString *country;
@property (nonatomic, copy, readonly) NSString *id;
@property (nonatomic, copy, readonly) NSString *language;
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSURL *mapURL;
@property (nonatomic, strong, readonly) WorldStatus *status;

@end
