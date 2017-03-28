//
//  UserAPIModel.h
//  Copyright © 2016 ArtyGeek. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "WorldAPIModel.h"

@interface UserAPIModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSArray<WorldAPIModel *> *availableWorlds;

@end
