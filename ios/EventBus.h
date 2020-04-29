//
//  EventBus.h
//  MyTestApp
//
//  Created by Bruno Mazzo on 28/4/20.
//

#ifndef EventBus_h
#define EventBus_h

#import <React/RCTBridgeModule.h>

@class EventBus;

@interface RCT_EXTERN_MODULE(EventBus, NSObject)

RCT_EXTERN_METHOD(addEvent:(NSString *)name event:(NSDictionary*)event)

@end

#endif /* EventBus_h */
