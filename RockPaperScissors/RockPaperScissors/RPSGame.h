//
//  RPSGame.h
//  RockPaperScissors
//
//  Created by Patrick on 16.12.2022..
//

#import <Foundation/Foundation.h>
#import "RPSMove.h"

NS_ASSUME_NONNULL_BEGIN

@interface RPSGame : NSObject

@property (nonatomic) RPSMove *firstTurn;
@property (nonatomic) RPSMove *secondTurn;

- (instancetype)initWithFirstTurn: (RPSMove*)playerTurn secondTurn: (RPSMove*)computerTurn;
@end

NS_ASSUME_NONNULL_END
