//
//  NTAnalyticsManager.h
//

#import <Foundation/Foundation.h>

#import "NTAnalyticsEvent.h"


@class NTAnalyticsManager;

@protocol NTAnalyticsProvider <NSObject>

@optional

-(void)configureWithManager:(NTAnalyticsManager *)manager;

@required

-(void)startSession;

-(void)logEvent:(NTAnalyticsEvent *)event params:(NSDictionary *)params;
-(void)startEvent:(NTAnalyticsEvent *)event params:(NSDictionary *)params;
-(void)endEvent:(NTAnalyticsEvent *)event params:(NSDictionary *)params;

-(void)logException:(NSException *)exception message:(NSString *)message;
-(void)logError:(NSError *)error message:(NSString *)message;

@end


@interface NTAnalyticsManager : NSObject

-(void)addProvider:(id<NTAnalyticsProvider>)provider;

-(void)startSession;

-(void)logEvent:(NTAnalyticsEvent *)event;
-(void)logEvent:(NTAnalyticsEvent *)event params:(NSDictionary *)params;

-(void)startEvent:(NTAnalyticsEvent *)event;
-(void)startEvent:(NTAnalyticsEvent *)event params:(NSDictionary *)params;

-(void)endEvent:(NTAnalyticsEvent *)event;
-(void)endEvent:(NTAnalyticsEvent *)event params:(NSDictionary *)params;

-(void)logException:(NSException *)exception message:(NSString *)format, ...;
-(void)logError:(NSError *)error message:(NSString *)format, ...;

@end
