//
//  VVStop.m
//  Vandy Vans
//
//  Created by Seth Friedman on 12/10/13.
//  Copyright (c) 2013 VandyApps. All rights reserved.
//

#import "VVStop.h"
#import "VVRoute.h"

static NSString * const kStopNamesKey = @"StopNames";

@interface VVStop ()

- (NSString *)stopNameForStopID:(NSString *)stopID;

@end

@implementation VVStop

#pragma mark - Designated Initializer

/*- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    
    if (self) {
        _name = name;
        _stopID = [self stopIDForStopName:name];
        _routes = [self routesForStopName:name];
    }
    
    return self;
}*/

- (instancetype)initWithID:(NSString *)stopID {
    self = [super init];
    
    if (self) {
        _name = [self stopNameForStopID:stopID];
        _stopID = stopID;
    }
    
    return self;
}

#pragma mark - Factory Method

/*+ (instancetype)stopWithName:(NSString *)name {
    return [[self alloc] initWithName:name];
}*/

+ (instancetype)stopWithID:(NSString *)stopID {
    return [[self alloc] initWithID:stopID];
}

#pragma mark - Helper Methods

/*- (NSUInteger)stopIDForStopName:(NSString *)stopName {
    NSUInteger stopID;
    
    if ([stopName isEqualToString:@"Branscomb Quad"]) {
        stopID = 263473;
    } else if ([stopName isEqualToString:@"Carmichael Towers"]) {
        stopID = 263470;
    } else if ([stopName isEqualToString:@"Murray House"]) {
        stopID = 263454;
    } else if ([stopName isEqualToString:@"Highland Quad"]) {
        stopID = 263444;
    } else if ([stopName isEqualToString:@"Vanderbilt Police Department"]) {
        stopID = 264041;
    } else if ([stopName isEqualToString:@"Vanderbilt Book Store"]) {
        stopID = 332298;
    } else if ([stopName isEqualToString:@"Kissam Quad"]) {
        stopID = 263415;
    } else if ([stopName isEqualToString:@"Terrace Place Garage"]) {
        stopID = 238083;
    } else if ([stopName isEqualToString:@"Wesley Place Garage"]) {
        stopID = 238096;
    } else if ([stopName isEqualToString:@"North House"]) {
        stopID = 263463;
    } else if ([stopName isEqualToString:@"Blair School of Music"]) {
        stopID = 264091;
    } else if ([stopName isEqualToString:@"McGugin Center"]) {
        stopID = 264101;
    } else if ([stopName isEqualToString:@"Blakemore House"]) {
        stopID = 401204;
    } else { // Medical Center
        stopID = 446923;
    }
    
    return stopID;
}*/

- (NSString *)stopNameForStopID:(NSString *)stopID {
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    
    NSDictionary *stopNamesForStopIDs = @{@"263473": @"Branscomb Quad",
                                          @"263470": @"Carmichael Towers",
                                          @"644903": @"Hank Ingram",
                                          @"263444": @"Highland Quad",
                                          @"264041": @"Vanderbilt Police Department",
                                          @"332298": @"Vanderbilt Book Store",
                                          @"644872": @"College Halls at Kissam",
                                          @"644873": @"21st near Terrace Place",
                                          @"238096": @"Wesley Place Garage",
                                          @"263463": @"North House",
                                          @"264091": @"Blair School of Music",
                                          @"264101": @"McGugin Center",
                                          @"644874": @"MRB 3"};
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if ([standardUserDefaults dictionaryForKey:kStopNamesKey]) {
            [standardUserDefaults removeObjectForKey:kStopNamesKey];
        }
    });
    
    return stopNamesForStopIDs[stopID];
}

@end
