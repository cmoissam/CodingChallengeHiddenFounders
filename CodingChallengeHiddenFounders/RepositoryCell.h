//
//  RepositoryCell.h
//  CodingChallengeHiddenFounders
//
//  Created by cmoissam on 18/01/2018.
//  Copyright © 2018 rmi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RepositoryCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *repoName;
@property (strong, nonatomic) IBOutlet UILabel *repoDescription;
@property (strong, nonatomic) IBOutlet UILabel *stars;
@property (strong, nonatomic) IBOutlet UILabel *UserName;
@property (strong, nonatomic) IBOutlet UIImageView *UserImage;

@end
