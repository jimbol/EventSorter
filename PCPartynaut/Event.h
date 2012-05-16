//
//  Event.h
//  PCPartynaut
//
//  Created by Chris Mack on 4/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Type;

@interface Event : NSManagedObject

@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * country;
@property (nonatomic, retain) NSNumber * creationTime;
@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) NSNumber * endDateTime;
@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSNumber * imageID;
@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSString * locationName;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * parentID;
@property (nonatomic, retain) NSString * privacyCode;
@property (nonatomic, retain) NSNumber * rating;
@property (nonatomic, retain) NSNumber * startDateTime;
@property (nonatomic, retain) NSString * state;
@property (nonatomic, retain) NSString * street1;
@property (nonatomic, retain) NSString * street2;
@property (nonatomic, retain) NSNumber * updatedDateTime;
@property (nonatomic, retain) NSSet *types;
@end

@interface Event (CoreDataGeneratedAccessors)

- (void)addTypesObject:(Type *)value;
- (void)removeTypesObject:(Type *)value;
- (void)addTypes:(NSSet *)values;
- (void)removeTypes:(NSSet *)values;

@end
