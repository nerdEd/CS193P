//
//  PersonDetailViewController.m
//  Presence
//
//  Created by Ed Schmalzle on 9/2/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PersonDetailViewController.h"
#import "TwitterHelper.h"


@implementation PersonDetailViewController

@synthesize person;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {

    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
	self.title = person.name;
	person.statusUpdates = [TwitterHelper fetchTimelineForUsername: person.username];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [person.statusUpdates count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"StatusUpdateCell"];
	
	if (cell == nil) { 
		cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: @"StatusUpdateCell" ]; 
		cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
        cell.textLabel.numberOfLines = 0;
	} 
	
	cell.textLabel.text = [[person.statusUpdates objectAtIndex: indexPath.row] objectForKey: @"text"];
	return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath { 
	NSString *text = [[person.statusUpdates objectAtIndex: indexPath.row] objectForKey: @"text"]; 
	UIFont *font = [UIFont systemFontOfSize: 22 ]; 
	CGSize withinSize = CGSizeMake( 350, 1000);
	CGSize size = [text sizeWithFont:font 
						constrainedToSize:withinSize 
						lineBreakMode:UILineBreakModeWordWrap]; 
    return size.height; 
}

@end