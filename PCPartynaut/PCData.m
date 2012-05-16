//
//  PCData.m
//  PCPartynaut
//
//  Created by Jim Hall on 4/21/12.
//  Copyright (c) 2012 cchange. All rights reserved.
//
#import "PCAppDelegate.h"
#import "PCData.h"
#import "CJSONDeserializer.h"
#import "Event.h"
#import "Type.h"
@implementation PCData

@synthesize managedObjectContext;

@synthesize JSON;

//Check for new Data

- (id) initWithDataForURLString:(NSString*)URLString{
    
    [self getDataForURLString:URLString];
    
    return self;
}


- (void) getDataForURLString:(NSString*)URLString{
    
    PCAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];    
    
    self.managedObjectContext = appDelegate.managedObjectContext;
    
    // Get URL String, convert to NSURL and download the contents of the URL
    NSURL* URL = [[NSURL alloc] initWithString:URLString];
    NSData* jsonData = [NSData dataWithContentsOfURL:URL];
    
    // Set dictionary to deserialized JSON
    NSError* error;
    NSDictionary *dictionary = [[CJSONDeserializer deserializer] deserializeAsDictionary:jsonData error:&error];
    
    // Get JSON
    JSON = [dictionary objectForKey:@"data"];
    
    for(int i = 0; i<[JSON count]; i++){
        
        NSDictionary *singleEvent = [[NSDictionary alloc] initWithDictionary:[JSON objectAtIndex:i]];
        
        // Create Event Row
        Event *event = [NSEntityDescription
                        insertNewObjectForEntityForName:@"Event"
                        inManagedObjectContext:managedObjectContext];
        
        
        [event setValue:[singleEvent valueForKey:@"ParentID"] forKey:@"parentID"];
        [event setValue:[singleEvent valueForKey:@"EventID"] forKey:@"id"];
        [event setValue:[singleEvent valueForKey:@"ImageID"] forKey:@"imageID"];
        [event setValue:[singleEvent valueForKey:@"Name"] forKey:@"name"];
        [event setValue:[singleEvent valueForKey:@"PrivacyCode"]forKey:@"privacyCode"];
        
        NSDictionary *location = [singleEvent valueForKey:@"Location"];
        
        // Location Information
        [event setValue:[location valueForKey:@"Name"] forKey:@"locationName"];
        [event setValue:[location valueForKey:@"Street1"] forKey:@"street1"];
        [event setValue:[location valueForKey:@"Street2"] forKey:@"street2"];
        [event setValue:[location valueForKey:@"City"] forKey:@"city"];
        [event setValue:[location valueForKey:@"State"] forKey:@"state"];
        [event setValue:[location valueForKey:@"Country"] forKey:@"country"];
        [event setValue:[location valueForKey:@"Latitude"] forKey:@"latitude"];
        [event setValue:[location valueForKey:@"Longitude"] forKey:@"longitude"];
      
        // Create Type Rows for Events
        NSArray *typeObjects = [singleEvent valueForKey:@"Types"];        
        for(int j = 0; j<[typeObjects count]; j++){
            
            Type *type = [NSEntityDescription
                          insertNewObjectForEntityForName:@"Type"
                          inManagedObjectContext:managedObjectContext];
           
            NSDictionary* typeDictionary = [[NSDictionary alloc] initWithDictionary:[typeObjects objectAtIndex:j]];

            [type setValue:[typeDictionary valueForKey:@"Code"] forKey:@"code"];
            [type setValue:[typeDictionary valueForKey:@"Description"]  forKey:@"desc"];
            [type setValue:[singleEvent valueForKey:@"EventID"] forKey:@"eventID"];
            [event addTypesObject:type];
        }  
    }
}



@end
