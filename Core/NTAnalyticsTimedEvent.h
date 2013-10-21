//
//  NTAnalyticsTimedEvent.h
//

#import "NTAnalyticsEvent.h"

@interface NTAnalyticsTimedEvent : NTAnalyticsEvent


-(void)start;
-(void)start:(NSDictionary *)params;

-(void)end;
-(void)end:(NSDictionary *)params;


@end
