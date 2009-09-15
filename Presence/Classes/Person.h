//
//  Person.h
//  Presence
//
//  Created by Ed Schmalzle on 9/3/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Person : NSObject {
	NSString *name;
	NSString *username;
	NSString *avatar;
	NSArray *statusUpdates;
}

@property(nonatomic, retain) NSString *name;
@property(nonatomic, retain) NSString *username;
@property(nonatomic, retain) NSString *avatar;
@property(nonatomic, retain) NSArray *statusUpdates;

- (Person*)initWithName: (NSString*) aName Username: (NSString*) aUsername AndAvatar: (NSString*) image;
@end