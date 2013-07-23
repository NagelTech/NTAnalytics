//
//  NTAnalyticsGoogleProvider.m
//  Anchor
//
//  Created by Ethan Nagel on 7/22/13.
//  Copyright (c) 2013 Tomfoolery, Inc. All rights reserved.
//

#import "NTAnalyticsGoogleProvider.h"

#import "GAI.h"


@interface NTAnalyticsGoogleProvider ()
{
    id<GAITracker> _tracker;
}

@end


@implementation NTAnalyticsGoogleProvider


-(id)initWithTrackingId:(NSString *)trackingId
{
    self = [super init];
    
    if ( self )
    {
        _trackingId = trackingId;
    }
    
    return self;
}



+(NTAnalyticsGoogleProvider *)googleProviderWithTrackingId:(NSString *)trackingId
{
    return [[NTAnalyticsGoogleProvider alloc] initWithTrackingId:trackingId];
}



-(void)startSession
{
    _tracker = [[GAI sharedInstance] trackerWithTrackingId:self.trackingId];
    
}


-(void)setUserId:(NSString *)userId
{
    // not supported

}


-(void)setLatitude:(double)latitude longitude:(double)longitude horizontalAccuracy:(float)horizontalAccuracy verticalAccuracy:(float)verticalAccuracy
{
    // not supported
}


-(void)logEvent:(NTAnalyticsEvent *)event params:(NSDictionary *)params
{
    NSString *category = nil;
    NSString *action = event.name;
    NSString *label = nil;
    NSNumber *value = nil;
    
    if ( params && params.count )
    {
        // create a single "label" with all params...
        
        NSMutableArray *items = [NSMutableArray arrayWithCapacity:params.count];
        
        for (NSString *key in params.allKeys)
            [items addObject:[NSString stringWithFormat:@"%@=%@", key, params[key]]];
        
        // Sort the items, so they wil appear in a predictable order...
        
        [items sortUsingSelector:@selector(caseInsensitiveCompare:)];
        
        label = [items componentsJoinedByString:@","];
    }
    
    [_tracker sendEventWithCategory:category withAction:action withLabel:label withValue:value];
}


-(void)startEvent:(NTAnalyticsEvent *)event params:(NSDictionary *)params
{
    // we will need to make some changes to support this.
}


-(void)endEvent:(NTAnalyticsEvent *)event params:(NSDictionary *)params
{
    // for now, treat the same as a standard log call...
    
    [self logEvent:event params:params];
}


-(void)logException:(NSException *)exception message:(NSString *)message
{
    // message is not passed
    [_tracker sendException:NO withNSException:exception];
}


-(void)logError:(NSError *)error message:(NSString *)message
{
    // message is not passed
    [_tracker sendException:NO withNSError:error];
}


@end
