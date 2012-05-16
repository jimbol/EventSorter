//
//  PCMap.m
//  PCPartynaut
//
//  Created by Chris Mack on 4/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PCMap.h"
#import "custAnnotation.h"
#import <MapKit/MapKit.h>
#import "PCAppDelegate.h"
@implementation PCMap

@synthesize MapView, managedObjectContext, displayIDs;

- (id)initWithMapView:(MKMapView*)mapView{
    
    MapView = mapView;
    
    MapView.delegate = self;
    
    [self zoomToUserLocation:MapView.userLocation];
    
    PCAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];    
    
    self.managedObjectContext = appDelegate.data.managedObjectContext;
    
    self.hiddenTypes = [[NSMutableArray alloc] init];
    
    self.displayIDs = [[NSMutableArray alloc] init];

    return self;
}

- (void)updateMap{
    
    NSMutableArray* pins = [[NSMutableArray alloc] init];

    NSLog(@"%@", self.hiddenTypes);
    
    // checks for new data from the PCData object
    PCAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];  
    
    self.managedObjectContext = appDelegate.data.managedObjectContext;
    
    NSArray* filtered = [[NSArray alloc] initWithArray:[self getVisibleEvents]];
    
        [MapView removeAnnotations:[MapView annotations]];
        
        [displayIDs removeAllObjects];
        
        for (int i = 0; i<[filtered count]; i++) {
            
            [displayIDs addObject:[[filtered objectAtIndex:i] valueForKey:@"id"]];
            
            NSLog(@"Name: %@", [[filtered objectAtIndex:i] valueForKey:@"name"]);
            
            custAnnotation* pin = [[custAnnotation alloc] init];
            
            pin.title = [[filtered objectAtIndex:i] valueForKey:@"name"];
            
            double lat = [[[filtered objectAtIndex:i] valueForKey:@"latitude"] doubleValue];
            
            
            double lon = [[[filtered objectAtIndex:i] valueForKey:@"longitude"] doubleValue];
            
            CLLocationCoordinate2D locCoord;
            locCoord.latitude = lat;
            locCoord.longitude = lon;
            pin.coordinate = locCoord;
            [pins addObject:pin];
            
        }

    
    NSArray* loadedPins = [NSArray arrayWithArray:pins];
    
    [MapView addAnnotations:loadedPins];
      
}

- (void)zoomToUserLocation:(MKUserLocation *)userLocation
{
    // if theres no location, do nothing
    if (!userLocation)
        return;
    
    // otherwise create a region and set map to show it
    
    MKCoordinateRegion region;
    region.center.latitude = 41.890336;
    region.center.longitude = -87.611397;
    
    //For testing I am not using the real user Location
    //region.center = userLocation.location.coordinate;
    
    region.span = MKCoordinateSpanMake(0.04, 0.04);
    region = [self.MapView regionThatFits:region];
    [self.MapView setRegion:region animated:YES];
    
    //MapView.showsUserLocation = YES;
}

@end
