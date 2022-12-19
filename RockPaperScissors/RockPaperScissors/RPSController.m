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

- (BOOL)defeats:(RPSMove *)move {
    return false;
}
@end
