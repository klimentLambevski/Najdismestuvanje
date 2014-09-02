//
//  KLMesto.m
//  NajdiSmestuvanje
//
//  Created by Kliment Lambevski on 8/31/14.
//  Copyright (c) 2014 Kliment Lambevski. All rights reserved.
//

#import "KLMesto.h"
#define safeSet(d,k,v) if (v) d[k] = v;

@implementation KLMesto

@synthesize coordinate, title;


- (instancetype) initWithDictionary:(NSDictionary*)dictionary
{
    self = [super init];
    
    if (self) {
        _name = dictionary[@"name"];
        _latitude = dictionary[@"latitude"];
        _longitude = dictionary[@"longtitude"];
        _uniqueID = dictionary[@"uniqueID"];
        _tip = dictionary[@"tip"];
        _opis = dictionary[@"opis"];
        
        CLLocationDegrees lat = [_latitude doubleValue];
        CLLocationDegrees lon = [_longitude doubleValue];
        coordinate = CLLocationCoordinate2DMake(lat, lon);
        title = _name;
    }
    return self;
}

- (NSDictionary*) toDictionary
{
    NSMutableDictionary* json = [NSMutableDictionary dictionary];
    safeSet(json, @"name", self.name);
    safeSet(json, @"latitude", self.latitude);
    safeSet(json, @"longitude", self.longitude);
    safeSet(json, @"uniqueID", self.uniqueID);
    safeSet(json, @"opis", self.opis);
    safeSet(json, @"tip", self.tip);
    return json;
}

@end
