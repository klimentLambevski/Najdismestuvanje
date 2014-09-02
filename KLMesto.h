//
//  KLMesto.h
//  NajdiSmestuvanje
//
//  Created by Kliment Lambevski on 8/31/14.
//  Copyright (c) 2014 Kliment Lambevski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface KLMesto : NSObject <MKAnnotation>{
    CLLocationCoordinate2D coordinate;
    NSString* title;
}

@property (nonatomic, copy) NSString* uniqueID;
@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSDecimalNumber* latitude;
@property (nonatomic, copy) NSDecimalNumber* longitude;
@property (nonatomic, copy) NSString* tip;
@property (nonatomic, copy) NSString* opis;

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString* title;

- (instancetype) initWithDictionary:(NSDictionary*)dictionary;
- (NSDictionary*) toDictionary;



@end
