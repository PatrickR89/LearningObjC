//
//  RPSMove.m
//  RockPaperScissors
//
//  Created by Patrick on 16.12.2022..
//

#import "RPSMove.h"

@implementation RPSMove

- (instancetype)initWithMove:(Move)move {
    self = [super init];

    if(self) {
        _move = move;
    }

    return self;
}

- (instancetype)init {
    self = [super init];


    if(self) {
        _move = [self generateMove];
    }

    return self;
}

- (Move)generateMove {

    NSUInteger randomNumber = arc4random_uniform(3);

    switch(randomNumber) {
        case 0:
            return Rock;
            break;
        case 1:
            return Paper;
            break;
        case 2:
            return Scissors;
            break;
        default:
            return Invalid;
            break;
    }

    return Rock;
}

- (BOOL)defeats:(RPSMove *)opponent {
    if ((self.move == Paper && opponent.move == Rock) ||
        (self.move == Scissors && opponent.move == Paper) ||
        (self.move == Rock && opponent.move == Scissors)) {
        return true;
    } else {
        return false;
    }
}

- (NSString*)description {
    switch (self.move) {
        case 0:
            return @"Rock";
            break;
        case 1:
            return @"Paper";
            break;
        case 2:
            return @"Scissors";
            break;
        default:
            return @"Missed move";
            break;
    }

    return @"No such move";
}
@end
