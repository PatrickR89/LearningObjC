//
//  Car.m
//  FirstTutorialObjC
//
//  Created by Patrick on 25.11.2022..
//

#import "Car.h"

@interface Car()
{
    // instance var for name property
    NSString *_name;
}
@end

@implementation Car

// setter method for name property
- (void)setName:(NSString *)value

{
    _name = [value lowercaseString];
    self.mileage = 10000000;
}

// getter method for name property
- (NSString *)name
{
    return _name;
}

@end
