//
//  BaseServices.m
//  CodingChallengeHiddenFounders
//
//  Created by cmoissam on 18/01/2018.
//  Copyright © 2018 rmi. All rights reserved.
//

#import "BaseServices.h"

@implementation BaseServices

+ (id)shared {
    // SHARED TEMPLATE
    return self;
}

-(id)httpClient {
    _manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:API_URL]];
    _manager.responseSerializer = [AFJSONResponseSerializer serializer];
    _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [_manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [_manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    return _manager;
}

- (void)cancelRequest {
    
    _canceling = YES;
    
    [APPLICATION setNetworkActivityIndicatorVisible:NO];
    
    [_manager.operationQueue cancelAllOperations];
    
}
- (void)wasCanceled {
    
    [APPLICATION setNetworkActivityIndicatorVisible:NO];
    
    if (! self.canceling) {
        
        [NOTIFICATION postNotificationName:RequestFailNotification object:nil];
    } else {
        _canceling = NO;
    }
}



@end
