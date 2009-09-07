//
//  PersonListViewController.h
//  Presence
//
//  Created by Ed Schmalzle on 9/2/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface PersonListViewController : UIViewController {
	Person *neo;
	Person *smith;
	IBOutlet UILabel *neoNameLabel;
	IBOutlet UIImageView *neoAvatar;
	IBOutlet UILabel *smithNameLabel;
	IBOutlet UIImageView *smithAvatar;
}


- (void)showDetailsForPerson:(Person *) person;
- (IBAction)showDetailsForNeo;
- (IBAction)showDetailsForSmith;

@end
