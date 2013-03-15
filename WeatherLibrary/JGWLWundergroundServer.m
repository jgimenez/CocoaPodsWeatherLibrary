//
//  JGWLWundergroundServer.m
//  CocoaPodsPlayground
//
//  Created by gimix on 3/14/13.
//  Copyright (c) 2013 Jordi Gim√©nez. All rights reserved.
//

#import "JGWLWundergroundServer.h"
#import "AFJSONRequestOperation.h"
#import "NSObject+JTObjectMapping.h"

NSString *const kWundergroundServerCitySpainBarcelona = @"Spain/Barcelona";

@implementation JGWLWundergroundServer

- (id)initWithApiKey:(NSString*)apiKey {
    NSString * base = [NSString stringWithFormat:@"http://api.wunderground.com/api/%@/", apiKey];
    self = [super initWithBaseURL:[NSURL URLWithString:base]];
    if (self != nil) {
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
        
        // Accept HTTP Header; see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.1
        [self setDefaultHeader:@"Accept" value:@"application/json;q=0.2,*/*;q=0.1"];
        self.parameterEncoding = AFJSONParameterEncoding;
    }
    return self;
}

-(void)currentWeatherIn:(NSString*)city onSuccess:(void (^)(JGWLCurrentWeather*))success onFailure:(void (^)(NSError*))failure
{
    [self getPath:@"conditions/q/Spain/Barcelona.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id json) {
        NSDictionary* response = [json objectForKey:@"current_observation"];
        if(!!success) success([JGWLCurrentWeather objectFromJSONObject:response mapping:nil]);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error in getting current weather conditions: %@", error.description);
        if(!!failure) failure(error);
    }];
}
@end
