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
#import "TwitterHelper.h"

@implementation PersonListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		self.title = @"People";
		// Load array of twitter people from the plist
		NSString *plistPath = [[NSBundle mainBundle] pathForResource: @"TwitterUsers" ofType: @"plist"];
		NSArray *usernameList = [NSArray arrayWithContentsOfFile: plistPath];
		tweeps = [[NSMutableArray alloc] init];
		for( NSString *username in usernameList ) {
			NSDictionary *userInfo = [TwitterHelper fetchInfoForUsername: username];
			NSLog( [userInfo objectForKey: @"name" ] );
			NSString *name = [userInfo objectForKey: @"name"];
			if( name == nil ) {
				name = [userInfo objectForKey: @"user_name"];
			}
			Person *person = [[Person alloc] initWithName: name
											 Username: [userInfo objectForKey: @"screen_name"] 
											 AndAvatar: [userInfo objectForKey: @"profile_image_url"]];
			[tweeps addObject: person];
			[person release];
		}
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [tweeps count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"PersonCell"];
	
	if (cell == nil) { 
		cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: @"PersonCell" ]; 
	} 
	
	Person *person = [tweeps objectAtIndex: indexPath.row];
	cell.text = person.name;
	NSURL *url = [NSURL URLWithString:person.avatar];
	NSData *data = [NSData dataWithContentsOfURL:url];
	UIImage *img = [[UIImage alloc] initWithData:data];
	cell.image = img;
	[img release];
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	PersonDetailViewController *personDetailViewController = [[PersonDetailViewController alloc] initWithNibName: @"PersonDetail" bundle: [NSBundle mainBundle]];
	personDetailViewController.person = [tweeps objectAtIndex: indexPath.row];
	[self.navigationController pushViewController: personDetailViewController animated: YES];	
	[personDetailViewController release];
}

@end