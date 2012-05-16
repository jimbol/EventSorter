//
//  custAnnotation.h
//  shorelineStandardApp
//
//  Created by Chris Mack on 2/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface custAnnotation : NSObject<MKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* subtitle;
@property (nonatomic, retain) IBOutlet NSMutableArray* Codes;
@property (nonatomic, retain) MKPinAnnotationView* Pin;
@property (nonatomic) IBOutlet NSInteger ID;

- (void)viewDidAppear:(BOOL)animated;

@end
