//
//  RadarBeacon+Internal.h
//  RadarSDK
//
//  Copyright © 2020 Radar Labs, Inc. All rights reserved.
//

#import "RadarBeacon.h"
#import <Foundation/Foundation.h>

@interface RadarBeacon ()

+ (NSArray<RadarBeacon *> *_Nullable)beaconsFromObject:(id _Nonnull)object;

- (instancetype _Nullable)initWithObject:(id _Nonnull)object;

- (instancetype _Nullable)initWithUUID:(NSString *_Nonnull)uuid major:(NSString *_Nonnull)major minor:(NSString *_Nonnull)minor rssi:(NSInteger)rssi;

- (instancetype _Nullable)initWithId:(NSString *_Nonnull)_id
                         description:(NSString *_Nullable)description
                                 tag:(NSString *_Nonnull)tag
                          externalId:(NSString *_Nonnull)externalId
                                uuid:(NSString *_Nonnull)uuid
                               major:(NSString *_Nullable)major
                               minor:(NSString *_Nullable)minor
                            metadata:(NSDictionary *_Nullable)metadata
                            geometry:(RadarCoordinate *_Nonnull)geometry;

+ (RadarBeacon *_Nonnull)fromCLBeaconRegion:(CLBeaconRegion *_Nonnull)region;

+ (RadarBeacon *_Nonnull)fromCLBeacon:(CLBeacon *_Nonnull)beacon;

@end
