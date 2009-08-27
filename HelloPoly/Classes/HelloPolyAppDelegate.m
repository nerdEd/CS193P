//
//  HelloPolyAppDelegate.m
//  HelloPoly
//
//  Created by Ed Schmalzle on 8/23/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "HelloPolyAppDelegate.h"

@implementation HelloPolyAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}

- (void)applicationWillTerminate:(UIApplication *)application {
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
	[userDefaults setInteger: polygon.numberOfSides forKey: @"sides"];
}

- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
