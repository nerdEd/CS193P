//
//  Person.m
//  Presence
//
//  Created by Ed Schmalzle on 9/3/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Person.h"


@implementation Person

@synthesize name, avatar, status;

- (Person*)initWithName: (NSString*) aName Status: (NSString*) aStatus AndAvatar: (NSString*) image {
	if( self = [super init] ) {
		[self setName:aName];
		[self setAvatar:image];
		[self setStatus:aStatus];
	}
	return self;
}
@end