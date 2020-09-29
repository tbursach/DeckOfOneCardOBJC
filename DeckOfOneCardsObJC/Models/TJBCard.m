//
//  Card.m
//  DeckOfOneCardsObJC
//
//  Created by Trevor Bursach on 9/29/20.
//

#import "TJBCard.h"

static NSString * const suitKey = @"suit";
static NSString * const imageKey = @"image";

@implementation TJBCard

- (instancetype)initCard:(NSString *)suit imageString:(NSString *)image
{
    self = [super init];
    
    if (self)
    {
        _suit = suit;
        _image = image;
    }
    return self;
}

- (instancetype)initDict:(NSDictionary *)dictionary
{
    NSString *suit = dictionary[suitKey];
    NSString *image = dictionary[imageKey];
    
    return [self initCard:suit imageString:image];
}

@end


