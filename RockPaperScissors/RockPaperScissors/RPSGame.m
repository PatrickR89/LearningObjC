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

@end
