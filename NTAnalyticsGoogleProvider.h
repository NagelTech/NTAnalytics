//
//  NTAnalyticsGoogleProvider.h
//  Anchor
//
//  Created by Ethan Nagel on 7/22/13.
//  Copyright (c) 2013 Tomfoolery, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NTAnalytics.h"


@interface NTAnalyticsGoogleProvider : NSObject <NTAnalyticsProvider>

@property (readonly,retain,nonatomic)   NSString *trackingId;

-(id)initWithTrackingId:(NSString *)trackingId;

+(NTAnalyticsGoogleProvider *)googleProviderWithTrackingId:(NSString *)trackingId;

@end
