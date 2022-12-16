//
//  House.h
//  HouseProject
//
//  Created by Patrick on 16.12.2022..
//

#import <Foundation/Foundation.h>
#import "Bedroom.h"

NS_ASSUME_NONNULL_BEGIN

@interface House : NSObject

@property (nonatomic, copy) NSString *address;
@property (nonatomic, readonly) int numberOfBedrooms;
@property (nonatomic) BOOL hasHotTub;

@property (nonatomic) Bedroom *frontBedroom;
@property (nonatomic) Bedroom *backBedroom;

-(instancetype)initWithAddress:(NSString*) address;

@end

NS_ASSUME_NONNULL_END
