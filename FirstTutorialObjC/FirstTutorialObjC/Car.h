//
//  Car.h
//  FirstTutorialObjC
//
//  Created by Patrick on 25.11.2022..
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Car : NSObject

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) Car *anotherCar;

@property (nonatomic) int mileage;

@end

NS_ASSUME_NONNULL_END
