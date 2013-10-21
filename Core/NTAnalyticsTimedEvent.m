//
//  NTAnalyticsTimedEvent.m
//

#import "NTAnalytics.h"


@implementation NTAnalyticsTimedEvent


-(void)start
{
    [self.manager startEvent:self];
}


-(void)start:(NSDictionary *)params
{
    [self.manager startEvent:self params:params];
}


-(void)end
{
    [self.manager endEvent:self];
}


-(void)end:(NSDictionary *)params
{
    [self.manager endEvent:self params:params];
}


@end
