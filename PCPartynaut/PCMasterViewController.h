//
//  PCMasterViewController.h
//  PCPartynaut
//
//  Created by Chris Mack on 4/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "PCMap.h"
@interface PCMasterViewController : UIViewController

@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;
@property (nonatomic,strong) PCMap* mapView;
@property (weak, nonatomic) IBOutlet MKMapView *map;

- (IBAction)concerts:(id)sender;
- (IBAction)deals:(id)sender;
- (IBAction)parties:(id)sender;

@end
