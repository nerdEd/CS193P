//
//  TwitterHelper.m
//  Presence
//

#import "TwitterHelper.h"
#import "JSON.h"

@implementation TwitterHelper

+ (id)fetchJSONValueForURL:(NSURL *)url
{
    NSString *jsonString = [[NSString alloc] initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    
    id jsonValue = [jsonString JSONValue];
    
	[jsonString release];
    
    return jsonValue;
}

+ (NSDictionary *)fetchInfoForUsername:(NSString *)username
{
    NSString *urlString = [NSString stringWithFormat:@"http://twitter.com/users/show/%@.json", username];
    NSURL *url = [NSURL URLWithString:urlString];
    return [self fetchJSONValueForURL:url];
}


+ (NSArray *)fetchTimelineForUsername:(NSString *)username
{
    NSString *urlString = [NSString stringWithFormat:@"http://twitter.com/statuses/user_timeline/%@.json", username];
    NSURL *url = [NSURL URLWithString:urlString];
    return [self fetchJSONValueForURL:url];
}

@end
