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
@end
