//
//  NTAnalyticsFlurryProvider.h
//

#import <Foundation/Foundation.h>

#import "NTAnalytics.h"


@interface NTAnalyticsFlurryProvider : NSObject <NTAnalyticsProvider>

@property (readonly,retain,nonatomic)   NSString *apiKey;

-(id)initWithApiKey:(NSString *)apiKey;

+(NTAnalyticsFlurryProvider *)flurryProviderWithApiKey:(NSString *)apiKey;

@end
