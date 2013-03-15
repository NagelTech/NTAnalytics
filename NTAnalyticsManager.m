//
//  NTAnalyticsManager.m
//

#import "NTAnalytics.h"


@implementation NTAnalyticsManager


static NSMutableArray *sProviders = nil;


-(void)addProvider:(id<NTAnalyticsProvider>)provider
{
    if ( !sProviders )
        sProviders = [NSMutableArray array];
    
    [sProviders addObject:provider];
    
    if ( [provider respondsToSelector:@selector(configureWithManager:)] )
    {
        [provider configureWithManager:self];
    }
}


-(void)performOnProviders:(void (^)(id<NTAnalyticsProvider> provider))block
{
    if ( !sProviders )
        return ;
    
    for(id<NTAnalyticsProvider> provider in sProviders)
    {
        block(provider);
    }
}


-(void)startSession
{
    [self performOnProviders:^(id<NTAnalyticsProvider> provider)
     {
         [provider startSession];
     }];
}


-(void)logEvent:(NTAnalyticsEvent *)event
{
    [self performOnProviders:^(id<NTAnalyticsProvider> provider)
    {
        [provider logEvent:event params:nil];
    }];
}


-(void)logEvent:(NTAnalyticsEvent *)event params:(NSDictionary *)params
{
    [self performOnProviders:^(id<NTAnalyticsProvider> provider)
     {
         [provider logEvent:event params:params];
     }];
}


-(void)startEvent:(NTAnalyticsEvent *)event
{
    [self performOnProviders:^(id<NTAnalyticsProvider> provider)
     {
         [provider startEvent:event params:nil];
     }];
}


-(void)startEvent:(NTAnalyticsEvent *)event params:(NSDictionary *)params
{
    [self performOnProviders:^(id<NTAnalyticsProvider> provider)
     {
         [provider startEvent:event params:params];
     }];
}


-(void)endEvent:(NTAnalyticsEvent *)event
{
    [self performOnProviders:^(id<NTAnalyticsProvider> provider)
     {
         [provider endEvent:event params:nil];
     }];
}


-(void)endEvent:(NTAnalyticsEvent *)event params:(NSDictionary *)params
{
    [self performOnProviders:^(id<NTAnalyticsProvider> provider)
     {
         [provider endEvent:event params:params];
     }];
}


-(void)logException:(NSException *)exception message:(NSString *)format, ...
{
    va_list args;
    va_start(args, format);

    NSString *message = [[NSString alloc] initWithFormat:format arguments:args];
    
    va_end(args);
    
    [self performOnProviders:^(id<NTAnalyticsProvider> provider)
    {
        [provider logException:exception message:message];
    }];
}


-(void)logError:(NSError *)error message:(NSString *)format, ...
{
    va_list args;
    va_start(args, format);
    
    NSString *message = [[NSString alloc] initWithFormat:format arguments:args];
    
    va_end(args);
    
    [self performOnProviders:^(id<NTAnalyticsProvider> provider)
     {
         [provider logError:error message:message];
     }];
}


@end
