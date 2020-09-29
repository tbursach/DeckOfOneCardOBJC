//
//  TJBCardController.h
//  DeckOfOneCardsObJC
//
//  Created by Trevor Bursach on 9/29/20.
//

#import <Foundation/Foundation.h>
@class TJBCard;
#import <UIKit/UIKit.h>

@interface TJBCardController : NSObject

+ (void)drawNewCard:(NSInteger)numberOfCards completion:(void(^) (NSArray<TJBCard *> *cards, NSError *error))completion;

+ (void)fetchCardImage: (TJBCard *)card completion:(void (^) (UIImage *))completion;

@end
