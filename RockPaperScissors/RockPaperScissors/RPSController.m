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

- (BOOL)defeats:(RPSMove *)move {
    return false;
}
@end
