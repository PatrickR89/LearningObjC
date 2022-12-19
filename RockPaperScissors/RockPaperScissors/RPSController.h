//
//  RSPController.h
//  RockPaperScissors
//
//  Created by Patrick on 19.12.2022..
//

#import <Foundation/Foundation.h>
#import "RPSMove.h"
#import "RPSGame.h"

NS_ASSUME_NONNULL_BEGIN

@interface RSPController : NSObject

@property (nonatomic) RPSGame *game;

- (void)throwDown: (Move) playersTurn;
- (BOOL)defeats: (RPSMove*) move;

@end

NS_ASSUME_NONNULL_END
