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
	NSString *avatar;
	NSString *status;
}

@property(nonatomic, retain) NSString *name;
@property(nonatomic, retain) NSString *avatar;
@property(nonatomic, retain) NSString *status;

- (Person*)initWithName: (NSString*) aName Status: (NSString*) aStatus AndAvatar: (NSString*) image;
@end