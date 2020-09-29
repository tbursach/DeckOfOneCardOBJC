//
//  TJBCardController.m
//  DeckOfOneCardsObJC
//
//  Created by Trevor Bursach on 9/29/20.
//

#import "TJBCardController.h"
#import "TJBCard.h"

@implementation TJBCardController

static NSString * const baseURLString = @"https://deckofcardsapi.com/api/deck";
static NSString * const drawEndpoint = @"/new/draw/";
static NSString * const countEndpoint = @"count";

+ (void)drawNewCard:(NSInteger)numberOfCards completion:(void (^)(NSArray<TJBCard *> *, NSError *))completion
{
    NSString *cardCount = [@(numberOfCards) stringValue];
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *drawURL = [baseURL URLByAppendingPathComponent:drawEndpoint];

    NSURLComponents *components = [NSURLComponents componentsWithURL:drawURL resolvingAgainstBaseURL:true];
    
    NSURLQueryItem *query = [NSURLQueryItem queryItemWithName:countEndpoint value:cardCount];
    
    components.queryItems = @[query];
    NSURL *finalURL = components.URL;
    NSLog(@"%@", finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

        if (error)
        {
            NSLog(@"There was an error %@, %@", error, error.localizedDescription);
            return completion(nil, error);
        }

        if (data)
        {
            NSLog(@"There appears to be no data.");
            return completion(nil, error);
        }

        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options: 2 error:&error];
        
        if (!jsonDictionary || ![jsonDictionary isKindOfClass: [NSDictionary class]])
        {
            NSLog(@"Unable to create a dictionary from the data.");
            return completion(nil, error);
        }
        
        NSArray *cards = jsonDictionary[@"cards"];
        NSMutableArray *placeholderCards = [NSMutableArray array];
        
        for (NSDictionary *cardDictionary in cards)
        {
            TJBCard *card = [[TJBCard alloc] initDict:cardDictionary];
            [placeholderCards addObject:card];
        }
        completion(placeholderCards, nil);
    }] resume];

}

+ (void)fetchCardImage:(TJBCard *)card completion:(void (^)(UIImage *))completion
{
    NSURL *imageURL = [NSURL URLWithString:card.image];
    NSLog(@"%@", imageURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                
        if (error)
        {
            NSLog(@"There was an error fetching image: %@, %@", error, error.localizedDescription);
            return completion(nil);
        }
        
        if (!data)
        {
            NSLog(@"There was no data found for out image.");
            return completion(nil);
        }
        
        UIImage *image = [UIImage imageWithData:data];
        completion(image);

    }] resume];
}


@end
