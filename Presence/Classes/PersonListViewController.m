//
//  PersonListViewController.m
//  Presence
//
//  Created by Ed Schmalzle on 9/2/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PersonListViewController.h"
#import "PersonDetailViewController.h"
#import "Person.h"

@implementation PersonListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		self.title = @"People";
		neo = [[Person alloc] initWithName: @"Neo" Status: @"Saving the world" AndAvatar: @"neo.jpg"];
		smith = [[Person alloc] initWithName: @"Smith" Status: @"Destroying Neo" AndAvatar: @"smith.jpg"];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
	neoNameLabel.text = neo.name;
	neoAvatar.image = [UIImage imageNamed: neo.avatar];
	smithNameLabel.text = smith.name;
	smithAvatar.image = [UIImage imageNamed: smith.avatar];
}

- (void)showDetailsForPerson:(Person *) person {
	PersonDetailViewController *personDetailViewController = [[PersonDetailViewController alloc] initWithNibName: @"PersonDetail" bundle: [NSBundle mainBundle]];
	personDetailViewController.person = person;
	[self.navigationController pushViewController: personDetailViewController animated: YES];	
	[personDetailViewController release];
}

- (IBAction)showDetailsForNeo {
	[self showDetailsForPerson: neo];
}

- (IBAction)showDetailsForSmith {
	[self showDetailsForPerson: smith];	
}

@end