//
//  PersonDetailViewController.m
//  Presence
//
//  Created by Ed Schmalzle on 9/2/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PersonDetailViewController.h"


@implementation PersonDetailViewController

@synthesize person;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		self.title = @"Detail";
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
	nameLabel.text = person.name;
	statusLabel.text = person.status;
	avatarImage.image = [UIImage imageNamed: person.avatar];
}

@end