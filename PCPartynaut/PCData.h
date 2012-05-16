//
//  PCData.h
//  PCPartynaut
//
//  Created by Chris Mack on 4/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PCAppDelegate.h"
@interface PCData : NSObject

@property (nonatomic,strong) NSManagedObjectContext *managedObjectContext;

@property (nonatomic, retain) IBOutlet NSMutableArray* JSON;

- (id) initWithDataForURLString:(NSString*)URLString;
- (void) getDataForURLString:(NSString*)URLString;


@end
