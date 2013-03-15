//
//  WeatherLibraryTests.m
//  WeatherLibraryTests
//
//  Created by gimix on 3/14/13.
//  Copyright (c) 2013 Jordi Giménez. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "JGWLWundergroundServer.h"
#import <SenTestingKitAsync/SenTestingKitAsync.h>

@interface WeatherLibraryTests : SenTestCase

@property (strong, nonatomic) JGWLWundergroundServer* server;

@end

@implementation WeatherLibraryTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    self.server = [[JGWLWundergroundServer alloc] init];
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testBarcelonaRequestAsync
{
    [self.server currentWeatherIn:kWundergroundServerCitySpainBarcelona onSuccess:^(JGWLCurrentWeather * weather) {
        STAssertNotNil(weather.weather, @"");
        NSLog(@"weather: %@", weather.weather);
        STSuccess();
    } onFailure:^(NSError * error) {
        STFail(@"%@", error.description);
        STSuccess();
    }];
}

@end
