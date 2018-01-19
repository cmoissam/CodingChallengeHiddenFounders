//
//  FirstViewController.h
//  CodingChallengeHiddenFounders
//
//  Created by cmoissam on 18/01/2018.
//  Copyright © 2018 rmi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RepositoriesService.h"
#import "SVPullToRefresh.h"
#import "RepositoryCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface FirstViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *repositoriesTableView;
@property (strong, nonatomic) IBOutlet NSMutableArray<Repository * > *repositories;
@property  int count;
@property  (strong, nonatomic) NSNumber * page;
@property BOOL fromPagin;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentControl;
@property (strong, nonatomic) IBOutlet UIView *SettingsView;
- (IBAction)segmentAction:(id)sender;

@end
