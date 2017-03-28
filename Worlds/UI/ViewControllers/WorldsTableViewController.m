//
//  WorldsTableViewController.m
//  Copyright © 2016 ArtyGeek. All rights reserved.
//

#import "WorldsTableViewController.h"
#import "WorldTableViewCell.h"
#import "WorldAPIModel.h"
#import "User.h"

@interface WorldsTableViewController ()
@property (nonatomic, weak) NSArray<WorldAPIModel *> *worlds;
@end

@implementation WorldsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _worlds = [[User sharedUser] availableWorlds];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _worlds ? _worlds.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WorldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"worldCell" forIndexPath:indexPath];
    
    if (_worlds) {
        WorldAPIModel *world = _worlds[indexPath.row];
        cell.nameLabel.text = world.name;
        cell.countryLabel.text = world.country;
        cell.languageLabel.text = world.language;
        cell.statusLabel.text = world.status.statusDescription;
    }
    
    return cell;
}


@end
