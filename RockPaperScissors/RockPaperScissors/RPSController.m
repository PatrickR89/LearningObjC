//
//  RSPController.m
//  RockPaperScissors
//
//  Created by Patrick on 19.12.2022..
//

#import "RPSController.h"

@implementation RSPController

- (void)throwDown:(Move)playersTurn {
    RPSMove *playerTurn = [[RPSMove alloc] initWithMove:playersTurn];
    RPSMove *compTurn = [[RPSMove alloc] init];

    self.game = [[RPSGame alloc] initWithFirstTurn:playerTurn
                                        secondTurn:compTurn];
}

- (NSString*)messageForGame:(RPSGame *)game {
    if (game.firstTurn.move == game.secondTurn.move) {
        return @"It's a tie!";
    }

    NSString *winningMove = [[game winner] description];
    NSString *losingMove = [[game loser] description];
    NSString *result = [game resultsString:game];

    NSString *wholeString = [NSString stringWithFormat:@"%@ %@ %@%@ %@", winningMove, @"beats", losingMove, @".", result];

    return wholeString;
}

@end
