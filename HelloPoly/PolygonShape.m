//
//  PolygonShape.m
//  WhatATool
//
//  Created by Ed Schmalzle on 8/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PolygonShape.h"

@implementation PolygonShape

@synthesize numberOfSides, minimumNumberOfSides, maximumNumberOfSides;

- (id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min maximumNumberOfSides:(int)max {
	if( self = [super init] ) {
		[ self setMinimumNumberOfSides: min ];
		[ self setMaximumNumberOfSides: max ];
		[ self setNumberOfSides: sides ];
	}
	return self;
}

- (id)init {
	return [self initWithNumberOfSides:5 minimumNumberOfSides:3 maximumNumberOfSides:10 ];
}

- (float)angleInDegrees {
	return (180 * (numberOfSides - 2) / numberOfSides);
}

- (float)angleInRadians {
	return [self angleInDegrees] * ( M_PI / 180 );
}

- (NSString*)name {
	NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
						  @"Triangle", [NSNumber numberWithInt:3],
						  @"Quadrilateral", [NSNumber numberWithInt:4],
						  @"Pentagon", [NSNumber numberWithInt:5],
						  @"Hexagon", [NSNumber numberWithInt:6],
						  @"Heptagon", [NSNumber numberWithInt:7],
						  @"Octagon", [NSNumber numberWithInt:8],
						  @"Nonagon", [NSNumber numberWithInt:9],
						  @"Decagon", [NSNumber numberWithInt:10],
						  @"Hendecagon", [NSNumber numberWithInt:11],
						  @"Dodecagon", [NSNumber numberWithInt:12],
						  nil];
	return [dict objectForKey:[NSNumber numberWithInt:numberOfSides]];
}

- (NSString *) description {
	return [NSString stringWithFormat: @"Hello I am a %d-sided polygon (aka a %@) with angles of %.2f degrees (%.4f radians).", numberOfSides, [self name], [self angleInDegrees], [self angleInRadians] ];
}

- (void)setNumberOfSides:( int ) value { 
	if( value < minimumNumberOfSides ){
		NSLog( [NSString stringWithFormat: @"Invalid number of sides: %d is less than the minimum of %d allowed", value, minimumNumberOfSides ] );
	}
	else if( value > maximumNumberOfSides ) {
		NSLog( [NSString stringWithFormat: @"Invalid number of sides: %d is greater than the maximum %d allowed", value, maximumNumberOfSides ] );
	}
    else {
		numberOfSides = value; 
	}
}

- (void)setMinimumNumberOfSides:( int ) value { 
	if( value <= 2 ) {
		NSLog( [NSString stringWithFormat: @"Invalid number of sides: %d is less than the minumum of 2", value ] );			  
	}
	else {
		minimumNumberOfSides = value;
	}
}

- (void)setMaximumNumberOfSides:( int ) value { 
	if( value > 12 ) {
		NSLog( [NSString stringWithFormat: @"Invalid number of sides: %d is greater than maximum of 12", value ] );
	}
	else {
		maximumNumberOfSides = value;
	}
}

- (void) dealloc {
	NSLog( @"Dealloc!" );
	[super dealloc];
}

@end
