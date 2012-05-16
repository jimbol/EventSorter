//
//  PCMap.h
//  PCPartynaut
//
//  Created by Chris Mack on 4/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PCEventSorter.h"
#import <MapKit/MapKit.h>

@interface PCMap : PCEventSorter

@property (nonatomic, retain)MKMapView* MapView;

- (id)initWithMapView:(MKMapView*)mapView;
- (void)updateMap;
- (void)zoomToUserLocation:(MKUserLocation *)userLocation;


@end
