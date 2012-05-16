//
//  custAnnotation.m
//  shorelineStandardApp
//
//  Created by Jim Hall on 2/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "custAnnotation.h"

@implementation custAnnotation
@synthesize coordinate, title, subtitle, Codes, Pin, ID;



- (void)dealloc{
    self.title = nil;
    self.subtitle = nil;
}

@end
