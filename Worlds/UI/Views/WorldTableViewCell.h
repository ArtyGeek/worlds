//
//  WorldTableViewCell.h
//  Copyright © 2016 ArtyGeek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WorldTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *countryLabel;
@property (weak, nonatomic) IBOutlet UILabel *languageLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@end
