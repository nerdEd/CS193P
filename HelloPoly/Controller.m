#import "Controller.h"

@implementation Controller

- (void)awakeFromNib { 
	[polygon setMinimumNumberOfSides: 3];
	[polygon setMaximumNumberOfSides: 12];
	[polygon setNumberOfSides: 4];
	[self updateInterface];
}

- (IBAction)decrease {
	[polygon setNumberOfSides: polygon.numberOfSides - 1];
	[self updateInterface];
}

- (IBAction)increase {
	[polygon setNumberOfSides: polygon.numberOfSides + 1];
	[self updateInterface];
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