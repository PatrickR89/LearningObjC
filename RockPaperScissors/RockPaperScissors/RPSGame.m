//
//  RPSGame.m
//  RockPaperScissors
//
//  Created by Patrick on 16.12.2022..
//

#import "RPSGame.h"

@implementation RPSGame

- (instancetype)initWithFirstTurn:(RPSMove *)playerTurn secondTurn:(RPSMove *)computerTurn {
    self = [super init];

    if(self) {
        _firstTurn = playerTurn;
        _secondTurn = computerTurn;
    }

    return self;
}

- (RPSMove*) winner {
    return [self.firstTurn defeats:self.secondTurn] ? self.firstTurn : self.secondTurn;
}

- (RPSMove*) loser {
    return [self.firstTurn defeats:self.secondTurn] ? self.secondTurn : self.firstTurn;
}

- (NSString*) resultsString:(RPSGame *)gameRes {
    if ([self.firstTurn defeats:self.secondTurn]) {
        return @"You win!";
    } else {
        return @"You loose!";
    }

    return @"Ran away!";
}

@end
