//
//  Repository.h
//  CodingChallengeHiddenFounders
//
//  Created by cmoissam on 18/01/2018.
//  Copyright © 2018 rmi. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "User.h"

@interface Repository : JSONModel

@property (strong, nonatomic) NSString<Optional> *name;
@property (strong, nonatomic) NSString<Optional> * rep_description;
@property (strong, nonatomic) NSNumber<Optional> *stargazers_count;
@property (strong, nonatomic) User <Optional> *owner;

@end
