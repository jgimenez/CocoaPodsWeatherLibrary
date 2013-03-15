//
//  JGWLWundergroundServer.h
//  CocoaPodsPlayground
//
//  Created by gimix on 3/14/13.
//  Copyright (c) 2013 Jordi Gim√©nez. All rights reserved.
//

#import "AFHTTPClient.h"
#import "JGWLCurrentWeather.h"

FOUNDATION_EXPORT NSString *const kWundergroundServerCitySpainBarcelona;

/** wunderground.com api client */
@interface JGWLWundergroundServer : AFHTTPClient

/** Returns current weather in the specified city */
-(void)currentWeatherIn:(NSString*)city onSuccess:(void (^)(JGWLCurrentWeather*))success onFailure:(void (^)(NSError*))failure;

@end
