//
//  PCMasterViewController.m
//  PCPartynaut
//
//  Created by Jim Hall on 4/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PCMasterViewController.h"
#import "PCMap.h"
#import "PCAppDelegate.h"
#import <MapKit/MapKit.h>

@implementation PCMasterViewController
@synthesize map;

@synthesize managedObjectContext, mapView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    mapView = [[PCMap alloc]initWithMapView:map];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setMap:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void)viewWillAppear:(BOOL)animated{
    
    self.navigationController.navigationBar.hidden=YES;
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)concerts:(id)sender {
    [self.mapView toggleTag:@"CONCERT"];
    [self.mapView updateMap];
}

- (IBAction)deals:(id)sender {
    [self.mapView toggleTag:@"DEAL"];
    [self.mapView updateMap];
}

- (IBAction)parties:(id)sender {
    [self.mapView toggleTag:@"PARTY"];
    [self.mapView updateMap];
}
@end
