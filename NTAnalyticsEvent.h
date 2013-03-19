//
//  NTAnalyticsEvent.h
//

#import <Foundation/Foundation.h>


@class NTAnalyticsManager;


@interface NTAnalyticsEvent : NSObject


@property (readonly,retain,nonatomic)       NTAnalyticsManager  *manager;
@property (readonly,retain,nonatomic)       NSString            *name;


-(id)initWithManager:(NTAnalyticsManager *)manager name:(NSString *)name;

+(id)eventWithManager:(NTAnalyticsManager *)manager name:(NSString *)name;

-(void)log;
-(void)log:(NSDictionary *)params;

@end
