//
//  RepositoriesService.h
//  CodingChallengeHiddenFounders
//
//  Created by cmoissam on 18/01/2018.
//  Copyright © 2018 rmi. All rights reserved.
//

#import "BaseServices.h"
#import "RepositoryStore.h"

@interface RepositoriesService : BaseServices


+ (id)shared;
#define GetRepoSuccessNotification @"GetRepoSuccessNotification"
-  (void) getAllRepos:(NSNumber *) page;

@end
