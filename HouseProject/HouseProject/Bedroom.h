//
//  Bedroom.h
//  HouseProject
//
//  Created by Patrick on 16.12.2022..
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, Direction) {
    North,
    South,
    West,
    East
};

@interface Bedroom : NSObject

@property (nonatomic) BOOL privateBath;
@property (nonatomic) Direction directionWindowFaces;

@end

NS_ASSUME_NONNULL_END
