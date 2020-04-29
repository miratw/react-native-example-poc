#import "EventBus.h"


@implementation EventBus

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(request:(nonnull NSDictionary *)request callback:(RCTPromiseResolveBlock)callback rejecter:(RCTPromiseRejectBlock)reject)
{
    // TODO: Implement some actually useful functionality
    NSLog(@"Send Event: %@", request);
    callback(@"Hello world from Native side");
//    callback(@[[NSString stringWithFormat: @"numberArgument: %@ stringArgument: %@", numberArgument., stringArgument]]);
}

@end
