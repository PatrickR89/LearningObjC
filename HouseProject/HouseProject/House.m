//
//  House.m
//  HouseProject
//
//  Created by Patrick on 16.12.2022..
//

#import "House.h"

@interface House()

@property (nonatomic, readwrite) int numberOfBedrooms;

@end

@implementation House
-(instancetype)initWithAddress:(NSString *)address {
    self = [super init];
    // only run if self has a value
    if (self) {
        _address = [address copy];
        _numberOfBedrooms = 4;
        _hasHotTub = false;
    }
    return self;
}
@end
