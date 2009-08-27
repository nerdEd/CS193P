//
//  HelloPolyAppDelegate.h
//  HelloPoly
//
//  Created by Ed Schmalzle on 8/23/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PolygonShape.h"

@interface HelloPolyAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	IBOutlet PolygonShape *polygon;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

