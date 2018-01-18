//
//  RepositoriesService.m
//  CodingChallengeHiddenFounders
//
//  Created by cmoissam on 18/01/2018.
//  Copyright © 2018 rmi. All rights reserved.
//

#import "RepositoriesService.h"

@implementation RepositoriesService

+ (id)shared {
    static RepositoriesService *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}
id objectOrNull(id object)

{
    return object ?: [NSNull null];
    
}
-  (void) getAllRepos:(NSNumber *) page{
    
    
    [APPLICATION setNetworkActivityIndicatorVisible:YES];
    [NOTIFICATION postNotificationName:RequestStartNotification object:nil];
    NSString *URL = [NSString stringWithFormat:@"%@repositories", API_URL];
    NSDictionary * params=@{
                            @"q":objectOrNull(@"created:>2017-10-22"),
                            @"sort":objectOrNull(@"stars"),
                            @"order":objectOrNull(@"desc"),
                            @"page": objectOrNull(page)
                            };
    
    [self.httpClient GET:URL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSMutableArray <Repository *> * repositories = [Repository arrayOfModelsFromDictionaries: responseObject[@"items"] error:nil];
        [RepositoryStore shared].repositories=repositories;
        [APPLICATION setNetworkActivityIndicatorVisible:NO];
        [NOTIFICATION postNotificationName:GetRepoSuccessNotification object:nil];
        [NOTIFICATION postNotificationName:RequestEndNotification object:nil];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [APPLICATION setNetworkActivityIndicatorVisible:NO];
        //        [NOTIFICATION postNotificationName:ListRequestDidFailNotification object:nil];
        [NOTIFICATION postNotificationName:RequestEndNotification object:nil];
        if(operation.error.code == NSURLErrorNotConnectedToInternet)
        {[NOTIFICATION postNotificationName:ConnectionProblemNotification object:nil];
        }
        else if(operation.error.code == NSURLErrorTimedOut) {
            [NOTIFICATION postNotificationName:ConnectionProblemNotification object:nil];
            NSLog(@"time out");
        }
        else{
            [NOTIFICATION postNotificationName:RequestFailNotification object:nil];
        }
    }];
    
}


@end
