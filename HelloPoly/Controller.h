#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PolygonShape.h"
#import "PolygonView.h"
 
@interface Controller : NSObject {
    IBOutlet UIButton *decreaseButton;
    IBOutlet UIButton *increaseButton;
    IBOutlet UILabel *numberOfSidesLabel;
	IBOutlet PolygonShape *polygon;
	IBOutlet PolygonView *polygonView;
	IBOutlet UISlider *slider;
}

- (IBAction)decrease;
- (IBAction)increase;
- (IBAction)sliderUpdate;
- (void)updateInterface;

@end