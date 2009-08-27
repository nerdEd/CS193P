//
//  PolygonView.m
//  HelloPoly
//
//  Created by Ed Schmalzle on 8/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PolygonView.h"

@implementation PolygonView


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect { 
	CGContextRef context = UIGraphicsGetCurrentContext(); 
	
	CGContextBeginPath (context); 
	
	int first = 0;
	for( NSValue *polygonPoint in [PolygonView pointsForPolygonInRect: [self bounds] numberOfSides: polygon.numberOfSides] ) {
		CGPoint point = [ polygonPoint CGPointValue];
		if( first == 0 ) {
			CGContextMoveToPoint( context, point.x, point.y );
			first++;
		}
		else {
			CGContextAddLineToPoint (context, point.x, point.y );
		}
	}
	
	CGContextClosePath (context); 
	
	[[UIColor redColor] setFill]; 
	[[UIColor blackColor] setStroke]; 
	
	CGContextDrawPath (context, kCGPathFillStroke); 
}

+ (NSArray *)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)numberOfSides { 
	CGPoint center = CGPointMake(rect.size.width / 2.0, rect.size.height / 2.0); 
	float radius = 0.8 * center.x; 
	NSMutableArray *result = [NSMutableArray array]; 
	float angle = (2.0 * M_PI) / numberOfSides; 
	float exteriorAngle = M_PI - angle; 
	float rotationDelta = angle - (0.5 * exteriorAngle); 
	
	for (int currentAngle = 0; currentAngle < numberOfSides; currentAngle++) { 
		float newAngle = (angle * currentAngle) - rotationDelta; 
		float curX = cos(newAngle) * radius; 
		float curY = sin(newAngle) * radius; 
		[result addObject:[NSValue valueWithCGPoint:CGPointMake(center.x + curX, 
																center.y + curY)]]; 
	} 
	
	return result; 
} 

- (void)dealloc {
    [super dealloc];
}


@end
