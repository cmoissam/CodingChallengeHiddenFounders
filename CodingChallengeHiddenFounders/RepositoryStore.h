//
//  RepositoryStore.h
//  CodingChallengeHiddenFounders
//
//  Created by cmoissam on 18/01/2018.
//  Copyright © 2018 rmi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Repository.h"

@interface RepositoryStore : NSObject

+ (RepositoryStore *)shared;
@property (nonatomic, strong) NSMutableArray <Repository *> *repositories;

@end
