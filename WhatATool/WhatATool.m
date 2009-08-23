#import <Foundation/Foundation.h>
#import "PolygonShape.h"

void PrintPathInfo() {
	NSString *path = @"~";
	path = [path stringByExpandingTildeInPath];
	
	NSLog( [NSString stringWithFormat: @"My home folder is at %@", path] );
	
	NSLog( @"The path components are:" );
	for( NSString *pathComponent in [path pathComponents] ) {
		NSLog( pathComponent );
	}
}

void PrintProcessInfo() {
	NSProcessInfo *processInfo = [NSProcessInfo processInfo];
	NSLog( [NSString stringWithFormat: @"Process Name: '%@' Process ID: '%d'", [processInfo processName], [processInfo processIdentifier] ] );
}

void PrintBookmarkInfo() {
	NSMutableDictionary *bookmarks = [NSMutableDictionary dictionaryWithCapacity: 5];
	[bookmarks setValue: [NSURL URLWithString:@"http://www.stanford.edu"] forKey: @"Stanford University"];
	[bookmarks setValue: [NSURL URLWithString:@"http://www.apple.com"] forKey: @"Apple"];
	[bookmarks setValue: [NSURL URLWithString:@"http://cs193p.stanford.edu"] forKey: @"CS193P"];
	[bookmarks setValue: [NSURL URLWithString:@"http://itunes.stanford.edu"] forKey: @"Stanford on iTunes U"];
	[bookmarks setValue: [NSURL URLWithString:@"http://stanfordshop.com"] forKey: @"Stanford Mall"];
	
	for( NSString *dictionaryKey in [bookmarks allKeys] ) {
		if( [dictionaryKey hasPrefix: @"Stanford"] ) {
			NSLog( @"Key: '%@' URL: '%@'", dictionaryKey, [bookmarks valueForKey: dictionaryKey] );
		}
	}
}

void PrintIntrospectionInfo() {
	NSMutableArray *objectArray = [NSMutableArray arrayWithCapacity:5];
	[objectArray addObject:[NSString stringWithString:@"Franklin Mint"]];
	[objectArray addObject:[NSMutableString stringWithString:@"Mutable String"]];
	[objectArray addObject:[NSURL URLWithString:@"http://www.nerdEd.net"]];
	[objectArray addObject:[NSProcessInfo processInfo]];
	[objectArray addObject:[NSMutableArray arrayWithCapacity:1]];
	
	for( NSObject *object in objectArray ) {
		NSLog( [NSString stringWithFormat:@"Class name: %@", [object class] ]);
		
		NSString *isMemberOf = [ object isMemberOfClass: [NSString class] ] ? @"YES" : @"NO";
		NSLog( [NSString stringWithFormat:@"Is Member of NSString: %@", isMemberOf ] );
		
		NSString *isKindOf = [object isKindOfClass: [NSString class] ] ? @"YES" : @"NO";
		NSLog( [NSString stringWithFormat:@"Is Kind of NSString: %@", isKindOf ] );
		
		SEL selector = @selector( lowercaseString );
		if( [object respondsToSelector: selector] ) {
			NSLog( @"Responds to lowercaseString: YES" );
			NSLog( [NSString stringWithFormat: @"lowercaseString is: %@", [object lowercaseString] ] );
		}
		else {
			NSLog( @"Responds to lowercaseString: NO" );
		}
		
		NSLog(@"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
	}
}

void PrintPolygonInfo() {
	PolygonShape *square = [[PolygonShape alloc] initWithNumberOfSides:4 minimumNumberOfSides:3 maximumNumberOfSides:7];
	NSLog( [square description] );
	PolygonShape *hexagon = [[PolygonShape alloc] initWithNumberOfSides:6 minimumNumberOfSides:5 maximumNumberOfSides:9];
	NSLog( [hexagon description] );
	PolygonShape *dodecagon = [[PolygonShape alloc] initWithNumberOfSides:12 minimumNumberOfSides:9 maximumNumberOfSides:12];
	NSLog( [dodecagon description] );
	
	NSMutableArray *polygonArray = [[NSMutableArray alloc] init];
	[polygonArray addObject: square];
	[polygonArray addObject: hexagon];
	[polygonArray addObject:dodecagon];
	
	for( PolygonShape *shape in polygonArray) {
		[shape setNumberOfSides: 10];
	}
	
	[polygonArray release];
	[square release];
	[hexagon release];
	[dodecagon release];
}

int main (int argc, const char * argv[]) {
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

	PrintPathInfo();	
	NSLog(@"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
	PrintProcessInfo();
	NSLog(@"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
	PrintBookmarkInfo();
	NSLog(@"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
	PrintIntrospectionInfo();
	NSLog(@"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
	PrintPolygonInfo();
	
	[pool release];
	
    return 0;	
}