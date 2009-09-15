//
//  Person.m
//  Presence
//
//  Created by Ed Schmalzle on 9/3/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Person.h"


@implementation Person

@synthesize name, avatar, statusUpdates, username;

- (Person*)initWithName: (NSString*) aName Username: (NSString*) aUsername AndAvatar: (NSString*) image {
	if( self = [super init] ) {
		self.name = aName;
		self.username = aUsername;
		self.avatar = image;
	}
	return self;
}
@end