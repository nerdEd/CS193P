//
//  PersonDetailViewController.h
//  Presence
//
//  Created by Ed Schmalzle on 9/2/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface PersonDetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
	Person *person;
}

@property(nonatomic, retain) Person *person;

@end