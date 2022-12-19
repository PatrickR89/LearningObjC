//
//  main.m
//  RockPaperScissors
//
//  Created by Patrick on 16.12.2022..
//

#import <Foundation/Foundation.h>
#import "RPSController.h"
#import "RPSMove.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        RSPController *gameController = [[RSPController alloc] init];

        [gameController throwDown:Rock];
        NSLog(@"Hello, World!");
    }
    return 0;
}
