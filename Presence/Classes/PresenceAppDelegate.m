//
//  PresenceAppDelegate.m
//  Presence
//
//  Created by Ed Schmalzle on 9/2/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "PresenceAppDelegate.h"
#import "PersonListViewController.h"

@implementation PresenceAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(UIApplication *)application {        	
	PersonListViewController *personListViewController = [[PersonListViewController alloc] initWithNibName: @"PersonList" bundle: [NSBundle mainBundle]];
	
	navigationController = [[UINavigationController alloc] init];
	[navigationController pushViewController:personListViewController animated: YES];
	
	[personListViewController release];
	
	[window addSubview: navigationController.view];
    [window makeKeyAndVisible];
}

- (void)dealloc {
	[navigationController release];
    [window release];	
    [super dealloc];
}

@end