//
//  PCEventSorter.m
//  PCPartynaut
//
//  Created by Chris Mack on 4/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PCEventSorter.h"
#import "PCAppDelegate.h"
#import "Event.h"
#import "Type.h"

@implementation PCEventSorter

@synthesize managedObjectContext, hiddenTypes, displayIDs;

/*
 
 Get event based on preferences
 
 */

- (id)init{
    
    PCAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];    
    
    self.managedObjectContext = appDelegate.data.managedObjectContext;
    
    hiddenTypes = [[NSMutableArray alloc] init];

    return self; 
}

- (NSArray*)getAllEvents{
    
    // checks for new data from the PCData object
    PCAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];    
    self.managedObjectContext = appDelegate.data.managedObjectContext;
    
    NSError* error;
    // Event Fetch
    NSFetchRequest *fetchEvent = [[NSFetchRequest alloc] init];
    NSEntityDescription *eventEntity = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:self.managedObjectContext];
    [fetchEvent setEntity:eventEntity];
   
    NSArray *fetchedEvents = [self.managedObjectContext executeFetchRequest:fetchEvent error:&error];    
    
    return fetchedEvents;
    
}

- (NSArray*)toggleTag:(NSString*)tag{

    NSInteger ind = [hiddenTypes indexOfObject:tag];
    if (ind == NSNotFound) {
        [hiddenTypes addObject:tag];    
    }else{
        [hiddenTypes removeObject:tag];    
    }
    
    
    return [self getVisibleEvents];
}

- (NSArray*)removeHiddenTag:(NSString*)tag{
    
    [hiddenTypes removeObject:tag];
    
    return [self getVisibleEvents];
}

- (NSArray*)getVisibleEvents{
    
    NSMutableArray* finalFiltered = [[NSMutableArray alloc] initWithArray:[self getAllEvents]];

    for (int i = 0; i<[hiddenTypes count]; i++) {
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"not types.code CONTAINS %@", [hiddenTypes objectAtIndex:i]];
        
        NSArray *filtered  = [finalFiltered filteredArrayUsingPredicate:predicate];
        
        finalFiltered = [[NSMutableArray alloc] initWithArray:filtered];
    }
    
    return finalFiltered;
}

- (NSArray*)getEventsWithTag:(NSString*)tag{

    // Get ONLY the events with passed tag
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"types.code CONTAINS %@", tag];
    NSArray *filtered  = [[self getAllEvents] filteredArrayUsingPredicate:predicate];
    
    return filtered;
    
}




@end
