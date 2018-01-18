//
//  User.h
//  CodingChallengeHiddenFounders
//
//  Created by cmoissam on 18/01/2018.
//  Copyright © 2018 rmi. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface User : JSONModel

@property (strong, nonatomic) NSString<Optional> *avatar_url;
@property (strong, nonatomic) NSString<Optional> *login;

@end
