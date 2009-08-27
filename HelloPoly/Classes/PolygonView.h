//
//  PolygonView.h
//  HelloPoly
//
//  Created by Ed Schmalzle on 8/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PolygonShape.h"

@interface PolygonView : UIView {
	IBOutlet PolygonShape *polygon;
}

+ (NSArray *)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)numberOfSides;

@end
