#import "Controller.h"

@implementation Controller

- (void)awakeFromNib { 
	[polygon setMinimumNumberOfSides: 3];
	[polygon setMaximumNumberOfSides: 12];
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
	int sides = [userDefaults integerForKey: @"sides"];
	if( sides == 0 ) {
		sides = 4;
	}
	[polygon setNumberOfSides: sides];
	[self updateInterface];
}

- (IBAction)decrease {
	[polygon setNumberOfSides: polygon.numberOfSides - 1];
	[self updateInterface];	
	[polygonView setNeedsDisplay]; 
}

- (IBAction)increase {
	[polygon setNumberOfSides: polygon.numberOfSides + 1];
	[self updateInterface];	
	[polygonView setNeedsDisplay]; 
}

- (void)updateInterface {
	numberOfSidesLabel.text = [NSString stringWithFormat: @"%d", polygon.numberOfSides];
	
	if( polygon.numberOfSides == polygon.maximumNumberOfSides ) {
		increaseButton.enabled = NO;
	}
	else {
		increaseButton.enabled = YES;
	}
	
	if( polygon.numberOfSides == polygon.minimumNumberOfSides ) {
		decreaseButton.enabled = NO;
	}
	else {
		decreaseButton.enabled = YES;
	}
}

@end