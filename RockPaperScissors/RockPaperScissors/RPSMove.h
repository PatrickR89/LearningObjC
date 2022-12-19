//
//  RPSMove.h
//  RockPaperScissors
//
//  Created by Patrick on 16.12.2022..
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, Move) {
    Rock,
    Paper,
    Scissors,
    Invalid
};

@interface RPSMove : NSObject

@property (nonatomic) Move move;

- (instancetype)initWithMove: (Move) move;

@end

NS_ASSUME_NONNULL_END
