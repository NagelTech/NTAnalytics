//
//  NTAnalyticsEvent.m
//


#import "NTAnalytics.h"


@implementation NTAnalyticsEvent


@synthesize manager = mManager;
@synthesize name = mName;


-(id)initWithManager:(NTAnalyticsManager *)manager name:(NSString *)name
{
    if ( (self=[super init] ) )
    {
        mManager = manager;
        mName = name;
    }
    
    return self;
}


+(id)eventWithManager:(NTAnalyticsManager *)manager name:(NSString *)name
{
    return [[self alloc] initWithManager:manager name:name];
}


-(void)log
{
    [self.manager logEvent:self];
}


-(void)log:(NSDictionary *)params
{
    [self.manager logEvent:self params:params];
}


@end
