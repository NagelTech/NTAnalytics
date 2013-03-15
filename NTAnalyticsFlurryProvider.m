//
//  NTAnalyticsFlurryProvider.m
//

#import "NTAnalyticsFlurryProvider.h"

#import "Flurry.h"


@implementation NTAnalyticsFlurryProvider

@synthesize apiKey = mApiKey;


-(id)initWithApiKey:(NSString *)apiKey
{
    if ( (self=[super init]) )
    {
        mApiKey = apiKey;
    }
    
    return self;
}


+(NTAnalyticsFlurryProvider *)flurryProviderWithApiKey:(NSString *)apiKey
{
    return [[NTAnalyticsFlurryProvider alloc] initWithApiKey:apiKey];
}


-(void)startSession
{
    [Flurry startSession:self.apiKey];
}


-(void)logEvent:(NTAnalyticsEvent *)event params:(NSDictionary *)params
{
    [Flurry logEvent:event.name withParameters:params];
}


-(void)startEvent:(NTAnalyticsEvent *)event params:(NSDictionary *)params
{
    [Flurry logEvent:event.name withParameters:params timed:YES];
}


-(void)endEvent:(NTAnalyticsEvent *)event params:(NSDictionary *)params
{
    [Flurry endTimedEvent:event.name withParameters:params];
}


-(void)logException:(NSException *)exception message:(NSString *)message
{
    [Flurry logError:message message:[exception description] exception:exception];
}


-(void)logError:(NSError *)error message:(NSString *)message
{
    [Flurry logError:message message:[error localizedDescription] error:error];
}


@end
