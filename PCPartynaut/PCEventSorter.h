//
//  PCEventSorter.h
//  PCPartynaut
//
//  Created by Jim Hall on 4/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PCEventSorter : NSObject

@property (nonatomic,strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic,strong) NSMutableArray* hiddenTypes;
@property (nonatomic,strong) NSMutableArray* displayIDs;


- (id) init;

- (NSArray*)getAllEvents;
- (NSArray*)toggleTag:(NSString*)tag;
- (NSArray*)removeHiddenTag:(NSString*)tag;
- (NSArray*)getVisibleEvents;

- (NSArray*)getEventsWithTag:(NSString*)tag;

@end
