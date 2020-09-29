//
//  Card.h
//  DeckOfOneCardsObJC
//
//  Created by Trevor Bursach on 9/29/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TJBCard : NSObject

@property (nonatomic, copy, readonly) NSString *suit;
@property (nonatomic, copy, readonly) NSString *image;

-(instancetype)initCard:(NSString *)suit
            imageString:(NSString *)image;

- (instancetype)initDict:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
