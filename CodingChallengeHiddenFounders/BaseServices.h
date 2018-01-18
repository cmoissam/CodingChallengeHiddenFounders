//
//  BaseServices.h
//  CodingChallengeHiddenFounders
//
//  Created by cmoissam on 18/01/2018.
//  Copyright © 2018 rmi. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <AFNetworking.h>
#import "Constantes.h"

#define RequestStartNotification @"RequestStartNotification"
#define RequestEndNotification @"RequestEndNotification"
#define RequestFailNotification @"RequestFailNotification"
#define ConnectionProblemNotification @"ConnectionProblemNotification"

@interface BaseServices : NSObject

@property AFHTTPRequestOperationManager *manager;
@property BOOL canceling;

+ (id)shared;
- (id)httpClient;
- (void)cancelRequest;
- (void)wasCanceled;


@end
