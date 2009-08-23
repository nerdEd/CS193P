//
//  PolygonShape.h
//  WhatATool
//
//  Created by Ed Schmalzle on 8/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PolygonShape : NSObject {
	int numberOfSides;
	int minimumNumberOfSides;
	int maximumNumberOfSides;
}

@property int numberOfSides;
@property int minimumNumberOfSides;
@property int maximumNumberOfSides;

-(id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min maximumNumberOfSides:(int)max; 
-(float)angleInDegrees;
-(float)angleInRadians;
-(NSString *)name;

@end
